﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ServerPackets._T_n

package ServerPackets{
    import flash.utils.IDataInput;

    public class _T_n extends ServerPacket {

        public var objectId_:int;
        public var charId_:int;

        public function _T_n(_arg1:uint){
            super(_arg1);
        }
        override public function parseFromInput(_arg1:IDataInput):void{
            this.objectId_ = _arg1.readInt();
            this.charId_ = _arg1.readInt();
        }
        override public function toString():String{
            return (formatToString("CREATE_SUCCESS", "objectId_", "charId_"));
        }

    }
}//package ServerPackets

