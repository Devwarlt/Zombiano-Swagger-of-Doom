// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets._r5

package ClientPackets{
    import flash.utils.IDataOutput;

    public class LoadPacket extends ClientPacket {

        public var skinId_:int;

        public function LoadPacket(_arg1:uint){
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeInt(this.skinId_);
        }
        override public function toString():String{
            return (formatToString("LOAD", "charId_"));
        }

    }
}//package ClientPackets

