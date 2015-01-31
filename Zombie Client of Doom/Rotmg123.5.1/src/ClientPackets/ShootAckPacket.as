// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets._0I_8

package ClientPackets{
    import flash.utils.IDataOutput;

    public class ShootAckPacket extends ClientPacket {

        public var time_:int;

        public function ShootAckPacket(_arg1:uint){
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeInt(this.time_);
        }
        override public function toString():String{
            return (formatToString("SHOOTACK", "time_"));
        }

    }
}//package ClientPackets

