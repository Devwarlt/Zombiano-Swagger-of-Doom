
namespace wServer.networking.svrPackets
{
    public class MultiShootPacket : ServerPacket
    {
        public byte BulletId { get; set; }
        public int OwnerId { get; set; }
        public byte BulletType { get; set; }
        public Position Position { get; set; }
        public float Angle { get; set; }
        public short Damage { get; set; }
        public byte NumShots { get; set; }
        public float AngleIncrement { get; set; }

        public override PacketID ID { get { return PacketID.MultiShoot; } }
        public override Packet CreateInstance() { return new MultiShootPacket(); }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(BulletId);
            wtr.Write(OwnerId);
            wtr.Write(BulletType);
            Position.Write(wtr);
            wtr.Write(Angle);
            wtr.Write(Damage);
            wtr.Write(NumShots);
            wtr.Write(AngleIncrement);
        }
    }
}
