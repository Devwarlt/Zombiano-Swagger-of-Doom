/**
 * Created by Fabian on 15.11.2014.
 */
package ClientPackets {
import flash.utils.IDataOutput;

public class SprintPacket extends ClientPacket {
    public var sprintStart:Boolean;

    public function SprintPacket(_arg1:uint) {
        super(_arg1);
    }

    public override function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeBoolean(sprintStart);
    }
}
}
