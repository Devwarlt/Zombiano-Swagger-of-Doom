// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ServerPackets._08K_

package ServerPackets {
import flash.utils.IDataInput;

public class InvResult extends ServerPacket {

    public function InvResult(_arg1:uint) {
        super(_arg1);
    }
    public var result_:int;

    override public function parseFromInput(_arg1:IDataInput):void {
        this.result_ = _arg1.readInt();
    }

    override public function toString():String {
        return (formatToString("INVRESULT", "result_"));
    }

}
}//package ServerPackets

