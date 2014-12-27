using System;

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
    }
}
