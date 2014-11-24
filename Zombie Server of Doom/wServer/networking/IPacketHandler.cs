using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using wServer.networking.cliPackets;

namespace wServer.networking
{
    interface IPacketHandler
    {
        PacketID ID { get; }
        void Handle(Client client, ClientPacket packet);
    }
    abstract class PacketHandlerBase<T> : IPacketHandler where T : ClientPacket
    {
        protected abstract void HandlePacket(Client client, T packet);

        public abstract PacketID ID { get; }

        protected Client Client { get; private set; }

        public void Handle(Client client, ClientPacket packet)
        {
            this.Client = client;
            HandlePacket(client, (T)packet);
        }

        protected void SendFailure(string text, int errorId = 0)
        {
            Client.SendPacket(new svrPackets.FailurePacket() { Message = text, ErrorId = errorId });
        }

        protected void SendPacket(Packet pkt)
        {
            Client.SendPacket(pkt);
        }
    }

    class PacketHandlers
    {
        public static Dictionary<PacketID, IPacketHandler> Handlers = new Dictionary<PacketID, IPacketHandler>();
        static PacketHandlers()
        {
            foreach (var i in typeof(Packet).Assembly.GetTypes())
                if (typeof(IPacketHandler).IsAssignableFrom(i) &&
                    !i.IsAbstract && !i.IsInterface)
                {
                    IPacketHandler pkt = (IPacketHandler)Activator.CreateInstance(i);
                    Handlers.Add(pkt.ID, pkt);
                }
        }
    }
}
