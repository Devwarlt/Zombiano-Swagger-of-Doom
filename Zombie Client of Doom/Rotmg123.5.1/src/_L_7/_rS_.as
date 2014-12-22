// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_L_7._rS_

package _L_7 {
import _F_1._H_o;

import _Z_h._m7;

import _qN_.Account;
import _qN_._9j;

import com.company.ui.SimpleText;

import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;

public class _rS_ extends _9j {

    private static const _Y_J_:int = 18;

    public function _rS_() {
        this.refresh();
    }
    private var _cY_:SimpleText = null;
    private var _0D_P_:_H_o = null;

    override public function refresh():void {
        if (this._cY_ != null) {
            removeChild(this._cY_);
            this._cY_ = null;
        }
        var _local1:_m7 = (Account._get() as _m7);
        this._cY_ = new SimpleText(_Y_J_, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        if (!_local1.isRegistered()) {
            this._cY_.text = "guest account - ";
            this._0D_P_ = new _H_o("register", _Y_J_, false);
            this._0D_P_.addEventListener(MouseEvent.CLICK, this._mO_);
        } else {
            this._cY_.text = ("logged in as " + _local1._2J_());
        }
        this._cY_.updateMetrics();
        this._cY_.filters = [new DropShadowFilter(0, 0, 0, 1, 4, 4)];
        addChild(this._cY_);
        if (this._0D_P_ != null) {
            this._0D_P_.x = width;
            addChild(this._0D_P_);
        }
    }

    private function _mO_(_arg1:MouseEvent):void {
        var _local2:_m7 = (Account._get() as _m7);
        _local2._nq.services.showRegistrationBox();
    }

}
}//package _L_7

