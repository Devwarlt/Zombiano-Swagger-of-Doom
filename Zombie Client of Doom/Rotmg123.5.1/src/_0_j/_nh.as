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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// either expressed or implied, of the FreeBSD Project.// either expressed or implied, of the FreeBSD Project.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0_j._nh

package _0_j{
    import _060._H_G_;
    import com.company.util.Keys;
    import _060._0F_z;
    import _060._rp;

    public class _nh extends _H_G_ {

        public static const _C_7:int = 0;
        public static const _3O_:int = 1;
        public static const _001:int = 2;
        public static const _mt:int = 3;

        public function _nh(){
            _6B_("(D)raw", Keys.D, this._0M_c, _3O_);
            _6B_("(E)rase", Keys.E, this._3, _001);
            _6B_("S(A)mple", Keys.A, this._bc, _mt);
            _6B_("(U)ndo", Keys.U, this._ck, _C_7);
            _6B_("(R)edo", Keys.R, this._0I_x, _C_7);
            _6B_("(C)lear", Keys.C, this._hm, _C_7);
            _034();
            _6B_("(L)oad", Keys.L, this._0E_o, _C_7);
            _6B_("(S)ave", Keys.S, this._na, _C_7);
        }
        private function _0M_c(_arg1:_0F_z):void{
            setSelected(_arg1);
        }
        private function _3(_arg1:_0F_z):void{
            setSelected(_arg1);
        }
        private function _bc(_arg1:_0F_z):void{
            setSelected(_arg1);
        }
        private function _ck(_arg1:_0F_z):void{
            dispatchEvent(new _rp(_rp.UNDO_COMMAND_EVENT));
        }
        private function _0I_x(_arg1:_0F_z):void{
            dispatchEvent(new _rp(_rp.REDO_COMMAND_EVENT));
        }
        private function _hm(_arg1:_0F_z):void{
            dispatchEvent(new _rp(_rp.CLEAR_COMMAND_EVENT));
        }
        private function _0E_o(_arg1:_0F_z):void{
            dispatchEvent(new _rp(_rp.LOAD_COMMAND_EVENT));
        }
        private function _na(_arg1:_0F_z):void{
            dispatchEvent(new _rp(_rp.SAVE_COMMAND_EVENT));
        }
    }
}//package _0_j

