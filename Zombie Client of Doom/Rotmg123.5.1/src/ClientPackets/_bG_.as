// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets._bG_

package ClientPackets{
    import com.company.assembleegameclient.net.messages.data.Position;
    import flash.utils.IDataOutput;

    public class _bG_ extends ClientPacket {

        public var time_:int;
        public var position_:Position;

        public function _bG_(_arg1:uint){
            this.position_ = new Position();
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeInt(this.time_);
            this.position_.writeToOutput(_arg1);
        }
        override public function toString():String{
            return (formatToString("AOEACK", "time_", "position_"));
        }

    }
}//package ClientPackets

