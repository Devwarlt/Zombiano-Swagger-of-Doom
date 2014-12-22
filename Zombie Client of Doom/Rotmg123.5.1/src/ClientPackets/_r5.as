// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets._r5

package ClientPackets {
import flash.utils.IDataOutput;

public class _r5 extends ClientPacket {

    public function _r5(_arg1:uint) {
        super(_arg1);
    }
    public var charId_:int;

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeInt(this.charId_);
    }

    override public function toString():String {
        return (formatToString("LOAD", "charId_"));
    }

}
}//package ClientPackets

