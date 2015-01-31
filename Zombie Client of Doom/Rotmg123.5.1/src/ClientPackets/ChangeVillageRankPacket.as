// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets._09F_

package ClientPackets{
    import flash.utils.IDataOutput;

    public class ChangeVillageRankPacket extends ClientPacket {

        public var name_:String;
        public var guildRank_:int;

        public function ChangeVillageRankPacket(_arg1:uint){
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeUTF(this.name_);
            _arg1.writeInt(this.guildRank_);
        }
        override public function toString():String{
            return (formatToString("CHANGEGUILDRANK", "name_", "guildRank_"));
        }

    }
}//package ClientPackets

