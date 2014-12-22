// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ServerPackets._iD_

package ServerPackets{
    import flash.utils.IDataInput;

    public class _iD_ extends ServerPacket {

        public var type:int;
        public var text:String;

        public function _iD_(_arg1:uint){
            super(_arg1);
        }
        override public function parseFromInput(_arg1:IDataInput):void{
            this.type = _arg1.readInt();
            this.text = _arg1.readUTF();
        }
        override public function toString():String{
            return (formatToString("GLOBAL_NOTIFICATION", "type", "text"));
        }

    }
}//package ServerPackets

