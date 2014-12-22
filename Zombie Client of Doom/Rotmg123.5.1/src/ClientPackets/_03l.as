// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets._03l

package ClientPackets{
    import flash.utils.IDataOutput;

    public class _03l extends ClientPacket {

        public var objectId_:int;

        public function _03l(_arg1:uint){
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeInt(this.objectId_);
        }
        override public function toString():String{
            return (formatToString("USEPORTAL", "objectId_"));
        }

    }
}//package ClientPackets

