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

//_zD_.__else

package _zD_{
    import _C__._cM_;

import _F_1._0B_m;
import _F_1._U_W_;

import _W_D_._G_J_;
    import _U_5._dd;

    public class __else extends _cM_ {

        [Inject]
        public var view:_0B_m;
        [Inject]
        public var _0I_s:_G_J_;
        [Inject]
        public var _T__:_dd;

        override public function initialize():void{
            this.view._H_r.add(this._c3);
        }
        override public function destroy():void{
            this.view._H_r.remove(this._c3);
        }
        private function _c3(_arg1:int):void{
            this._0I_s._Z__ = this.view.accountId;
            this._0I_s._J_u = _arg1;
            this._T__.dispatch(new _U_W_());
        }

    }
}//package _zD_

