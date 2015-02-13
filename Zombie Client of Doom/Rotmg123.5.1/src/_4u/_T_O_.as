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

//_4u._T_O_

package _4u{
    import flash.utils.Dictionary;
    import _0B_K_._0I_q;
    import _0J_k._Q_m;

    public class _T_O_ {

        public var _yE_:Dictionary;
        private var _07e:_0I_q;

        public function _T_O_(_arg1:_0I_q, _arg2:Dictionary){
            this._yE_ = _arg2;
            this._07e = _arg1;
        }
        public function _0K_k(_arg1:Class):_Q_m{
            return ((this._yE_[_arg1] = ((this._yE_[_arg1]) || (this._07e._s4(_arg1)))));
        }
        public function _xl(_arg1:Class, _arg2:_Q_m):void{
            this._yE_[_arg1] = _arg2;
        }

    }
}//package _4u

