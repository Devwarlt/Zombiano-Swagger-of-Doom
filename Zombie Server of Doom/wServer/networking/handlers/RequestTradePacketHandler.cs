using wServer.networking.cliPackets;

namespace wServer.networking.handlers
{
    class RequestTradePacketHandler : PacketHandlerBase<RequestTradePacket>
    {
        public override PacketID ID { get { return PacketID.RequestTrade; } }

        protected override void HandlePacket(Client client, RequestTradePacket packet)
        {
            client.Player.RequestTrade(packet.Name);
        }
    }
}
