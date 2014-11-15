// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ServerPackets._08K_

package ServerPackets{
    import flash.utils.IDataInput;

    public class _08K_ extends ServerPacket {

        public var result_:int;

        public function _08K_(_arg1:uint){
            super(_arg1);
        }
        override public function parseFromInput(_arg1:IDataInput):void{
            this.result_ = _arg1.readInt();
        }
        override public function toString():String{
            return (formatToString("INVRESULT", "result_"));
        }

    }
}//package ServerPackets

