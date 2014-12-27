
namespace wServer.networking.svrPackets
{
    public class NameResultPacket : ServerPacket
    {
        public bool Success { get; set; }
        public string Message { get; set; }

        public override PacketID ID { get { return PacketID.NameResult; } }
        public override Packet CreateInstance() { return new NameResultPacket(); }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(Success);
            wtr.WriteUTF(Message);
        }
    }
}
