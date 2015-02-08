// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets._99

package ClientPackets{
    import com.company.assembleegameclient.net.messages.data.Position;
    import com.company.assembleegameclient.net.messages.data.SlotObject;
    import flash.utils.IDataOutput;

    public class InvSwapPacket extends ClientPacket {

        public var time_:int;
        public var position_:Position;
        public var slotObject1_:SlotObject;
        public var slotObject2_:SlotObject;

        public function InvSwapPacket(_arg1:uint){
            this.position_ = new Position();
            this.slotObject1_ = new SlotObject();
            this.slotObject2_ = new SlotObject();
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeInt(this.time_);
            this.position_.writeToOutput(_arg1);
            this.slotObject1_.writeToOutput(_arg1);
            this.slotObject2_.writeToOutput(_arg1);
        }
        override public function toString():String{
            return (formatToString("INVSWAP", "time_", "position_", "slotObject1_", "slotObject2_"));
        }

    }
}//package ClientPackets

