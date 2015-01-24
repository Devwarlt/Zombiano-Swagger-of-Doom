using log4net;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;

namespace wServer.networking
{
    public class UdpNetworkHandler
    {
        static ILog log = LogManager.GetLogger(typeof(NetworkHandler));

        enum ReceiveState
        {
            Awaiting,
            ReceivingHdr,
            ReceivingBody,
            Processing
        }
        class ReceiveToken
        {
            public int Length;
            public PacketID ID;
            public byte[] PacketBody;
        }
        enum SendState
        {
            Awaiting,
            Ready,
            Sending
        }
        class SendToken
        {
            public Packet Packet;
        }

        private Client client;
        private IPEndPoint clientEndPoint;
        private UdpClient skt;

        public const int BUFFER_SIZE = 0x10000;

        byte[] receiveBuff;

        SendState sendState = SendState.Awaiting;
        byte[] sendBuff;

        public UdpNetworkHandler(Client client, UdpPacket udpPacket)
        {
            this.client = client;
            this.clientEndPoint = udpPacket.EndPoint;
            this.skt = new UdpClient();//udpPacket.EndPoint);
            //this.skt.Connect(udpPacket.EndPoint);

            ProcessHello(udpPacket);
            //BeginHandling(udpPacket);
        }

        private void ProcessHello(UdpPacket udpPacket)
        {
            //skt.Connect(clientEndPoint);
            receiveBuff = new byte[BUFFER_SIZE];
            sendBuff = new byte[BUFFER_SIZE];

            try
            {
                if (udpPacket.Data.Length < 5)
                {
                    client.Disconnect();
                    return;
                }

                if (udpPacket.Data[0] == 0x3c && udpPacket.Data[1] == 0x70 &&
                    udpPacket.Data[2] == 0x6f && udpPacket.Data[3] == 0x6c && udpPacket.Data[4] == 0x69)
                {
                    ProcessPolicyFile();
                    return;
                }

                Packet pkt;
                if (!Packet.Packets.TryGetValue((PacketID)udpPacket.Data[4], out pkt))
                {
                    //skt.BeginSend(new byte[1] { 255 }, 1, clientEndPoint, SendCompleted, null);
                    return;
                }

                var receiveToken = CreateReceive(udpPacket.Data);

                var body = receiveToken.PacketBody;
                var id = receiveToken.ID;
                Buffer.BlockCopy(udpPacket.Data, 5, body, 0, body.Length);

                bool cont = OnPacketReceived(id, body);

                //if (cont) skt.BeginReceive(ReceiveCompleted, null);
            }
            catch (Exception ex)
            {
                OnError(ex);
            }
        }

        private void BeginHandling(UdpPacket udpPacket)
        {
            skt.BeginReceive(ReceiveCompleted, null);
        }

        

        

        //public void BeginHandling()
        //{
        //    skt.NoDelay = true;
        //    skt.UseOnlyOverlappedIO = true;
        //
        //    send = new SocketAsyncEventArgs();
        //    send.Completed += SendCompleted;
        //    send.UserToken = new SendToken();
        //    send.SetBuffer(sendBuff = new byte[BUFFER_SIZE], 0, BUFFER_SIZE);
        //
        //    receive = new SocketAsyncEventArgs();
        //    receive.Completed += ReceiveCompleted;
        //    receive.UserToken = new ReceiveToken();
        //    receive.SetBuffer(receiveBuff = new byte[BUFFER_SIZE], 0, BUFFER_SIZE);
        //
        //    receiveState = ReceiveState.ReceivingHdr;
        //    receive.SetBuffer(0, 5);
        //    if (!skt.ReceiveAsync(receive))
        //        ReceiveCompleted(this, receive);
        //}

