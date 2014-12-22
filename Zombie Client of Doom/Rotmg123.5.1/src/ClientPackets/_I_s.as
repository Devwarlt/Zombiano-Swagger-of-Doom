// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets._I_s

package ClientPackets{
    import flash.utils.IDataOutput;

    public class _I_s extends ClientPacket {

        public var name_:String;

        public function _I_s(_arg1:uint){
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeUTF(this.name_);
        }
        override public function toString():String{
            return (formatToString("REQUESTTRADE", "name_"));
        }

    }
}//package ClientPackets

