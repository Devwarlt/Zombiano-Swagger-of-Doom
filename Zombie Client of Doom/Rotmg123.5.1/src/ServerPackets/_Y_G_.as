﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ServerPackets._Y_G_

package ServerPackets{
    import flash.utils.IDataInput;

    public class _Y_G_ extends ServerPacket {

        public var name_:String;

        public function _Y_G_(_arg1:uint){
            super(_arg1);
        }
        override public function parseFromInput(_arg1:IDataInput):void{
            this.name_ = _arg1.readUTF();
        }
        override public function toString():String{
            return (formatToString("TRADEREQUESTED", "name_"));
        }

    }
}//package ServerPackets

