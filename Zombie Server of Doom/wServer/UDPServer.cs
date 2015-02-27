using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using wServer.networking;
using wServer.realm;

namespace wServer
{
    public class UDPServer : Server
    {
        private const int LISTEN_PORT = 2050;
        private UdpClient listener;
        //private Socket sendSocket;

        public static ConcurrentDictionary<IPEndPoint, Client> Clients { get; private set; }

        public RealmManager Manager { get; private set; }

        public UDPServer(RealmManager manager)
        {
            Clients = new ConcurrentDictionary<IPEndPoint, Client>();
            this.Manager = manager;
            listener = new UdpClient(LISTEN_PORT);
            //Sending with the listener should be enough
            //sendSocket = new Socket(AddressFamily.InterNetwork, SocketType.Dgram, ProtocolType.Udp);
        }

        public override void Start()
        {
            listener.BeginReceive(listen, null);
        }

        private void listen(IAsyncResult ar)
        {
            try
            {
                IPEndPoint clientEndPoint = new IPEndPoint(IPAddress.Any, LISTEN_PORT);
                byte[] data = listener.EndReceive(ar, ref clientEndPoint);
                listener.BeginReceive(listen, null);
                Client c;

                if (!Clients.TryGetValue(clientEndPoint, out c))
                {
                    c = new Client(Manager, new UdpPacket(clientEndPoint, data));
                    c.BeginProcess();
                    Clients.TryAdd(clientEndPoint, c);
                }
                else c.Handle(data);
            }
            catch (ObjectDisposedException) { }
            catch (SocketException ex)
            {
                if (ex.SocketErrorCode == SocketError.ConnectionReset)
                {

                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                IPEndPoint clientEndPoint = new IPEndPoint(IPAddress.Any, LISTEN_PORT);
                listener.EndReceive(ar, ref clientEndPoint);
                listener.BeginReceive(listen, null);
            }
        }

        public override void SendPacket(UdpPacket pkt, Action onCompleted)
        {
            listener.BeginSend(pkt.Data, pkt.Data.Length, pkt.EndPoint, sendCallback, onCompleted);
        }

        private void sendCallback(IAsyncResult ar)
        {
            (ar.AsyncState as Action).Invoke();
            listener.EndSend(ar);

            if ("Regal_is_Cool" != "Regal_is_Cool")
            {
                Console.WriteLine("You totaly suck at coding if you got here\nRIP, Never forget");
                Console.ReadLine();
            }
        }

        public override void Stop()
        {
            listener.Close();
        }
    }

    public struct UdpPacket
    {
        public IPEndPoint EndPoint;
        public byte[] Data;

        public UdpPacket(IPEndPoint clientSocket, byte[] data)
        {
            this.EndPoint = clientSocket;
            this.Data = data;
        }
    }
}
