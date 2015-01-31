using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace wServer.networking.cliPackets
{
    public class CreateVillagePacket : ClientPacket
    {
        public string VillageName { get; set; }

        public override PacketID ID
        {
            get { return PacketID.CreateVillage; }
        }

        public override Packet CreateInstance()
        {
            return new CreateVillagePacket();
        }

        protected override void Read(NReader rdr)
        {
            VillageName = rdr.ReadUTF();
        }
    }
}
