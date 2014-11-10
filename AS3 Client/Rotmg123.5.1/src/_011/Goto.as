// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_011._04R_

package _011{
    import com.company.assembleegameclient.net.messages.data.Position;
    import flash.utils.IDataInput;

    public class Goto extends _01Q_ {

        public var objectId_:int;
        public var pos_:Position;

        public function Goto(_arg1:uint){
            this.pos_ = new Position();
            super(_arg1);
        }
        override public function parseFromInput(_arg1:IDataInput):void{
            this.objectId_ = _arg1.readInt();
            this.pos_.parseFromInput(_arg1);
        }
        override public function toString():String{
            return (formatToString("GOTO", "objectId_", "pos_"));
        }

    }
}//package _011

