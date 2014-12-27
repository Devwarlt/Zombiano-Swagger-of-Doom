
namespace wServer.networking.cliPackets
{
    public class MovePacket : ClientPacket
    {
        public int TickId { get; set; }
        public int Time { get; set; }
        public Position Position { get; set; }
        public TimedPosition[] Records { get; set; }

        public override PacketID ID { get { return PacketID.Move; } }
        public override Packet CreateInstance() { return new MovePacket(); }

        protected override void Read(NReader rdr)
        {
            TickId = rdr.ReadInt32();
            Time = rdr.ReadInt32();
            Position = Position.Read(rdr);
            Records = new TimedPosition[rdr.ReadInt16()];
            for (var i = 0; i < Records.Length; i++)
                Records[i] = TimedPosition.Read(rdr);
        }
    }
}
