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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_03T_._00x

package _03T_ {
import flash.utils.Dictionary;

import _0B_K_._0I_q;
import _0B_K_._0D_C_;

import _0_p.IContext;
import _0_p._Q_5;

public class _00x {

    private const _ul:String = _078.create(_00x);
    private const __each:Dictionary = new Dictionary(true);
    private const _07e:_0I_q = new _0D_C_();

    private var _rA_:IContext;
    private var _eo:_Q_5;

    public function _00x(_arg1:IContext) {
        this._rA_ = _arg1;
        this._eo = this._rA_._0H_4(this);
    }

    public function _0M_y(_arg1:Object):void {
        var _local2:Class;
        if ((_arg1 is Class)) {
            ((this.__each[_arg1]) || (this._0M_y(new ((_arg1 as Class))())));
        } else {
            _local2 = this._07e.getClass(_arg1);
            if (this.__each[_local2]) {
                return;
            }
            this._eo.debug("Installing extension {0}", [_arg1]);
            this.__each[_local2] = true;
            _arg1.extend(this._rA_);
        }
    }

    public function toString():String {
        return (this._ul);
    }

}
}//package _03T_

