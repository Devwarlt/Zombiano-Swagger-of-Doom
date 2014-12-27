
namespace wServer.networking.svrPackets
{
    public class TradeAcceptedPacket : ServerPacket
    {
        public bool[] MyOffers { get; set; }
        public bool[] YourOffers { get; set; }

        public override PacketID ID { get { return PacketID.TradeAccepted; } }
        public override Packet CreateInstance() { return new TradeAcceptedPacket(); }

        protected override void Write(NWriter wtr)
        {
            wtr.Write((short)MyOffers.Length);
            foreach (var i in MyOffers)
                wtr.Write(i);
            wtr.Write((short)YourOffers.Length);
            foreach (var i in YourOffers)
                wtr.Write(i);
        }
    }
}
