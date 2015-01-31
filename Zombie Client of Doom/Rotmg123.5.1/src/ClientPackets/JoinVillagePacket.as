// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets._0G_8

package ClientPackets{
    import flash.utils.IDataOutput;

    public class JoinVillagePacket extends ClientPacket {

        public var guildName_:String;

        public function JoinVillagePacket(_arg1:uint){
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeUTF(this.guildName_);
        }
        override public function toString():String{
            return (formatToString("JOINGUILD", "guildName_"));
        }

    }
}//package ClientPackets

