// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ServerPackets._T_m

package ServerPackets{
    import com.company.assembleegameclient.net.messages.data.Position;
    import flash.utils.IDataInput;

    public class _T_m extends ServerPacket {

        public var bulletId_:uint;
        public var ownerId_:int;
        public var containerType_:int;
        public var startingPos_:Position;
        public var angle_:Number;
        public var damage_:int;

        public function _T_m(_arg1:uint){
            this.startingPos_ = new Position();
            super(_arg1);
        }
        override public function parseFromInput(_arg1:IDataInput):void{
            this.bulletId_ = _arg1.readUnsignedByte();
            this.ownerId_ = _arg1.readInt();
            this.containerType_ = _arg1.readShort();
            this.startingPos_.parseFromInput(_arg1);
            this.angle_ = _arg1.readFloat();
            this.damage_ = _arg1.readShort();
        }
        override public function toString():String{
            return (formatToString("SHOOT", "bulletId_", "ownerId_", "containerType_", "startingPos_", "angle_", "damage_"));
        }

    }
}//package ServerPackets

