// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ServerPackets._bB_

package ServerPackets {
import flash.utils.IDataInput;

public class _bB_ extends ServerPacket {

    public function _bB_(_arg1:uint) {
        super(_arg1);
    }
    public var ownerId_:int;
    public var soundId_:int;

    override public function parseFromInput(_arg1:IDataInput):void {
        this.ownerId_ = _arg1.readInt();
        this.soundId_ = _arg1.readUnsignedByte();
    }

    override public function toString():String {
        return (formatToString("PLAYSOUND", "ownerId_", "soundId_"));
    }

}
}//package ServerPackets

