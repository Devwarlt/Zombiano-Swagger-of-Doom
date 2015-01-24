// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//WebRequestEvents._mS_

package WebRequestEvents{
    import flash.events.Event;

    public class WebRequestErrorEvent extends Event {

        public static const TEXT_ERROR:String = "TEXT_ERROR";

        public var text_:String;

        public function WebRequestErrorEvent(_arg1:Object){
            super(TEXT_ERROR);
            if (_arg1 != null)
            {
                this.text_ = _arg1.toString();
            } else
            {
                this.text_ = "null";
            }
        }
        override public function clone():Event{
            return (new WebRequestErrorEvent(this.text_));
        }
        override public function toString():String{
            return (formatToString(TEXT_ERROR, "text_"));
        }

    }
}//package WebRequestEvents

