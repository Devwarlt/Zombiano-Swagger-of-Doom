// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets._99

package ClientPackets{
    import com.company.assembleegameclient.net.messages.data.Position;
    import com.company.assembleegameclient.net.messages.data._0_3;
    import flash.utils.IDataOutput;

    public class InvSwapPacket extends ClientPacket {

        public var time_:int;
        public var position_:Position;
        public var slotObject1_:_0_3;
        public var slotObject2_:_0_3;

        public function InvSwapPacket(_arg1:uint){
            this.position_ = new Position();
            this.slotObject1_ = new _0_3();
            this.slotObject2_ = new _0_3();
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

