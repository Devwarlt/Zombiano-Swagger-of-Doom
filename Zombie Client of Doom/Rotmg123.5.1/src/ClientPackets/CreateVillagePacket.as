// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets._U_2

package ClientPackets{
    import flash.utils.IDataOutput;

    public class CreateVillagePacket extends ClientPacket {

        public var name_:String;

        public function CreateVillagePacket(_arg1:uint){
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeUTF(this.name_);
        }
        override public function toString():String{
            return (formatToString("CREATEVILLAGE", "name_"));
        }

    }
}//package ClientPackets

