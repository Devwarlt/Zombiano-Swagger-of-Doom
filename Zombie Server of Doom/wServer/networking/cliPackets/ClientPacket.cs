
namespace wServer.networking.cliPackets
{
    public abstract class ClientPacket : Packet
    {
        protected override void Write(NWriter wtr)
        {
            throw new System.InvalidOperationException("Client packets should not write!");
        }
    }
}
