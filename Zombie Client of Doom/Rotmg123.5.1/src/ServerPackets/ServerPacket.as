// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ServerPackets.ServerPacket

package ServerPackets {
import com.company.net.Packet;

import flash.utils.IDataOutput;

public class ServerPacket extends Packet {

    public function ServerPacket(_arg1:uint) {
        super(_arg1);
    }

    final override public function writeToOutput(_arg1:IDataOutput):void {
        throw (new Error((("Client should not send " + id_) + " messages")));
    }

}
}//package ServerPackets

