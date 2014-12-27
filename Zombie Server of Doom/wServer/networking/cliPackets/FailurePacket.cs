
namespace wServer.networking.cliPackets
{
    public class FailurePacket : ClientPacket
    {
        public string Message { get; set; }

        public override PacketID ID { get { return PacketID.Failure; } }
        public override Packet CreateInstance() { return new FailurePacket(); }

        protected override void Read(NReader rdr)
        {
            Message = rdr.ReadUTF();
        }
    }
}
