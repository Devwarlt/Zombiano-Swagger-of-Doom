using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace wServer.networking.cliPackets
{
    public class VisibleBulletPacket : ClientPacket
    {
        public override PacketID ID
        {
            get { return (PacketID)254; }
        }

        public override Packet CreateInstance()
        {
            throw new NotImplementedException();
        }

        protected override void Read(NReader rdr)
        {
            throw new NotImplementedException();
        }

        protected override void Write(NWriter wtr)
        {
            throw new NotImplementedException();
        }
    }
}
