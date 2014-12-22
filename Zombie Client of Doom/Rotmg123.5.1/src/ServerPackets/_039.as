// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ServerPackets._039

package ServerPackets{
    import flash.utils.IDataInput;

    public class _039 extends ServerPacket {

        public var name_:String;
        public var guildName_:String;

        public function _039(_arg1:uint){
            super(_arg1);
        }
        override public function parseFromInput(_arg1:IDataInput):void{
            this.name_ = _arg1.readUTF();
            this.guildName_ = _arg1.readUTF();
        }
        override public function toString():String{
            return (formatToString("INVITEDTOGUILD", "name_", "guildName_"));
        }

    }
}//package ServerPackets

