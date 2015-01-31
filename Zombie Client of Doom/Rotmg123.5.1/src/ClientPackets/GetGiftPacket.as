/**
 * Created by Fabian on 27.12.2014.
 */
package ClientPackets {
import flash.utils.IDataOutput;

public class GetGiftPacket extends ClientPacket {

    public var itemId:int;
    public var del:Boolean;

    public function GetGiftPacket(packetId:uint) {
        super(packetId);
    }

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeInt(itemId);
        _arg1.writeBoolean(del);
    }
}
}
