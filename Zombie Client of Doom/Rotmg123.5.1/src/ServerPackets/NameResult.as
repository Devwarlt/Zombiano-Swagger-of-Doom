// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ServerPackets._0D_q

package ServerPackets{
    import flash.utils.IDataInput;

    public class NameResult extends ServerPacket {

        public var success_:Boolean;
        public var errorText_:String;

        public function NameResult(_arg1:uint){
            super(_arg1);
        }
        override public function parseFromInput(_arg1:IDataInput):void{
            this.success_ = _arg1.readBoolean();
            this.errorText_ = _arg1.readUTF();
        }
        override public function toString():String{
            return (formatToString("NAMERESULT", "success_", "errorText_"));
        }

    }
}//package ServerPackets

