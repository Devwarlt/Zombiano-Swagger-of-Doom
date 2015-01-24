// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//WebRequestEvents._8C_

package WebRequestEvents{
    import flash.events.Event;

    public class WebRequestSuccessEvent extends Event {

        public static const GENERIC_DATA:String = "GENERIC_DATA";

        public var data_:Object;

        public function WebRequestSuccessEvent(_arg1:Object){
            super(GENERIC_DATA);
            this.data_ = _arg1;
        }
        override public function toString():String{
            return (formatToString(GENERIC_DATA, "data_"));
        }

    }
}//package WebRequestEvents

