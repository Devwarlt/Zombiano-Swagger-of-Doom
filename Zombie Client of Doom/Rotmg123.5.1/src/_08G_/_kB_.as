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

//_08G_._kB_

package _08G_ {
import _0_p.IExtension;

import _03T_._078;

import _eZ_.Injector;

import _0_p._Q_5;

import _g3.instanceOfType;

import flash.display.DisplayObjectContainer;

import _0_p.IContext;

public class _kB_ implements IExtension {

    private const _ul:String = _078.create(_kB_);

    private var _vz:Injector;
    private var _eo:_Q_5;

    public function extend(_arg1:IContext):void {
        this._vz = _arg1.injector;
        this._eo = _arg1._0H_4(this);
        _arg1._ty(instanceOfType(DisplayObjectContainer), this._uI_);
    }

    public function toString():String {
        return (this._ul);
    }

    private function _uI_(_arg1:DisplayObjectContainer):void {
        if (this._vz._d6(DisplayObjectContainer)) {
            this._eo._0E_Q_("A contextView has already been mapped, ignoring {0}", [_arg1]);
        } else {
            this._eo.debug("Mapping {0} as contextView", [_arg1]);
            this._vz.map(DisplayObjectContainer)._q3(_arg1);
        }
    }

}
}//package _08G_

