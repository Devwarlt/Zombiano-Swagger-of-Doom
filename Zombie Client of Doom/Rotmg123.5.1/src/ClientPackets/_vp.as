// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets._vp

package ClientPackets {
import flash.utils.IDataOutput;

public class _vp extends ClientPacket {

    public function _vp(_arg1:uint) {
        super(_arg1);
    }
    public var objectId_:int;

    override public function writeToOutput(_arg1:IDataOutput):void {
    }

    override public function toString():String {
        return (formatToString("CANCELTRADE"));
    }

}
}//package ClientPackets

