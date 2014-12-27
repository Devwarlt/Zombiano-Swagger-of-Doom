
namespace wServer.networking.svrPackets
{
    public class TradeChangedPacket : ServerPacket
    {
        public bool[] Offers { get; set; }

        public override PacketID ID { get { return PacketID.TradeChanged; } }
        public override Packet CreateInstance() { return new TradeChangedPacket(); }

        protected override void Write(NWriter wtr)
        {
            wtr.Write((short)Offers.Length);
            foreach (var i in Offers)
                wtr.Write(i);
        }
    }
}
