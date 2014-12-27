
namespace wServer.networking.svrPackets
{
    public class AOEPacket : ServerPacket
    {
        public Position Position { get; set; }
        public float Radius { get; set; }
        public ushort Damage { get; set; }
        public ConditionEffectIndex Effects { get; set; }
        public float EffectDuration { get; set; }
        public ushort OriginType { get; set; }

        public override PacketID ID { get { return PacketID.AOE; } }
        public override Packet CreateInstance() { return new AOEPacket(); }

        protected override void Write(NWriter wtr)
        {
            Position.Write(wtr);
            wtr.Write(Radius);
            wtr.Write(Damage);
            wtr.Write((byte)Effects);
            wtr.Write(EffectDuration);
            wtr.Write(OriginType);
        }
    }
}
