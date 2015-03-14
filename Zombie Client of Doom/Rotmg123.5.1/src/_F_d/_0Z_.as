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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// either expressed or implied, of the FreeBSD Project.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_F_d._0Z_

package _F_d {
import _0_p.IExtension;

import _03T_._078;

import _0_p.IContext;

import _eZ_.Injector;

import _0_p._Q_5;

import flash.display.DisplayObjectContainer;

import _9W_.ModularContextEvent;

import _s3._im;

import _9W_._J_6;
import _9W_._we;

public class _0Z_ implements IExtension {

    private const _ul:String = _078.create(_0Z_);

    private var _rA_:IContext;
    private var _vz:Injector;
    private var _eo:_Q_5;
    private var _eW_:Boolean;
    private var _extends:Boolean;

    public function _0Z_(_arg1:Boolean = true, _arg2:Boolean = true) {
        this._eW_ = _arg1;
        this._extends = _arg2;
    }

    public function extend(_arg1:IContext):void {
        this._rA_ = _arg1;
        this._vz = _arg1.injector;
        this._eo = _arg1._0H_4(this);
        this._rA_._iL_._8u(this._8u);
    }

    public function toString():String {
        return (this._ul);
    }

    private function _8u():void {
        ((this._eW_) && (this._R_L_()));
        ((this._extends) && (this._03p()));
    }

    private function _R_L_():void {
        var _local1:DisplayObjectContainer;
        if (this._vz._d6(DisplayObjectContainer)) {
            this._eo.debug("Context configured to inherit. Broadcasting existence event...");
            _local1 = this._vz.getInstance(DisplayObjectContainer);
            _local1.dispatchEvent(new ModularContextEvent(ModularContextEvent._qb, this._rA_));
        } else {
            this._eo._0E_Q_("Context has been configured to inherit dependencies but has no way to do so");
        }
    }

    private function _03p():void {
        var _local1:_im;
        var _local2:DisplayObjectContainer;
        if (this._vz._d6(_im)) {
            this._eo.debug("Context has a ViewManager. Configuring view manager based context existence watcher...");
            _local1 = this._vz.getInstance(_im);
            new _J_6(this._rA_, _local1);
        } else {
            if (this._vz._d6(DisplayObjectContainer)) {
                this._eo.debug("Context has a ContextView. Configuring context view based context existence watcher...");
                _local2 = this._vz.getInstance(DisplayObjectContainer);
                new _we(this._rA_, _local2);
            } else {
                this._eo._0E_Q_("Context has been configured to expose its dependencies but has no way to do so");
            }
        }
    }

}
}//package _F_d

