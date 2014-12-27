using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace wServer.networking.svrPackets
{
    public class UnlockPacket : ServerPacket
    {
        public UnlockType Type { get; set; }
        public ushort ItemId { get; set; }

        public override PacketID ID
        {
            get { return PacketID.Unlock; }
        }

        public override Packet CreateInstance()
        {
            return new UnlockPacket();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write((byte)Type);
            wtr.Write(ItemId);
        }
    }

    public enum UnlockType
    {
        Item,
        FPCPack,
        Award
    }
}
