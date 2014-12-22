// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets._hJ_

package ClientPackets {
import flash.utils.IDataOutput;

public class _hJ_ extends ClientPacket {

    public function _hJ_(_arg1:uint) {
        super(_arg1);
    }
    public var time_:int;
    public var bulletId_:uint;
    public var objectId_:int;

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeInt(this.time_);
        _arg1.writeByte(this.bulletId_);
        _arg1.writeInt(this.objectId_);
    }

    override public function toString():String {
        return (formatToString("SQUAREHIT", "time_", "bulletId_", "objectId_"));
    }

}
}//package ClientPackets

