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

//_zD_._V_M_

package _zD_{
    import _C__._cM_;

import _F_1._05p;
import _F_1._C_Q_;

import _W_D_._0I_H_;
    import _U_5._sC_;
    import _U_5._sT_;
    import _U_5._M_d;
    import _U_5._01W_;
    import ToolTips.ToolTip;
    import flash.display.Sprite;

    public class _V_M_ extends _cM_ {

        [Inject]
        public var view:_05p;
        [Inject]
        public var _eJ_:_0I_H_;
        [Inject]
        public var _0C__:_sC_;
        [Inject]
        public var _H_F_:_sT_;
        [Inject]
        public var _0B_a:_M_d;
        [Inject]
        public var _0_b:_01W_;

        override public function initialize():void{
            this.view.tooltip.add(this._Y_Y_);
            this.view._03I_.add(this._C_R_);
        }
        override public function destroy():void{
            this.view.tooltip.remove(this._Y_Y_);
            this.view._03I_.remove(this._C_R_);
            this.view.destroy();
            this._H_F_.dispatch();
        }
        private function _Y_Y_(_arg1:ToolTip):void{
            this._0C__.dispatch(_arg1);
        }
        private function _C_R_(_arg1:Class):void{
            var _local2:Sprite = new (((_arg1) || (_C_Q_)))();
            this._0B_a.dispatch();
            this._0_b.dispatch(_local2);
        }

    }
}//package _zD_

