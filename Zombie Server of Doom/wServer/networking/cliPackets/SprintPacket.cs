
namespace wServer.networking.cliPackets
{
    public class SprintPacket : ClientPacket
    {
        public bool SprintStart { get; set; }

        public override PacketID ID
        {
            get { return PacketID.Sprint; }
        }

        public override Packet CreateInstance()
        {
            return new SprintPacket();
        }

        protected override void Read(NReader rdr)
        {
            SprintStart = rdr.ReadBoolean();
        }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(SprintStart);
        }
    }
}
