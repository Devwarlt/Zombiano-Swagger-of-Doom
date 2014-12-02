
namespace wServer.networking.svrPackets
{
    public class TeleportRequestPacket : ServerPacket
    {
        public string Name { get; set; }
        public int ObjectId { get; set; }

        public override PacketID ID
        {
            get { return PacketID.TeleportRequest; }
        }

        public override Packet CreateInstance()
        {
            return new TeleportRequestPacket();
        }

        protected override void Read(NReader rdr)
        {
        }

        protected override void Write(NWriter wtr)
        {
            wtr.WriteUTF(Name);
            wtr.Write(ObjectId);
        }
    }
}
