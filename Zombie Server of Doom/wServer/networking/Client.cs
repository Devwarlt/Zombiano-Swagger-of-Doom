﻿using log4net;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Sockets;
using wServer.networking.cliPackets;
using wServer.networking.svrPackets;
using wServer.realm;
using wServer.realm.entities;

namespace wServer.networking
{
    public enum ProtocalStage
    {
        Connected,
        Handshaked,
        Ready,
        Disconnected
    }
    public class Client
    {
        static ILog log = LogManager.GetLogger(typeof(Client));

        Socket skt;
        public RC4 ReceiveKey { get; private set; }
        public RC4 SendKey { get; private set; }

        public RealmManager Manager { get; private set; }
        public Socket Socket { get { return skt; } }
        public bool IsUdp { get; private set; }

        private IPEndPoint cEndP;
        public IPEndPoint EndPoint
        {
            get
            {
                return IsUdp ? cEndP : (IPEndPoint)Socket.RemoteEndPoint;
            }
        }

        private UdpPacket receivePacket;

        public Client(RealmManager manager, Socket skt)
        {
            this.skt = skt;
            this.Manager = manager;
            //ReceiveKey = new RC4(new byte[] { 0x31, 0x1f, 0x80, 0x69, 0x14, 0x51, 0xc7, 0x1b, 0x09, 0xa1, 0x3a, 0x2a, 0x6e });
            //SendKey = new RC4(new byte[] { 0x72, 0xc5, 0x58, 0x3c, 0xaf, 0xb6, 0x81, 0x89, 0x95, 0xcb, 0xd7, 0x4b, 0x80 });
        }

        public Client(RealmManager manager, UdpPacket pkt)
        {
            //this.skt = skt;
            this.Manager = manager;
            //ReceiveKey = new RC4(new byte[] { 0x31, 0x1f, 0x80, 0x69, 0x14, 0x51, 0xc7, 0x1b, 0x09, 0xa1, 0x3a, 0x2a, 0x6e });
            //SendKey = new RC4(new byte[] { 0x72, 0xc5, 0x58, 0x3c, 0xaf, 0xb6, 0x81, 0x89, 0x95, 0xcb, 0xd7, 0x4b, 0x80 });
            this.IsUdp = true;
            this.cEndP = pkt.EndPoint;
            this.receivePacket = pkt;
        }

        NetworkHandler handler;
        UdpNetworkHandler udpHandler;
        public void BeginProcess()
        {
            if (!this.IsUdp)
            {
                log.InfoFormat("Received client @ {0}.", skt.RemoteEndPoint);
                handler = new NetworkHandler(this, skt);
                handler.BeginHandling();
            }
            else
            {
                udpHandler = new UdpNetworkHandler(this, this.receivePacket);
                
            }
        }

        public void SendPacket(Packet pkt)
        {
            if (!this.IsUdp)
                handler.SendPacket(pkt);
            else
                udpHandler.SendPacket(pkt);
        }
        public void SendPackets(IEnumerable<Packet> pkts)
        {
            handler.SendPackets(pkts);
        }

        public bool IsReady()
        {
            if (Stage == ProtocalStage.Disconnected)
                return false;
            if (Stage == ProtocalStage.Ready &&
                (Player == null || Player != null && Player.Owner == null))
                return false;
            return true;
        }
        internal void ProcessPacket(Packet pkt)
        {
            try
            {
                log.Logger.Log(typeof(Client), log4net.Core.Level.Verbose,
                    string.Format("Handling packet '{0}'...", pkt.ID), null);
                if (pkt.ID == PacketID.Packet) return;
                IPacketHandler handler;
                if (!PacketHandlers.Handlers.TryGetValue(pkt.ID, out handler))
                    log.WarnFormat("Unhandled packet '{0}'.", pkt.ID);
                else
                    handler.Handle(this, (ClientPacket)pkt);
            }
            catch (Exception e)
            {
                log.Error(string.Format("Error when handling packet '{0}'...", pkt.ToString()), e);
                Disconnect();
            }
        }

        public void Disconnect()
        {
            if (Stage == ProtocalStage.Disconnected) return;
            log.DebugFormat("Disconnecting client @ {0}...", EndPoint);
            var original = Stage;
            Stage = ProtocalStage.Disconnected;
            if (Account != null)
                DisconnectFromRealm();
            if(!IsUdp)
                skt.Close();
        }
        void Save()
        {
            if (Character != null)
            {
                log.DebugFormat("Saving character...");
                Player.SaveToCharacter();
                Manager.Database.SaveCharacter(Account, Character);
            }
            if (Account != null)
            {
                if(Player != null)
                    Player.SaveToAccount();
                Manager.Database.SaveAccount(Account);
            }
        }

        public Char Character { get; internal set; }
        public Account Account { get; internal set; }
        public ProtocalStage Stage { get; internal set; }
        public Player Player { get; internal set; }
        public wRandom Random { get; internal set; }
        public bool Debug { get; set; }

        //Temporary connection state
        internal int targetWorld = -1;

        //Following must execute, network loop will discard disconnected client, so logic loop
        void DisconnectFromRealm()
        {
            Manager.Logic.AddPendingAction(t =>
            {
                if (Player != null)
                    Player.SaveToCharacter();
                Save();
                Manager.Disconnect(this);
            }, PendingPriority.Destruction);
        }
        public void Reconnect(ReconnectPacket pkt)
        {
            log.InfoFormat("Reconnecting client @ {0} to {1}...", skt.RemoteEndPoint, pkt.Name);
            Manager.Logic.AddPendingAction(t =>
            {
                if (Player != null)
                    Player.SaveToCharacter();
                Save();
                Manager.Disconnect(this);
                SendPacket(pkt);
            }, PendingPriority.Destruction);
        }

        public void Handle(byte[] data)
        {
            udpHandler.Handle(data);
        }
    }
}
