﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ServerPackets._01R_

package ServerPackets{
    import flash.utils.IDataInput;

    public class _01R_ extends ServerPacket {

        public var objectId_:int;
        public var text_:String;
        public var color_:int;

        public function _01R_(_arg1:uint){
            super(_arg1);
        }
        override public function parseFromInput(_arg1:IDataInput):void{
            this.objectId_ = _arg1.readInt();
            this.text_ = _arg1.readUTF();
            this.color_ = _arg1.readInt();
        }
        override public function toString():String{
            return (formatToString("NOTIFICATION", "objectId_", "text_", "color_"));
        }

    }
}//package ServerPackets

