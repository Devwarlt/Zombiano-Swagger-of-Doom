﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ServerPackets._0F_I_

package ServerPackets{
    import flash.utils.IDataInput;

    public class _0F_I_ extends ServerPacket {

        public var serial_:int;

        public function _0F_I_(_arg1:uint){
            super(_arg1);
        }
        override public function parseFromInput(_arg1:IDataInput):void{
            this.serial_ = _arg1.readInt();
        }
        override public function toString():String{
            return (formatToString("PING", "serial_"));
        }

    }
}//package ServerPackets

