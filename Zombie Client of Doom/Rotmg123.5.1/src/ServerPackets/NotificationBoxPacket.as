/**
 * Created by Fabian on 12.11.2014.
 */
package ServerPackets {
import flash.utils.IDataInput;

public class NotificationBoxPacket extends _01Q_
{
    public var text:String;
    public var head:String;

    public function NotificationBoxPacket(_arg1:uint) {
        super(_arg1);
    }

    override public function parseFromInput(_arg1:IDataInput):void {
        this.head = _arg1.readUTF();
        this.text = _arg1.readUTF();
    }

    override public function toString():String {
        return (formatToString("NOTIFICATIONBOX", "head", "text"));
    }
}
}