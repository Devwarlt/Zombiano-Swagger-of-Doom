/**
 * Created by Fabian on 15.11.2014.
 */
package ServerPackets {
import flash.utils.IDataInput;

public class TeleportRequest extends ServerPacket {

    public var name_:String;
    public var objectId_:int;

    public function TeleportRequest(_arg1:uint) {
        super(_arg1);
    }

    override public function parseFromInput(_arg1:IDataInput):void {
        name_ = _arg1.readUTF();
        objectId_ = _arg1.readInt();
    }
}
}
