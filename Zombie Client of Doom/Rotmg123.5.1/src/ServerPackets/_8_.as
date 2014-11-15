﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ServerPackets._8_

package ServerPackets{
    import flash.utils.ByteArray;
    import flash.utils.IDataInput;

    public class _8_ extends ServerPacket {

        public var name_:String;
        public var host_:String;
        public var port_:int;
        public var gameId_:int;
        public var keyTime_:int;
        public var key_:ByteArray;

        public function _8_(_arg1:uint){
            this.key_ = new ByteArray();
            super(_arg1);
        }
        override public function parseFromInput(_arg1:IDataInput):void{
            this.name_ = _arg1.readUTF();
            this.host_ = _arg1.readUTF();
            this.port_ = _arg1.readInt();
            this.gameId_ = _arg1.readInt();
            this.keyTime_ = _arg1.readInt();
            var _local2:int = _arg1.readShort();
            this.key_.length = 0;
            _arg1.readBytes(this.key_, 0, _local2);
        }
        override public function toString():String{
            return (formatToString("RECONNECT", "name_", "host_", "port_", "gameId_", "keyTime_", "key_"));
        }

    }
}//package ServerPackets

