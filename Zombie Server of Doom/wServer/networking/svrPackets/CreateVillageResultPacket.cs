using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace wServer.networking.svrPackets
{
    public class CreateVillageResultPacket : ServerPacket
    {
        public bool Success { get; set; }
        public string ErrorMessage { get; set; }

        public CreateVillageResultPacket()
        {
            ErrorMessage = String.Empty;
        }

        public override PacketID ID
        {
            get { return PacketID.CreateVillageResult; }
        }

        public override Packet CreateInstance()
        {
            return new CreateVillageResultPacket();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(Success);
            wtr.WriteUTF(ErrorMessage);
        }
    }
}
