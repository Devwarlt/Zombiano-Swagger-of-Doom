
namespace wServer.networking.cliPackets
{
    public class PlayerShootPacket : ClientPacket
    {
        public int Time { get; set; }
        public byte BulletId { get; set; }
        public ushort ContainerType { get; set; }
        public Position Position { get; set; }
        public float Angle { get; set; }

        public override PacketID ID { get { return PacketID.PlayerShoot; } }
        public override Packet CreateInstance() { return new PlayerShootPacket(); }

        protected override void Read(NReader rdr)
        {
            Time = rdr.ReadInt32();
            BulletId = rdr.ReadByte();
            ContainerType = rdr.ReadUInt16();
            Position = Position.Read(rdr);
            Angle = rdr.ReadSingle();
        }
    }
}
