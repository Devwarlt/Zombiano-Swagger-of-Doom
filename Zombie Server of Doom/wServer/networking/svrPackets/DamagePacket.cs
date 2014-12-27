using System.Collections.Generic;

namespace wServer.networking.svrPackets
{
    public class DamagePacket : ServerPacket
    {
        public int TargetId { get; set; }
        public ConditionEffects Effects { get; set; }
        public ushort Damage { get; set; }
        public bool Killed { get; set; }
        public byte BulletId { get; set; }
        public int ObjectId { get; set; }

        public override PacketID ID { get { return PacketID.Damage; } }
        public override Packet CreateInstance() { return new DamagePacket(); }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(TargetId);
            List<byte> eff = new List<byte>();
            for (byte i = 1; i < 255; i++)
                if ((Effects & (ConditionEffects)(1 << i)) != 0)
                    eff.Add(i);
            wtr.Write((byte)eff.Count);
            foreach (var i in eff) wtr.Write(i);
            wtr.Write(Damage);
            wtr.Write(Killed);
            wtr.Write(BulletId);
            wtr.Write(ObjectId);
        }
    }
}
