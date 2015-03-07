
namespace wServer.networking.svrPackets
{
    public class BuyResultPacket : ServerPacket
    {
        public static int _04l = -1;
        public static int _dV_ = 0;
        public static int _4E_ = 1;
        public static int _o1 = 2;
        public static int _7a = 3;
        public static int _X_u = 4;
        public static int _mI_ = 5;
        public static int _0I_C_ = 6;
        public static int CRAFTING_RESULT = 7;
        public static int LEARN_CRAFTING_RESULT = 8;
        public static int SELL_ITEM_RESULT = 9;


        public int Result { get; set; }
        public string Message { get; set; }

        public override PacketID ID { get { return PacketID.BuyResult; } }
        public override Packet CreateInstance() { return new BuyResultPacket(); }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(Result);
            wtr.WriteUTF(Message);
        }
    }
}
