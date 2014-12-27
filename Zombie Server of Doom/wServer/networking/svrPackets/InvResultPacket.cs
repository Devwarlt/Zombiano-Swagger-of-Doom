
namespace wServer.networking.svrPackets
{
    public class InvResultPacket : ServerPacket
    {
        public int Result { get; set; }

        public override PacketID ID { get { return PacketID.InvResult; } }
        public override Packet CreateInstance() { return new InvResultPacket(); }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(Result);
        }
    }
}
