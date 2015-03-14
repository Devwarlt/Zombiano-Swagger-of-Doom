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

//_0J_k._0J_f

package _0J_k {
import flash.utils.Dictionary;

import _4u.SsInternal;

import _Y_3._5d;

import _M_Q_._B_h;

import flash.utils.getQualifiedClassName;

import _eZ_.Injector;

public class _0J_f extends _5W_ {

    private var _T_e:String;
    private var _08c:String;
    private var _K_W_:Boolean;

    public function _0J_f(_arg1:String, _arg2:String, _arg3:Boolean, _arg4:Dictionary) {
        this._T_e = _arg2;
        this._08c = _arg1;
        this._K_W_ = _arg3;
        this.injectParameters = _arg4;
    }

    override public function applyInjection(_arg1:Object, _arg2:Class, _arg3:Injector):void {
        var _local4:_5d = _arg3.SsInternal::_L_E_(this._08c);
        if (!_local4) {
            if (this._K_W_) {
                return;
            }
            throw (new _B_h((((((((('Injector is missing a mapping to handle injection into property "' + this._T_e) + '" of object "') + _arg1) + '" with type "') + getQualifiedClassName(_arg2)) + '". Target dependency: "') + this._08c) + '"')));
        }
        _arg1[this._T_e] = _local4.apply(_arg2, _arg3, injectParameters);
    }

}
}//package _0J_k

