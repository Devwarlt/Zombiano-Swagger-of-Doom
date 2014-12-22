// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets._mw

package ClientPackets {
import flash.utils.IDataOutput;

public class _mw extends ClientPacket {

    public function _mw(_arg1:uint) {
        super(_arg1);
    }
    public var conditionEffect_:uint;
    public var conditionDuration_:Number;

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeByte(this.conditionEffect_);
        _arg1.writeFloat(this.conditionDuration_);
    }

    override public function toString():String {
        return (formatToString("SETCONDITION", "conditionEffect_", "conditionDuration_"));
    }

}
}//package ClientPackets

