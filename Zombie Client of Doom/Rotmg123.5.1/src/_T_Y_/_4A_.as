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

//_T_Y_._4A_

package _T_Y_ {
import _0_p._fq;
import _0_p.IContext;
import _0_p._C_P_;

public class _4A_ implements _fq {

    private const _Z_p:_08n = new _08n();

    private var _rA_:IContext;

    public function _4A_(_arg1:IContext) {
        this._rA_ = _arg1;
    }

    public function log(_arg1:Object, _arg2:uint, _arg3:int, _arg4:String, _arg5:Array = null):void {
        trace(((((((((_arg3 + " ") + _C_P_._A_n[_arg2]) + " ") + this._rA_) + " ") + _arg1) + " - ") + this._Z_p._nx(_arg4, _arg5)));
    }

}
}//package _T_Y_

