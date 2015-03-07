using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace wServer.networking.cliPackets
{
    public class SellItemPacket : ClientPacket
    {
        public int SlotId { get; set; }

        public override PacketID ID
        {
            get { return PacketID.SellItem; }
        }

        public override Packet CreateInstance()
        {
            return new SellItemPacket();
        }

        protected override void Read(NReader rdr)
        {
            this.SlotId = rdr.ReadByte();
        }
    }
}
