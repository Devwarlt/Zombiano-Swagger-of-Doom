using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace wServer.networking.cliPackets
{
    public class GetGiftPacket : ClientPacket
    {
        public ushort ItemId { get; set; }

        public override PacketID ID
        {
            get { return PacketID.GetGift; }
        }

        public override Packet CreateInstance()
        {
            return new GetGiftPacket();
        }

        protected override void Read(NReader rdr)
        {
            ItemId = (ushort)rdr.ReadInt32();
        }
    }
}
