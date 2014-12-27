
namespace wServer.networking.cliPackets
{
    public class BuyPacket : ClientPacket
    {
        public int ObjectId { get; set; }

        public override PacketID ID { get { return PacketID.Buy; } }
        public override Packet CreateInstance() { return new BuyPacket(); }

        protected override void Read(NReader rdr)
        {
            ObjectId = rdr.ReadInt32();
        }
    }
}
