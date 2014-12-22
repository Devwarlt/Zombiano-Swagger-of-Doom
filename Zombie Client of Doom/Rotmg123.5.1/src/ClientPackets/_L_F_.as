// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets._L_F_

package ClientPackets {
import flash.utils.IDataOutput;

public class _L_F_ extends ClientPacket {

    public function _L_F_(_arg1:uint) {
        super(_arg1);
    }
    public var bulletId_:uint;
    public var objectId_:int;

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeByte(this.bulletId_);
        _arg1.writeInt(this.objectId_);
    }

    override public function toString():String {
        return (formatToString("PLAYERHIT", "bulletId_", "objectId_"));
    }

}
}//package ClientPackets

