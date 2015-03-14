// Copyright (c) 2015, FireBite/Aceticsoft Studios Inc.
// All rights reserved.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
// ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_03T_._eQ_

package _03T_ {
import _qj.IMatcher;

import _092.allOf;

import _g3.instanceOfType;

import _092.not;

import flash.display.DisplayObject;
import flash.utils.Dictionary;

import _eZ_.Injector;

import _0_p._Q_5;
import _0_p._I_Y_;
import _0_p.IContext;
import _0_p.IConfig;

public class _eQ_ {

    private static const _Z_9:IMatcher = allOf(instanceOfType(Object), not(instanceOfType(Class)), not(instanceOfType(DisplayObject)));

    private const _ul:String = _078.create(_eQ_);
    private const _0g:ObjectProcessor = new ObjectProcessor();
    private const _01u:Dictionary = new Dictionary();
    private const _lL_:Array = [];

    private var _vz:Injector;
    private var _eo:_Q_5;
    private var _X_P_:Boolean;

    public function _eQ_(_arg1:IContext) {
        this._vz = _arg1.injector;
        this._eo = _arg1._0H_4(this);
        this._ty(instanceOfType(Class), this._0L_I_);
        this._ty(_Z_9, this._0F_m);
        _arg1._iL_.addEventListener(_I_Y_.INITIALIZE, this.initialize, false, -100);
    }

    public function _0F_k(_arg1:Object):void {
        if (!this._01u[_arg1]) {
            this._01u[_arg1] = true;
            this._0g._049(_arg1);
        }
    }

    public function _ty(_arg1:IMatcher, _arg2:Function):void {
        this._0g._K_j(_arg1, _arg2);
    }

    public function toString():String {
        return (this._ul);
    }

    private function initialize(_arg1:_I_Y_):void {
        if (!this._X_P_) {
            this._X_P_ = true;
            this._rW_();
        }
    }

    private function _0L_I_(_arg1:Class):void {
        if (this._X_P_) {
            this._eo.debug("Already initialized. Instantiating config class {0}", [_arg1]);
            this._6V_(_arg1);
        } else {
            this._eo.debug("Not yet initialized. Queuing config class {0}", [_arg1]);
            this._lL_.push(_arg1);
        }
    }

    private function _0F_m(_arg1:Object):void {
        if (this._X_P_) {
            this._eo.debug("Already initialized. Injecting into config object {0}", [_arg1]);
            this._049(_arg1);
        } else {
            this._eo.debug("Not yet initialized. Queuing config object {0}", [_arg1]);
            this._lL_.push(_arg1);
        }
    }

    private function _rW_():void {
        var _local1:Object;
        for each (_local1 in this._lL_) {
            if ((_local1 is Class)) {
                this._eo.debug("Now initializing. Instantiating config class {0}", [_local1]);
                this._6V_((_local1 as Class));
            } else {
                this._eo.debug("Now initializing. Injecting into config object {0}", [_local1]);
                this._049(_local1);
            }
        }
        this._lL_.length = 0;
    }

    private function _6V_(_arg1:Class):void {
        var _local2:IConfig = (this._vz.getInstance(_arg1) as IConfig);
        ((_local2) && (_local2.configure()));
    }

    private function _049(_arg1:Object):void {
        this._vz._0B_B_(_arg1);
        var _local2:IConfig = (_arg1 as IConfig);
        ((_local2) && (_local2.configure()));
    }

}
}//package _03T_

