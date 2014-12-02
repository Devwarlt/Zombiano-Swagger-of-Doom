
namespace wServer.networking.svrPackets
{
    public class PicPacket : ServerPacket
    {
        public BitmapData Bitmap { get; set; }

        public override PacketID ID
        {
            get { return PacketID.Pic; }
        }

        public override Packet CreateInstance()
        {
            return new PicPacket();
        }

        protected override void Read(NReader rdr)
        {
            Bitmap = BitmapData.Read(rdr);
        }

        protected override void Write(NWriter wtr)
        {
            Bitmap.Write(wtr);
        }
    }
}
