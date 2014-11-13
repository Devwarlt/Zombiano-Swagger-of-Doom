// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_9R_._3E_

package _9R_{
    import flash.events.Event;
    import ServerPackets.NameResult;

    public class _3E_ extends Event {

        public static const NAMERESULTEVENT:String = "NAMERESULTEVENT";

        public var _yS_:NameResult;

        public function _3E_(_arg1:NameResult){
            super(NAMERESULTEVENT);
            this._yS_ = _arg1;
        }
    }
}//package _9R_

