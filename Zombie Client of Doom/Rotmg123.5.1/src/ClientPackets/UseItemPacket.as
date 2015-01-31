// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets._fI_

package ClientPackets{
    import com.company.assembleegameclient.net.messages.data._0_3;
    import com.company.assembleegameclient.net.messages.data.Position;
    import flash.utils.IDataOutput;

    public class UseItemPacket extends ClientPacket {

        public var time_:int;
        public var slotObject_:_0_3;
        public var itemUsePos_:Position;

        public function UseItemPacket(_arg1:uint){
            this.slotObject_ = new _0_3();
            this.itemUsePos_ = new Position();
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeInt(this.time_);
            this.slotObject_.writeToOutput(_arg1);
            this.itemUsePos_.writeToOutput(_arg1);
        }
        override public function toString():String{
            return (formatToString("USEITEM", "slotObject_", "itemUsePos_"));
        }

    }
}//package ClientPackets

