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

//_Y_3._uS_

package _Y_3{
    import _eZ_._08b;
    import flash.utils.Dictionary;
    import _eZ_._N_p;
    import flash.utils.getQualifiedClassName;
    import _4u.SsInternal;
    import _0J_k._Q_m;
    import _0J_k._tv;

    public class _uS_ implements _5d {

        private var _2h:Class;
        private var _00_:_08b;
        private var _H_w:Object;
        private var _0M_:Boolean;

        public function _uS_(_arg1:Class, _arg2:_08b){
            this._2h = _arg1;
            this._00_ = _arg2;
        }
        public function apply(_arg1:Class, _arg2:_08b, _arg3:Dictionary):Object{
            return ((this._H_w = ((this._H_w) || (this._hw(this._00_)))));
        }
        private function _hw(_arg1:_08b):Object{
            if (this._0M_)
            {
                throw (new _N_p(("Forbidden usage of unmapped singleton provider for type " + getQualifiedClassName(this._2h))));
            }
            return (_arg1.SsInternal::_0I_F_(this._2h));
        }
        public function destroy():void{
            this._0M_ = true;
            if (!this._H_w)
            {
                return;
            }
            var _local1:_Q_m = this._00_._0E_N_(this._2h);
            var _local2:_tv = _local1.__case;
            while (_local2)
            {
                _local2.applyInjection(this._H_w, this._2h, this._00_);
                _local2 = _tv(_local2.next);
            }
            this._H_w = null;
        }

    }
}//package _Y_3

