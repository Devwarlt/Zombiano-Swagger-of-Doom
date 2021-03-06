﻿// Copyright (c) 2015, FireBite/Aceticsoft Studios Inc.
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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// either expressed or implied, of the FreeBSD Project.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_O_6._x9

package _O_6 {
import flash.events.EventDispatcher;

import _A_G_._07A_;

import flash.utils.Dictionary;

import _eZ_.Injector;

import _A_G_._08I_;

import _W_G_._09a;

import _A_G_._0H_c;

import _03T_.guardsApprove;
import _03T_.applyHooks;


public class _x9 extends EventDispatcher implements _07A_ {

    private const _09p:Dictionary = new Dictionary();

    private var _vz:Injector;

    public function _x9(_arg1:Injector) {
        this._vz = _arg1;
    }

    public function _ug(_arg1:Object, _arg2:_08I_):Object {
        return (((this._09p[_arg1]) ? this._09p[_arg1][_arg2] : null));
    }

    public function _06C_(_arg1:Object, _arg2:Class, _arg3:Array):Array {
        var _local5:_09a;
        var _local6:Object;
        var _local7:_08I_;
        var _local4:Array = [];
        for each (_local7 in _arg3) {
            _local6 = this._ug(_arg1, _local7);
            if (!_local6) {
                _local5 = _local7._01g;
                this._0I_k(_local5, _arg2, _arg1);
                _local6 = this._oz(_arg1, _local7);
                this._M_O_(_local5, _arg2, _arg1);
            }
            if (_local6) {
                _local4.push(_local6);
            }
        }
        return (_local4);
    }

    public function _0_Q_(_arg1:Object):void {
        var _local3:Object;
        var _local2:Dictionary = this._09p[_arg1];
        if (!_local2) {
            return;
        }
        if (hasEventListener(_0H_c._0J__)) {
            for (_local3 in _local2) {
                dispatchEvent(new _0H_c(_0H_c._0J__, _local2[_local3], _arg1, (_local3 as _08I_), this));
            }
        }
        delete this._09p[_arg1];
    }

    public function _N_y():void {
        var _local1:Object;
        for (_local1 in this._09p) {
            this._0_Q_(_local1);
        }
    }

    private function _oz(_arg1:Object, _arg2:_08I_):Object {
        var _local3:Object = this._ug(_arg1, _arg2);
        if (_local3) {
            return (_local3);
        }
        if (guardsApprove(_arg2._0_R_, this._vz)) {
            _local3 = this._vz.getInstance(_arg2._T_X_);
            this._vz.map(_arg2._T_X_)._q3(_local3);
            applyHooks(_arg2._7w, this._vz);
            this._vz.unmap(_arg2._T_X_);
            this._B_W_(_local3, _arg1, _arg2);
        }
        return (_local3);
    }

    private function _B_W_(_arg1:Object, _arg2:Object, _arg3:_08I_):void {
        this._09p[_arg2] = ((this._09p[_arg2]) || (new Dictionary()));
        this._09p[_arg2][_arg3] = _arg1;
        if (hasEventListener(_0H_c._00Q_)) {
            dispatchEvent(new _0H_c(_0H_c._00Q_, _arg1, _arg2, _arg3, this));
        }
    }

    private function _0I_k(_arg1:_09a, _arg2:Class, _arg3:Object):void {
        var _local4:Class;
        var _local5:Vector.<Class> = this._pN_(_arg1, _arg2);
        for each (_local4 in _local5) {
            this._vz.map(_local4)._q3(_arg3);
        }
    }

    private function _M_O_(_arg1:_09a, _arg2:Class, _arg3:Object):void {
        var _local4:Class;
        var _local5:Vector.<Class> = this._pN_(_arg1, _arg2);
        for each (_local4 in _local5) {
            if (this._vz._d6(_local4)) {
                this._vz.unmap(_local4);
            }
        }
    }

    private function _pN_(_arg1:_09a, _arg2:Class):Vector.<Class> {
        var _local3:Vector.<Class> = _arg1._M_Y_.concat(_arg1._eL_);
        if (_local3.indexOf(_arg2) == -1) {
            _local3.push(_arg2);
        }
        return (_local3);
    }

}
}//package _O_6

