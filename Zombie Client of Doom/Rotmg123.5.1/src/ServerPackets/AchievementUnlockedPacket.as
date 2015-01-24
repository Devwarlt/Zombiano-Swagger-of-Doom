/**
 * Created by Fabian on 24.01.2015.
 */
package ServerPackets {
import flash.utils.IDataInput;

public class AchievementUnlockedPacket extends ServerPacket {

    public var type:int;
    public var title:String;
    public var description:String;

    public function AchievementUnlockedPacket(packetId:uint) {
        super(packetId);
    }

    override public function parseFromInput(rdr:IDataInput):void {
        type = rdr.readUnsignedByte();
        title = rdr.readUTF();
        description = rdr.readUTF();
    }
}
}
