/**
 * Created by Fabian on 27.12.2014.
 */
package ClientPackets {
import flash.utils.IDataOutput;

public class GetGift extends ClientPacket {

    public var itemId:int;

    public function GetGift(packetId:uint) {
        super(packetId);
    }

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeInt(itemId);
    }
}
}
