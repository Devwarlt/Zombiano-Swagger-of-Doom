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

//_1O_._pj

package _1O_ {
import _0_p.IExtension;

import _lo._L_W_;

import _03T_._078;

import _eZ_.Injector;

import _0_p.IContext;

import _lo._t5;

public class _pj implements IExtension {

    private static var _H_0:_L_W_;
    private static var _8B_:uint;

    private const _ul:String = _078.create(_pj);

    private var _vz:Injector;

    public function extend(_arg1:IContext):void {
        _8B_++;
        this._vz = _arg1.injector;
        _arg1._iL_._0C_t(this._0C_t);
        _arg1._iL_._kf(this._kf);
    }

    public function toString():String {
        return (this._ul);
    }

    private function _0C_t():void {
        var _local1:_t5;
        if (_H_0 == null) {
            _local1 = this._vz.getInstance(_t5);
            _H_0 = new _L_W_(_local1);
        }
    }

    private function _kf():void {
        _8B_--;
        if (_8B_ == 0) {
            _H_0.destroy();
            _H_0 = null;
        }
    }

}
}//package _1O_

