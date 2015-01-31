// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets._pa

package ClientPackets{
    import flash.utils.IDataOutput;

    public class PlayerTextPacket extends ClientPacket {

        public var text_:String;

        public function PlayerTextPacket(_arg1:uint){
            this.text_ = String("");
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeUTF(this.text_);
        }
        override public function toString():String{
            return (formatToString("PLAYERTEXT", "text_"));
        }

    }
}//package ClientPackets

