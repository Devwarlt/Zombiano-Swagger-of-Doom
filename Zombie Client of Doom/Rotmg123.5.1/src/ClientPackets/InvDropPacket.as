// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets._0C_G_

package ClientPackets{
    import com.company.assembleegameclient.net.messages.data._0_3;
    import flash.utils.IDataOutput;

    public class InvDropPacket extends ClientPacket {

        public var slotObject_:_0_3;

        public function InvDropPacket(_arg1:uint){
            this.slotObject_ = new _0_3();
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            this.slotObject_.writeToOutput(_arg1);
        }
        override public function toString():String{
            return (formatToString("INVDROP", "slotObject_"));
        }

    }
}//package ClientPackets

