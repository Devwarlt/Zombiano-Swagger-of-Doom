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

//_zD_._G_9

package _zD_{
    import _C__._cM_;
    import _0L_C_._s7;

import _F_1.CurrentCharacterScreen;

import com.company.assembleegameclient.appengine.SavedCharacter;
    import _02b._0F_A_;
    import _U_5.CharListResetDispatcher;
    import _U_5.SpriteTarget;
    import _4X_._zU_;

    public class _G_9 extends _cM_ {

        [Inject]
        public var view:_s7;
        [Inject]
        public var character:SavedCharacter;
        [Inject]
        public var _yD_:_0F_A_;
        [Inject]
        public var _0D_p:CharListResetDispatcher;
        [Inject]
        public var _0_b:SpriteTarget;

        override public function initialize():void{
            this._yD_._iu.addOnce(this._S_f);
            this._yD_.start();
        }
        private function _S_f(_arg1:_zU_, _arg2:Boolean, _arg3:String=""):void{
            this.view.parent.removeChild(this.view);
            this._0D_p.dispatch();
            this._0_b.dispatch(new CurrentCharacterScreen());
        }

    }
}//package _zD_

