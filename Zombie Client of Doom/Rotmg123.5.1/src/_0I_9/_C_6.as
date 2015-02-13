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

//_0I_9._C_6

package _0I_9{
    import flash.display.Sprite;

    public class _C_6 extends Sprite {

        private var _S_m:Sprite;
        private var _0L_U_:Sprite;

        public function _T__(_arg1:Sprite):void{
            if (this._S_m == _arg1)
            {
                return;
            }
            this._V_n();
            this._S_m = _arg1;
            addChild(_arg1);
        }
        private function _V_n():void{
            if (((this._S_m) && (contains(this._S_m))))
            {
                this._0L_U_ = this._S_m;
                removeChild(this._S_m);
            }
        }
        public function _bM_():Sprite{
            return (this._0L_U_);
        }

    }
}//package _0I_9

