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

//_M_T_._O_N_

package _M_T_ {
import _0_p._D_v;

import _03T_._078;

import flash.events.IEventDispatcher;
import flash.events.EventDispatcher;

import _0_p.IContext;

public class _O_N_ implements _D_v {

    private const _ul:String = _078.create(_O_N_);

    private var _eventDispatcher:IEventDispatcher;

    public function _O_N_(_arg1:IEventDispatcher = null) {
        this._eventDispatcher = ((_arg1) || (new EventDispatcher()));
    }

    public function extend(_arg1:IContext):void {
        _arg1._O_R_.map(IEventDispatcher)._q3(this._eventDispatcher);
    }

    public function toString():String {
        return (this._ul);
    }

}
}//package _M_T_

