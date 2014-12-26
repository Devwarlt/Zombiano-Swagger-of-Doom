/**
 * Created by Fabian on 26.12.2014.
 */
package ServerPackets {
import flash.utils.IDataInput;

public class UnlockedPacket extends ServerPacket {

    public var type:int;
    public var itemId:int;

    public function UnlockedPacket(packetId:uint) {
        super(packetId);
    }

    override public function parseFromInput(_arg1:IDataInput):void {
        type = _arg1.readUnsignedByte();
        itemId = _arg1.readUnsignedShort();
    }
}
}
