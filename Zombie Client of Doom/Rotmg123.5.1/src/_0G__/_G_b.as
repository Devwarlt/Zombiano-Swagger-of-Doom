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

//_0G__._G_b

package _0G__{
import _F_1._zf;

import _W_D_._0I_H_;
    import _U_5._dd;
    import flash.display.Sprite;
    import _4X_._E_h;
    import _02b._0D_5;
    import _4X_._o8;
    import _4X_._03L_;

    public class _G_b {

        [Inject]
        public var _0I_s:_0I_H_;
        [Inject]
        public var _T__:_dd;
        [Inject]
        public var view:Sprite;
        [Inject]
        public var _H_d:_E_h;
        [Inject]
        public var _ys:_0D_5;

        public function execute():void{
            if (this._0I_s.isLoaded)
            {
                this._qx();
            } else
            {
                this._T__.dispatch(this.view);
            }
        }
        private function _qx():void{
            this._T__.dispatch(new _zf());
            var _local1:_o8 = new _o8();
            _local1.add(this._ys);
            _local1.add(new _03L_(this._T__, this.view));
            this._H_d.add(_local1);
            _local1.start();
        }

    }
}//package _0G__

