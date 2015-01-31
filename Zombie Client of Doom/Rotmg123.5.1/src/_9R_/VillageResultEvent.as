// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_9R_._J_F_

package _9R_{
    import flash.events.Event;

    public class VillageResultEvent extends Event {

        public static const VILLAGE_RESULT:String = "VILLAGERESULTEVENT";

        public var success_:Boolean;
        public var errorText_:String;

        public function VillageResultEvent(_arg1:Boolean, _arg2:String){
            super(VILLAGE_RESULT);
            this.success_ = _arg1;
            this.errorText_ = _arg2;
        }
        override public function toString():String{
            return (formatToString("VILLAGERESULTEVENT", "success_", "errorText_"));
        }

    }
}//package _9R_

