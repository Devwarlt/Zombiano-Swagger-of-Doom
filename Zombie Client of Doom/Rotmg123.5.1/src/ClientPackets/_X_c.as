// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets._X_c

package ClientPackets{
    import flash.utils.IDataOutput;

    public class _X_c extends ClientPacket {

        public function _X_c(_arg1:uint){
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
        }
        override public function toString():String{
            return (formatToString("CHECKCREDITS"));
        }

    }
}//package ClientPackets

