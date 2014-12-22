// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets._oy

package ClientPackets {
import flash.utils.IDataOutput;

public class _oy extends ClientPacket {

    public function _oy(_arg1:uint) {
        super(_arg1);
    }
    public var name_:String;

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeUTF(this.name_);
    }

    override public function toString():String {
        return (formatToString("CHOOSENAME", "name_"));
    }

}
}//package ClientPackets

