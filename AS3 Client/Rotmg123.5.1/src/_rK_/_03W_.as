// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_rK_._03W_

package _rK_{
    import flash.display.Sprite;
    import flash.display.Shape;
    import flash.display.Graphics;
    import _qN_.Account;
    import _01H_._f7;
    import com.company.assembleegameclient.appengine._02k;
    import flash.events.Event;
    import _00g._0H_i;
    import com.company.assembleegameclient.util.offer.Offers;
    import _01H_._6z;
    import _0D_d._A_R_;
    import _zo._8C_;

    import com.company.assembleegameclient.util.offer.Offer;
    import _9R_._B_w;

    public class _03W_ extends Sprite {

        private var _2m:Boolean;

        public function _03W_(_arg1:Boolean=false){
            var _local3:Shape;
            var _local4:Graphics;
            super();
            this._2m = _arg1;
            var _local2:_f7 = (Account._get() as _f7);
            if (this._W_l(_local2))
            {
                _local3 = new Shape();
                _local4 = _local3.graphics;
                _local4.clear();
                _local4.beginFill(0, 0.8);
                _local4.drawRect(0, 0, 800, 600);
                _local4.endFill();
                addChild(_local3);
                _02k._U_t("/steamworks", this._nK_);
            } else
            {
                this.addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            }
        }
        private function _W_l(_arg1:_f7){
            return (((!(_arg1._Z_d.hasOwnProperty("isOverlayEnabled"))) || (_arg1._Z_d.isOverlayEnabled())));
        }
        private function onAddedToStage(_arg1:Event):void{
            removeEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            parent.addChild(new _lA_());
            parent.removeChild(this);
        }
        private function _nK_(_arg1:_8C_):void{
            var _local2:_0H_i = new _0H_i();
            _local2.addEventListener(Event.CANCEL, this.onCancel);
            _local2.addEventListener(Event.COMPLETE, this.onComplete);
            _local2._0J_E_ = new Offers(XML(_arg1.data_));
            _local2._yI_ = "";
            _local2._Q_W_ = (" " + this._V_7(_local2));
            _local2._02Z_ = false;
            _local2._04Z_ = new _6z();
            var _local3:_A_R_ = new _A_R_(_local2);
            addChild(_local3);
        }
        private function _V_7(_arg1:_0H_i):String{
            var _local2:Vector.<Offer> = _arg1._0J_E_.offerList;
            return (((_local2.length) ? _local2[0].currency_ : ""));
        }
        private function onComplete(_arg1:Event):void{
            dispatchEvent(new _B_w());
            parent.removeChild(this);
        }
        private function onCancel(_arg1:Event):void{
            parent.removeChild(this);
        }

    }
}//package _rK_

