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

//_9W_._we

package _9W_ {
import _03T_._078;

import _0_p._Q_5;

import _eZ_._08b;

import flash.display.DisplayObjectContainer;

import _0_p.IContext;

public class _we {

    private const _ul:String = _078.create(_we);

    private var _eo:_Q_5;
    private var _vz:_08b;
    private var _sz:DisplayObjectContainer;
    private var _xO_:IContext;

    public function _we(_arg1:IContext, _arg2:DisplayObjectContainer) {
        this._eo = _arg1._0H_4(this);
        this._vz = _arg1._O_R_;
        this._sz = _arg2;
        _arg1._iL_._kf(this.destroy);
        this.init();
    }

    public function toString():String {
        return (this._ul);
    }

    private function init():void {
        this._eo.debug("Listening for context existence events on contextView {0}", [this._sz]);
        this._sz.addEventListener(ModularContextEvent._qb, this._R_);
    }

    private function destroy():void {
        this._eo.debug("Removing modular context existence event listener from contextView {0}", [this._sz]);
        this._sz.removeEventListener(ModularContextEvent._qb, this._R_);
        if (this._xO_) {
            this._eo.debug("Unlinking parent injector for child context {0}", [this._xO_]);
            this._xO_._O_R_._k = null;
        }
    }

    private function _R_(_arg1:ModularContextEvent):void {
        _arg1.stopImmediatePropagation();
        this._xO_ = _arg1.context;
        this._eo.debug("Context existence event caught. Configuring child context {0}", [this._xO_]);
        this._xO_._O_R_._k = this._vz;
    }

}
}//package _9W_

