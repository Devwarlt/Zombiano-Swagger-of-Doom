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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// either expressed or implied, of the FreeBSD Project.// either expressed or implied, of the FreeBSD Project.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0K_._C_v

package _0K_ {
import _j1._X_y;

import flash.utils.Dictionary;

import _eZ_.Injector;

import flash.events.IEventDispatcher;

import _E_x._F_B_;
import _E_x._00J_;

import _g2.ICommandMapper;
import _g2.ICommandUnmapper;

public class _C_v implements _X_y {

    private const _Z_s:Dictionary = new Dictionary();

    private var _vz:Injector;
    private var _0L_4:IEventDispatcher;
    private var _iS_:_F_B_;

    public function _C_v(_arg1:Injector, _arg2:IEventDispatcher, _arg3:_F_B_) {
        this._vz = _arg1;
        this._0L_4 = _arg2;
        this._iS_ = _arg3;
    }

    public function map(_arg1:String, _arg2:Class = null):ICommandMapper {
        var _local3:_00J_ = (this._Z_s[(_arg1 + _arg2)] = ((this._Z_s[(_arg1 + _arg2)]) || (this._F_0(_arg1, _arg2))));
        return (this._iS_.map(_local3));
    }

    public function _1Y_(_arg1:String, _arg2:Class = null):ICommandUnmapper {
        return (this._iS_._1Y_(this._71(_arg1, _arg2)));
    }

    private function _F_0(_arg1:String, _arg2:Class = null):_00J_ {
        return (new _eO_(this._vz, this._0L_4, _arg1, _arg2));
    }

    private function _71(_arg1:String, _arg2:Class = null):_00J_ {
        return (this._Z_s[(_arg1 + _arg2)]);
    }

}
}//package _0K_

