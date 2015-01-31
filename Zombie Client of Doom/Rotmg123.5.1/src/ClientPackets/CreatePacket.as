// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets.Create

package ClientPackets{
    import flash.utils.IDataOutput;

    public class CreatePacket extends ClientPacket {

        public var objectType_:int;

        public function CreatePacket(_arg1:uint){
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeShort(this.objectType_);
        }
        override public function toString():String{
            return (formatToString("CREATE", "objectType_"));
        }

    }
}//package ClientPackets

