﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_zD_._uf

package _zD_ {
import _C__._cM_;

import _F_1.MainTitleScreen;
import _F_1._E_r;

import _U_5._01W_;

public class _uf extends _cM_ {

    [Inject]
    public var view:_E_r;
    [Inject]
    public var _T__:_01W_;

    override public function initialize():void {
        this.view._J_b.add(this._E_R_);
    }

    override public function destroy():void {
        this.view._J_b.remove(this._E_R_);
    }

    private function _E_R_():void {
        this._T__.dispatch(new MainTitleScreen());
    }

}
}//package _zD_

