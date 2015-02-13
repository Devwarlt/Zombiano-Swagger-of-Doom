
namespace wServer.networking.cliPackets
{
    public class HelloPacket : ClientPacket
    {
        public string Copyright { get; set; }
        public string BuildVersion { get; set; }
        public int GameId { get; set; }
        public string GUID { get; set; }
        public string Password { get; set; }
        public string Secret { get; set; }
        public int KeyTime { get; set; }
        public byte[] Key { get; set; }
        public string MapInfo { get; set; }
        public string EntryTag { get; set; }
        public string GameNetwork { get; set; }
        public string GameNetworkUserId { get; set; }
        public string PlayPlatform { get; set; }
        public bool IsDebugClient { get; set; }

        public override PacketID ID { get { return PacketID.Hello; } }
        public override Packet CreateInstance() { return new HelloPacket(); }

        protected override void Read(NReader rdr)
        {
            Copyright = rdr.ReadUTF();
            BuildVersion = rdr.ReadUTF();
            GameId = rdr.ReadInt32();
            GUID = RSA.Instance.Decrypt(rdr.ReadUTF());
            Password = RSA.Instance.Decrypt(rdr.ReadUTF());
            Secret = RSA.Instance.Decrypt(rdr.ReadUTF());
            KeyTime = rdr.ReadInt32();
            Key = rdr.ReadBytes(rdr.ReadInt16());
            MapInfo = rdr.Read32UTF();
            EntryTag = rdr.ReadUTF();
            GameNetwork = rdr.ReadUTF();
            GameNetworkUserId = rdr.ReadUTF();
            PlayPlatform = rdr.ReadUTF();
            IsDebugClient = rdr.ReadBoolean();
        }
    }
}
