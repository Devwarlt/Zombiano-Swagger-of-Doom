// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_rK_._B_c

package _rK_ {
import Frames.Frame;

import _qN_.Account;

import flash.display.Graphics;
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;

public class _B_c extends Sprite {

    public function _B_c() {
        this._T_y = new Shape();
        var _local1:Graphics = this._T_y.graphics;
        _local1.clear();
        _local1.beginFill(0, 0.8);
        _local1.drawRect(0, 0, 800, 600);
        _local1.endFill();
        addChild(this._T_y);
        if (Account._get().isRegistered()) {
            this._X_d();
        }
    }
    private var _Z_X_:Frame = null;
    private var _T_y:Shape;

    private function _X_d():void {
        this._dY_(new CurrentLoginFrame());
    }

    private function _dY_(_arg1:Frame):void {
        this._np();
        _arg1.addEventListener(_07s.DONE, this._F_H_);
        _arg1.addEventListener(_07s._tp, this._L_L_);
        _arg1.addEventListener(_07s._G__, this._mO_);
        _arg1.addEventListener(_07s.LINK, this.onLink);
        addChild(_arg1);
        this._Z_X_ = _arg1;
    }

    private function _np():void {
        if (((!((this._Z_X_ == null))) && (contains(this._Z_X_)))) {
            removeChild(this._Z_X_);
        }
    }

    private function _F_H_(_arg1:_07s):void {
        dispatchEvent(new Event(Event.COMPLETE));
    }

    private function _L_L_(_arg1:_07s):void {
        this._X_d();
    }

    private function _mO_(_arg1:_07s):void {
        this._dY_(new _0L_h());
    }

    private function onLink(_arg1:_07s):void {
        this._dY_(new LinkFrame());
    }

}
}//package _rK_

