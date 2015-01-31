// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets._ns

package ClientPackets{
    import flash.utils.IDataOutput;

    public class GotoAckPacket extends ClientPacket {

        public var time_:int;

        public function GotoAckPacket(_arg1:uint){
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeInt(this.time_);
        }
        override public function toString():String{
            return (formatToString("GOTOACK", "time_"));
        }

    }
}//package ClientPackets

