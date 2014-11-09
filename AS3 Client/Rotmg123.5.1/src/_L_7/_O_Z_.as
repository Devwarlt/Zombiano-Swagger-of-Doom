// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_L_7._O_Z_

package _L_7{
    import flash.display.Sprite;
    import flash.display.Shape;
    import flash.display.Graphics;
    import com.company.assembleegameclient.appengine._02k;
    import _00g._0H_i;
    import flash.events.Event;
    import com.company.assembleegameclient.util.offer.Offers;
    import _Z_h._B_R_;
    import _0D_d._A_R_;
    import _zo._8C_;
    import _9R_._B_w;

    public class _O_Z_ extends Sprite {

        private var _2m:Boolean;

        public function _O_Z_(){
            var _local1:Shape = new Shape();
            var _local2:Graphics = _local1.graphics;
            _local2.clear();
            _local2.beginFill(0, 0.8);
            _local2.drawRect(0, 0, 800, 600);
            _local2.endFill();
            addChild(_local1);
            _02k._U_t("/kongregate", this._nK_);
        }
        private function _nK_(_arg1:_8C_):void{
            var _local2:_0H_i = new _0H_i();
            _local2.addEventListener(Event.CANCEL, this.onCancel);
            _local2.addEventListener(Event.COMPLETE, this.onComplete);
            _local2._0J_E_ = new Offers(XML(_arg1.data_));
            _local2._yI_ = "";
            _local2._Q_W_ = " Kreds";
            _local2._02Z_ = false;
            _local2._04Z_ = new _B_R_();
            var _local3:_A_R_ = new _A_R_(_local2);
            addChild(_local3);
        }
        private function onComplete(_arg1:Event):void{
            dispatchEvent(new _B_w());
            parent.removeChild(this);
        }
        private function onCancel(_arg1:Event):void{
            parent.removeChild(this);
        }

    }
}//package _L_7

