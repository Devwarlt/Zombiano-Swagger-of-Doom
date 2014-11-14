﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace wServer.networking.svrPackets
{
    public class NotificationBoxPacket : ServerPacket
    {
        public string Head { get; set; }
        public string Text { get; set; }

        public override PacketID ID
        {
            get { return (PacketID)81; }
        }

        public override Packet CreateInstance()
        {
            return new NotificationBoxPacket();
        }

        protected override void Read(NReader rdr)
        {
        }

        protected override void Write(NWriter wtr)
        {
            wtr.WriteUTF(Head);
            wtr.WriteUTF(Text);
        }
    }
}