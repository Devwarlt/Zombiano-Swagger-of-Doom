using wServer.networking.cliPackets;

namespace wServer.networking.handlers
{
    class GroundDamagePacketHandler : PacketHandlerBase<GroundDamagePacket>
    {
        public override PacketID ID { get { return PacketID.GroundDamage; } }

        protected override void HandlePacket(Client client, GroundDamagePacket packet)
        {
            //TODO: implement something
        }
    }
}
