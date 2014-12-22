// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets.ClientPacket

package ClientPackets{
    import com.company.net.Packet;
    import flash.utils.IDataInput;

    public class ClientPacket extends Packet {

        public function ClientPacket(_arg1:uint){
            super(_arg1);
        }
        final override public function parseFromInput(_arg1:IDataInput):void{
            throw (new Error((("Client should not receive " + id_) + " messages")));
        }

    }
}//package ClientPackets

