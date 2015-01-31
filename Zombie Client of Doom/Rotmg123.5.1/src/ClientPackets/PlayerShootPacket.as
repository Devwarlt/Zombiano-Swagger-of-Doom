// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets._0L_P_

package ClientPackets{
    import com.company.assembleegameclient.net.messages.data.Position;
    import flash.utils.IDataOutput;

    public class PlayerShootPacket extends ClientPacket {

        public var time_:int;
        public var bulletId_:uint;
        public var containerType_:int;
        public var startingPos_:Position;
        public var angle_:Number;

        public function PlayerShootPacket(_arg1:uint){
            this.startingPos_ = new Position();
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeInt(this.time_);
            _arg1.writeByte(this.bulletId_);
            _arg1.writeShort(this.containerType_);
            this.startingPos_.writeToOutput(_arg1);
            _arg1.writeFloat(this.angle_);
        }
        override public function toString():String{
            return (formatToString("PLAYERSHOOT", "time_", "bulletId_", "containerType_", "startingPos_", "angle_"));
        }

    }
}//package ClientPackets

