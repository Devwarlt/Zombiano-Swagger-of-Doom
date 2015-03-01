using wServer.networking.cliPackets;
using wServer.networking.svrPackets;
using wServer.realm;

namespace wServer.networking.handlers
{
    class EscapePacketHandler : PacketHandlerBase<EscapePacket>
    {
        public override PacketID ID { get { return PacketID.Escape; } }

        protected override void HandlePacket(Client client, EscapePacket packet)
        {
            client.Reconnect(new ReconnectPacket()
            {
                Host = "",
                Port = 2050,
                GameId = -2,
                Name = "Berlin",
                Key = Empty<byte>.Array,
            });
        }
    }
}
