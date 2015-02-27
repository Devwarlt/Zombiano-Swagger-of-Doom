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

//_qY_._T_7

package _qY_ {
import _E_E_._U_A_;

import flash.utils.Dictionary;

import _eZ_._08b;

import _E_x._F_B_;
import _E_x._00J_;

import _g2._00d;
import _g2._06n;

public class _T_7 implements _U_A_ {

    private const _2I_:Dictionary = new Dictionary();

    private var _vz:_08b;
    private var _4U_:_F_B_;

    public function _T_7(_arg1:_08b, _arg2:_F_B_) {
        this._vz = _arg1;
        this._4U_ = _arg2;
    }

    public function map(_arg1:Class, _arg2:Boolean = false):_00d {
        var _local3:_00J_ = (this._2I_[_arg1] = ((this._2I_[_arg1]) || (this._F_q(_arg1, _arg2))));
        return (this._4U_.map(_local3));
    }

    public function _1Y_(_arg1:Class):_06n {
        return (this._4U_._1Y_(this._8R_(_arg1)));
    }

    private function _F_q(_arg1:Class, _arg2:Boolean = false):_00J_ {
        return (new _02O_(this._vz, _arg1, _arg2));
    }

    private function _8R_(_arg1:Class):_00J_ {
        return (this._2I_[_arg1]);
    }

}
}//package _qY_

