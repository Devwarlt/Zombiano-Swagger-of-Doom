// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ServerPackets._04R_

package ServerPackets{
    import com.company.assembleegameclient.net.messages.data.Position;
    import flash.utils.IDataInput;

    public class Goto extends ServerPacket {

        public var objectId_:int;
        public var pos_:Position;

        public function Goto(_arg1:uint){
            this.pos_ = new Position();
            super(_arg1);
        }
        override public function parseFromInput(_arg1:IDataInput):void{
            this.objectId_ = _arg1.readInt();
            this.pos_.parseFromInput(_arg1);
        }
        override public function toString():String{
            return (formatToString("GOTO", "objectId_", "pos_"));
        }

    }
}//package ServerPackets

