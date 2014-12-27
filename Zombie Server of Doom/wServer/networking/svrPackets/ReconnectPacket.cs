
namespace wServer.networking.svrPackets
{
    public class ReconnectPacket : ServerPacket
    {
        public string Name { get; set; }
        public string Host { get; set; }
        public int Port { get; set; }
        public int GameId { get; set; }
        public int KeyTime { get; set; }
        public byte[] Key { get; set; }

        public override PacketID ID { get { return PacketID.Reconnect; } }
        public override Packet CreateInstance() { return new ReconnectPacket(); }

        protected override void Write(NWriter wtr)
        {
            wtr.WriteUTF(Name);
            wtr.WriteUTF(Host);
            wtr.Write(Port);
            wtr.Write(GameId);
            wtr.Write(KeyTime);
            wtr.Write((short)Key.Length);
            wtr.Write(Key);
        }
    }
}
