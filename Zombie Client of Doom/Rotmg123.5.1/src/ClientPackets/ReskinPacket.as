// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets._0A_1

package ClientPackets {

import flash.utils.IDataOutput;

public class ReskinPacket extends ClientPacket {

    public function ReskinPacket(_arg1:uint) {
        super(_arg1);
    }
    public var skinId:int;

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeInt(skinId);
    }

    override public function toString():String {
        return (formatToString("RESKIN", "skinId"));
    }

}
}//package ClientPackets

