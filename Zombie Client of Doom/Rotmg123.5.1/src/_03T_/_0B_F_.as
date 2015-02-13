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

//_03T_._0B_F_

package _03T_{
    import _0_p._Q_5;
    import _0_p._fq;
    import flash.utils.getTimer;

    public class _0B_F_ implements _Q_5 {

        private var _08C_:Object;
        private var _R_d:_fq;

        public function _0B_F_(_arg1:Object, _arg2:_fq){
            this._08C_ = _arg1;
            this._R_d = _arg2;
        }
        public function debug(_arg1:*, _arg2:Array=null):void{
            this._R_d.log(this._08C_, 32, getTimer(), _arg1, _arg2);
        }
        public function info(_arg1:*, _arg2:Array=null):void{
            this._R_d.log(this._08C_, 16, getTimer(), _arg1, _arg2);
        }
        public function _0E_Q_(_arg1:*, _arg2:Array=null):void{
            this._R_d.log(this._08C_, 8, getTimer(), _arg1, _arg2);
        }
        public function error(_arg1:*, _arg2:Array=null):void{
            this._R_d.log(this._08C_, 4, getTimer(), _arg1, _arg2);
        }
        public function _0_6(_arg1:*, _arg2:Array=null):void{
            this._R_d.log(this._08C_, 2, getTimer(), _arg1, _arg2);
        }

    }
}//package _03T_

