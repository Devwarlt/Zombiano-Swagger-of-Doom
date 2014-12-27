
namespace wServer.networking.svrPackets
{
    public class TextPacket : ServerPacket
    {
        public string Name { get; set; }
        public int ObjectId { get; set; }
        public int Stars { get; set; }
        public byte BubbleTime { get; set; }
        public string Recipient { get; set; }
        public string Text { get; set; }
        public string CleanText { get; set; }
        public bool Premium { get; set; }

        public override PacketID ID { get { return PacketID.Text; } }
        public override Packet CreateInstance() { return new TextPacket(); }

        protected override void Write(NWriter wtr)
        {
            wtr.WriteUTF(Name);
            wtr.Write(ObjectId);
            wtr.Write(Stars);
            wtr.Write(BubbleTime);
            wtr.WriteUTF(Recipient);
            wtr.WriteUTF(Text);
            wtr.WriteUTF(CleanText);
            wtr.Write(Premium);
        }
    }
}
