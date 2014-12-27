namespace wServer.networking.cliPackets
{
    public class ReskinPacket : ClientPacket
    {
        public int SkinId { get; set; }

        public override PacketID ID
        {
            get { return PacketID.Reskin; }
        }

        public override Packet CreateInstance()
        {
            return new ReskinPacket();
        }

        protected override void Read(NReader rdr)
        {
            SkinId = rdr.ReadInt32();
        }
    }
}