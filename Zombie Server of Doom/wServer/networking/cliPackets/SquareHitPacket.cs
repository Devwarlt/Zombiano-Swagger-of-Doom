
namespace wServer.networking.cliPackets
{
    public class SquareHitPacket : ClientPacket
    {
        public int Time { get; set; }
        public byte BulletId { get; set; }
        public int ObjectId { get; set; }

        public override PacketID ID { get { return PacketID.SquareHit; } }
        public override Packet CreateInstance() { return new SquareHitPacket(); }

        protected override void Read(NReader rdr)
        {
            Time = rdr.ReadInt32();
            BulletId = rdr.ReadByte();
            ObjectId = rdr.ReadInt32();
        }
    }
}
