// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets._2q

package ClientPackets {

import flash.utils.IDataOutput;

public class _2q extends ClientPacket {

    public function _2q(_arg1:uint) {
        this.offer_ = new Vector.<Boolean>();
        super(_arg1);
    }
    public var offer_:Vector.<Boolean>;

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeShort(this.offer_.length);
        var _local2:int;
        while (_local2 < this.offer_.length) {
            _arg1.writeBoolean(this.offer_[_local2]);
            _local2++;
        }
    }

    override public function toString():String {
        return (formatToString("CHANGETRADE", "offer_"));
    }

}
}//package ClientPackets

