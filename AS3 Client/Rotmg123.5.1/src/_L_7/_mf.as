// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_L_7._mf

package _L_7{
    import flash.display.Sprite;
    import _0D_d.Frame;
    import flash.display.Shape;
    import flash.display.Graphics;
    import flash.events.Event;

    public class _mf extends Sprite {

        private var _Z_X_:Frame = null;
        private var _T_y:Shape;

        public function _mf(){
            this._T_y = new Shape();
            var _local1:Graphics = this._T_y.graphics;
            _local1.clear();
            _local1.beginFill(0, 0.8);
            _local1.drawRect(0, 0, 800, 600);
            _local1.endFill();
            addChild(this._T_y);
            this._X_d();
        }
        private function _X_d():void{
            this._dY_(new CurrentLoginFrame());
        }
        private function _dY_(_arg1:Frame):void{
            this._np();
            _arg1.addEventListener(_Y_S_.DONE, this._F_H_);
            _arg1.addEventListener(_Y_S_._tp, this._L_L_);
            _arg1.addEventListener(_Y_S_._G__, this._mO_);
            _arg1.addEventListener(_Y_S_.LINK, this.onLink);
            addChild(_arg1);
            this._Z_X_ = _arg1;
        }
        private function _F_H_(_arg1:_Y_S_):void{
            dispatchEvent(new Event(Event.COMPLETE));
        }
        private function _L_L_(_arg1:_Y_S_):void{
            this._X_d();
        }
        private function _mO_(_arg1:_Y_S_):void{
            this._dY_(new _0L_h());
        }
        private function onLink(_arg1:_Y_S_):void{
            this._dY_(new LinkFrame());
        }
        private function _np():void{
            if (((!((this._Z_X_ == null))) && (contains(this._Z_X_))))
            {
                removeChild(this._Z_X_);
            }
        }

    }
}//package _L_7

