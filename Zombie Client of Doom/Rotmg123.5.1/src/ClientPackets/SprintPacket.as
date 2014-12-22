/**
 * Created by Fabian on 15.11.2014.
 */
package ClientPackets {
import flash.utils.IDataOutput;

public class SprintPacket extends ClientPacket {
    public function SprintPacket(_arg1:uint) {
        super(_arg1);
    }
    public var sprintStart:Boolean;

    public override function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeBoolean(sprintStart);
    }
}
}
