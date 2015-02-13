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

//_03T_._03

package _03T_{
    import _0_p._L_y;
    import _eZ_._08b;
    import _0_p._Q_5;
    import _0_p._0E_9;
    import _qj._pn;
    import _0_p._fq;

    public class _03 implements _L_y {

        private const _vz:_08b = new _08b();
        private const _ul:String = _078.create(_03);
        private const _mr:_h0 = new _h0();
        private const _4r:_0E_S_ = new _0E_S_();

        private var _5O_:_0A_P_;
        private var _04x:_eQ_;
        private var _u7:_00x;
        private var _eo:_Q_5;

        public function _03(){
            this.setup();
        }
        public function get _O_R_():_08b{
            return (this._vz);
        }
        public function get _39():uint{
            return (this._mr._39);
        }
        public function set _39(_arg1:uint):void{
            this._mr._39 = _arg1;
        }
        public function get _iL_():_0E_9{
            return (this._5O_);
        }
        public function initialize():void{
            this._5O_.initialize();
        }
        public function destroy():void{
            this._5O_.destroy();
        }
        public function extend(... _args):_L_y{
            var _local2:Object;
            for each (_local2 in _args)
            {
                this._u7._0M_y(_local2);
            }
            return (this);
        }
        public function configure(... _args):_L_y{
            var _local2:Object;
            for each (_local2 in _args)
            {
                this._04x._0F_k(_local2);
            }
            return (this);
        }
        public function _ty(_arg1:_pn, _arg2:Function):_L_y{
            this._04x._ty(_arg1, _arg2);
            return (this);
        }
        public function _0H_4(_arg1:Object):_Q_5{
            return (this._mr._0H_4(_arg1));
        }
        public function _J_3(_arg1:_fq):_L_y{
            this._mr._J_3(_arg1);
            return (this);
        }
        public function _W_b(... _args):_L_y{
            var _local2:Object;
            for each (_local2 in _args)
            {
                this._4r._W_b(_local2);
            }
            return (this);
        }
        public function release(... _args):_L_y{
            var _local2:Object;
            for each (_local2 in _args)
            {
                this._4r.release(_local2);
            }
            return (this);
        }
        public function toString():String{
            return (this._ul);
        }
        private function setup():void{
            this._vz.map(_08b)._q3(this._vz);
            this._vz.map(_L_y)._q3(this);
            this._eo = this._mr._0H_4(this);
            this._5O_ = new _0A_P_(this);
            this._04x = new _eQ_(this);
            this._u7 = new _00x(this);
            this._5O_._8u(this._8u);
            this._5O_._3a(this._3a);
            this._5O_._zi(this._zi);
            this._5O_._0L_c(this._0L_c);
        }
        private function _8u():void{
            this._eo.info("Initializing...");
        }
        private function _3a():void{
            this._eo.info("Initialize complete");
        }
        private function _zi():void{
            this._eo.info("Destroying...");
        }
        private function _0L_c():void{
            this._4r.flush();
            this._vz._D_i();
            this._eo.info("Destroy complete");
        }

    }
}//package _03T_

