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

//_zD_._N_N_

package _zD_{
    import _C__._cM_;

import _F_1._01_;
import _F_1._C_Q_;

import _W_D_._0I_H_;
    import _U_5._dd;

    public class _N_N_ extends _cM_ {

        [Inject]
        public var view:_01_;
        [Inject]
        public var _eJ_:_0I_H_;
        [Inject]
        public var _T__:_dd;

        override public function initialize():void{
            this.view._4s.add(this._G_P_);
            this.view.initialize(this._eJ_._T_1);
        }
        override public function destroy():void{
            this.view._4s.remove(this._G_P_);
        }
        private function _G_P_():void{
            this._T__.dispatch(new _C_Q_());
        }

    }
}//package _zD_

