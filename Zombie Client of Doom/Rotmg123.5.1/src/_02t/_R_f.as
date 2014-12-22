// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_02t._R_f

package _02t {
import com.company.assembleegameclient.ui._zX_;

import flash.display.Shape;
import flash.display.Sprite;

public class _R_f extends Sprite {

    public function _R_f() {
        this.map = new _pM_();
        addChild(this.map);
        this._E_a = new Shape();
        this._E_a.graphics.beginFill(0x2B2B2B, 0.8);
        this._E_a.graphics.drawRect(0, 0, 800, 600);
        this._E_a.graphics.endFill();
        addChild(this._E_a);
        this._W_8 = new _zX_();
        this._W_8.x = 2;
        addChild(this._W_8);
    }
    private var map:_pM_;
    private var _E_a:Shape;
    private var _W_8:_zX_;
}
}//package _02t

