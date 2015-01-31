// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets._hJ_

package ClientPackets{
    import flash.utils.IDataOutput;

    public class SquareHitPacket extends ClientPacket {

        public var time_:int;
        public var bulletId_:uint;
        public var objectId_:int;

        public function SquareHitPacket(_arg1:uint){
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeInt(this.time_);
            _arg1.writeByte(this.bulletId_);
            _arg1.writeInt(this.objectId_);
        }
        override public function toString():String{
            return (formatToString("SQUAREHIT", "time_", "bulletId_", "objectId_"));
        }

    }
}//package ClientPackets

