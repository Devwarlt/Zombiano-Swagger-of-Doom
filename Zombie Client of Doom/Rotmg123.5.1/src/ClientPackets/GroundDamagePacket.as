// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets._K_w

package ClientPackets{
    import com.company.assembleegameclient.net.messages.data.Position;
    import flash.utils.IDataOutput;

    public class GroundDamagePacket extends ClientPacket {

        public var time_:int;
        public var position_:Position;

        public function GroundDamagePacket(_arg1:uint){
            this.position_ = new Position();
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeInt(this.time_);
            this.position_.writeToOutput(_arg1);
        }
        override public function toString():String{
            return (formatToString("GROUNDDAMAGE", "time_", "position_"));
        }

    }
}//package ClientPackets