        void ProcessPolicyFile()    //WUT.
        {
            var s = new MemoryStream();
            NWriter wtr = new NWriter(s);
            wtr.WriteNullTerminatedString(@"<cross-domain-policy>
     <allow-access-from domain=""*"" to-ports=""*"" />
</cross-domain-policy>");
            wtr.Write((byte)'\r');
            wtr.Write((byte)'\n');
            //skt.BeginSend(s.ToArray(), (int)s.Length, SendCompleted, s.Length);
            client.Disconnect();
        }

        //It is said that ReceiveAsync/SendAsync never returns false unless error
        //So...let's just treat it as always true

        private void ReceiveCompleted(IAsyncResult ar)
        {
            try
            {
                var data = skt.EndReceive(ar, ref clientEndPoint);

                if (data.Length < 5)
                {
                    client.Disconnect();
                    return;
                }

                if (data[0] == 0x3c && data[1] == 0x70 &&
                    data[2] == 0x6f && data[3] == 0x6c && data[4] == 0x69)
                {
                    ProcessPolicyFile();
                    return;
                }
                Packet pkt;
                if (!Packet.Packets.TryGetValue((PacketID)data[4], out pkt))
                {
                    //skt.BeginSend(new byte[1] { 255 }, 1, clientEndPoint, SendCompleted, null);
                }

                var receiveToken = CreateReceive(data);

                var body = receiveToken.PacketBody;
                var id = receiveToken.ID;
                Buffer.BlockCopy(data, 5, body, 0, body.Length);

                bool cont = OnPacketReceived(id, body);

                //if (cont) skt.BeginReceive(ReceiveCompleted, null);
                //else
                //{
                //    skt.BeginSend(new byte[1] { 255 }, 1, SendCompleted, null);
                //}
            }
            catch (Exception ex)
            {
                OnError(ex);
            }
        }

        private ReceiveToken CreateReceive(byte[] data)
        {
            ReceiveToken ret = new ReceiveToken();
            var receiveLength = new byte[5];
            Buffer.BlockCopy(data, 0, receiveLength, 0, 5);

            ret.Length = IPAddress.NetworkToHostOrder(BitConverter.ToInt32(receiveLength, 0)) - 5;
            if (ret.Length < 0 || ret.Length > BUFFER_SIZE)
                log.ErrorFormat("Buffer not large enough! (requested size={0})", ret.Length);
            ret.PacketBody = new byte[ret.Length];
            ret.ID = (PacketID)data[4];
            return ret;
        }

        void SendCompleted()
        {
            try
            {
                //int len = skt.EndSend(ar);
                sendState = SendState.Awaiting;
                //switch (sendState)
                //{
                //    case SendState.Ready:
                //        len = (ar.AsyncState as SendToken).Packet.Write(client, sendBuff, 0);
                //
                //        sendState = SendState.Sending;
                //        skt.SendAsync(e);
                //        break;
                //    case SendState.Sending:
                //        (e.UserToken as SendToken).Packet = null;
                //
                //        if (CanSendPacket(e, true))
                //        {
                //            len = (e.UserToken as SendToken).Packet.Write(parent, sendBuff, 0);
                //
                //            sendState = SendState.Sending;
                //            e.SetBuffer(0, len);
                //            skt.SendAsync(e);
                //        }
                //        break;
                //}
            }
            catch (Exception ex)
            {
                OnError(ex);
            }
        }


        void OnError(Exception ex)
        {
            log.Error("Socket error.", ex);
            client.Disconnect();
        }
        bool OnPacketReceived(PacketID id, byte[] pkt)
        {
            if (client.IsReady())
            {
                client.Manager.Network.AddPendingPacket(client, id, pkt);
                return true;
            }
            else
                return false;
        }
        ConcurrentQueue<Packet> pendingPackets = new ConcurrentQueue<Packet>();
        bool CanSendPacket(SendToken send, bool ignoreSending)
        {
            lock (sendLock)
            {
                if (sendState == SendState.Ready ||
                    (!ignoreSending && sendState == SendState.Sending))
                    return false;
                Packet packet;
                if (pendingPackets.TryDequeue(out packet))
                {
                    send.Packet = packet;
                    sendState = SendState.Ready;
                    return true;
                }
                else
                {
                    sendState = SendState.Awaiting;
                    return false;
                }
            }
        }

        object sendLock = new object();

        public void SendPacket(Packet pkt)
        {
            //if (!skt.Connected) return;
            pendingPackets.Enqueue(pkt);
            SendToken send = new SendToken();

            if (CanSendPacket(send, false))
            {
                var len = send.Packet.Write(client, sendBuff, 0);

                sendState = SendState.Sending;
                byte[] data = new byte[len];
                Buffer.BlockCopy(sendBuff, 0, data, 0, len);
                Program.Server.SendPacket(new UdpPacket { Data = data, EndPoint = clientEndPoint }, new Action(SendCompleted));
                //skt.BeginSend(sendBuff, len, SendCompleted, send);
            }
        }
        //public void SendPackets(IEnumerable<Packet> pkts)
        //{
        //    if (!skt.Connected) return;
        //    foreach (var i in pkts)
        //        pendingPackets.Enqueue(i);
        //    if (CanSendPacket(send, false))
        //    {
        //        var len = (send.UserToken as SendToken).Packet.Write(parent, sendBuff, 0);
        //
        //        sendState = SendState.Sending;
        //        send.SetBuffer(sendBuff, 0, len);
        //        if (!skt.SendAsync(send))
        //            SendCompleted(this, send);
        //    }
        //}

        public void Handle(byte[] data)
        {
            byte[] body;
            try
            {
                if (data.Length < 5)
                {
                    client.Disconnect();
                    return;
                }

                if (data[0] == 0x3c && data[1] == 0x70 &&
                    data[2] == 0x6f && data[3] == 0x6c && data[4] == 0x69)
                {
                    ProcessPolicyFile();
                    return;
                }
                Packet pkt;
                if (!Packet.Packets.TryGetValue((PacketID)data[4], out pkt))
                {
                    //skt.BeginSend(new byte[1] { 255 }, 1, SendCompleted, null);
                }

                var receiveToken = CreateReceive(data);

                body = new byte[receiveToken.PacketBody.Length];
                var id = receiveToken.ID;
                if (receiveToken.PacketBody.Length > data.Length - 5) return;
                Buffer.BlockCopy(data, 5, body, 0, body.Length);

                bool cont = OnPacketReceived(id, body);
            }
            catch (Exception e)
            {
                OnError(e);
            }
        }
    }
}
