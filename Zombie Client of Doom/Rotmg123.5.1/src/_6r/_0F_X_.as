// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_6r._0F_X_

package _6r{
    import flash.display.Sprite;
    import ToolTips.ToolTip;

    public class _0F_X_ extends Sprite {

        private var _vP_:ToolTip;

        public function show(_arg1:ToolTip):void{
            this.hide();
            this._vP_ = _arg1;
            if (_arg1)
            {
                addChild(_arg1);
            }
        }
        public function hide():void{
            if (((this._vP_) && (this._vP_.parent)))
            {
                this._vP_.parent.removeChild(this._vP_);
            }
            this._vP_ = null;
        }

    }
}//package _6r

