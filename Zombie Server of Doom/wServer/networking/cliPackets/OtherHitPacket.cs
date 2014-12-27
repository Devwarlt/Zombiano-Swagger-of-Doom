
namespace wServer.networking.cliPackets
{
    public class OtherHitPacket : ClientPacket
    {
        public int Time { get; set; }
        public byte BulletId { get; set; }
        public int ObjectId { get; set; }
        public int TargetId { get; set; }

        public override PacketID ID { get { return PacketID.OtherHit; } }
        public override Packet CreateInstance() { return new OtherHitPacket(); }

        protected override void Read(NReader rdr)
        {
            Time = rdr.ReadInt32();
            BulletId = rdr.ReadByte();
            ObjectId = rdr.ReadInt32();
            TargetId = rdr.ReadInt32();
        }
    }
}
