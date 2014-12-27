
namespace wServer.networking.svrPackets
{
    public abstract class ServerPacket : Packet
    {
        protected override void Read(NReader rdr)
        {
            throw new System.InvalidOperationException("Server packets should not read!");
        }
    }
}
