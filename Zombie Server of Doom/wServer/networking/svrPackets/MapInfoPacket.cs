
namespace wServer.networking.svrPackets
{
    public class MapInfoPacket : ServerPacket
    {
        public int Width { get; set; }
        public int Height { get; set; }
        public string Name { get; set; }
        public string BackgroundImage { get; set; }
        public uint Seed { get; set; }
        public int Background { get; set; }
        public bool AllowTeleport { get; set; }
        public bool ShowDisplays { get; set; }
        public Weather Weather { get; set; }
        public int CurrentDateTime { get; set; }
        public string[] Music { get; set; }
        public string[] ClientXML { get; set; }
        public string[] ExtraXML { get; set; }

        public override PacketID ID { get { return PacketID.MapInfo; } }
        public override Packet CreateInstance() { return new MapInfoPacket(); }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(Width);
            wtr.Write(Height);
            wtr.WriteUTF(Name);
            wtr.WriteUTF(BackgroundImage);
            wtr.Write(Seed);
            wtr.Write(Background);
            wtr.Write(AllowTeleport);
            wtr.Write(ShowDisplays);
            wtr.Write((byte)Weather);
            wtr.Write(CurrentDateTime);
            wtr.Write((short)Music.Length);
            foreach (var i in Music)
                wtr.WriteUTF(i);

            wtr.Write((short)ClientXML.Length);
            foreach (var i in ClientXML)
                wtr.Write32UTF(i);

            wtr.Write((short)ExtraXML.Length);
            foreach (var i in ExtraXML)
                wtr.Write32UTF(i);
        }
    }
}

public enum Weather : byte
{
    Sunny = 0,
    Rainy = 1,
    Snowy = 2,
    ThunderStormRain = 3
}
