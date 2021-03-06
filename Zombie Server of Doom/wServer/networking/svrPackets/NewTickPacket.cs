﻿
namespace wServer.networking.svrPackets
{
    public class NewTickPacket : ServerPacket
    {
        public int TickId { get; set; }
        public int TickTime { get; set; }
        public int DateTime { get; set; }
        public ObjectStats[] UpdateStatuses { get; set; }

        public override PacketID ID { get { return PacketID.New_Tick; } }
        public override Packet CreateInstance() { return new NewTickPacket(); }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(TickId);
            wtr.Write(TickTime);
            wtr.Write(DateTime);

            wtr.Write((short)UpdateStatuses.Length);
            foreach (var i in UpdateStatuses)
                i.Write(wtr);
        }
    }
}
