using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace wServer.networking.svrPackets
{
    public class AchievementUnlockedPacket : ServerPacket
    {
        public AchievementType Type { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }

        public override PacketID ID
        {
            get { return PacketID.AchievementUnlocked; }
        }

        public override Packet CreateInstance()
        {
            return new AchievementUnlockedPacket();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write((byte)Type);
            wtr.WriteUTF(Title);
            wtr.WriteUTF(Description);
        }

        public enum AchievementType : byte
        {
            Normal = 0,
            Premium = 1
        }
    }
}
