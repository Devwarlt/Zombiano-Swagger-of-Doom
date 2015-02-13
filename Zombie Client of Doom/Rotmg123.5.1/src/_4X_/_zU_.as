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

//_4X_._zU_

package _4X_{
    import flash.errors.IllegalOperationError;
    import _sp._aJ_;

    public class _zU_ {

        private var _ce:_0D_l;
        private var _d3:_qB_;
        private var _v8:_qB_;
        private var _rZ_:Boolean;
        private var _S_o:Boolean;
        private var _V_I_:Boolean;
        private var _error:String;

        final public function start():void{
            if (!this._rZ_)
            {
                this._rZ_ = true;
                ((this._ce) && (this._ce.dispatch(this)));
                this.startTask();
            }
        }
        final public function reset():void{
            if (this._rZ_)
            {
                this._rZ_ = false;
                if (!this._S_o)
                {
                    throw (new IllegalOperationError("Unable to Task.reset() when a task is ongoing"));
                }
            }
            ((this._ce) && (this._ce.removeAll()));
            ((this._d3) && (this._d3.removeAll()));
            ((this._v8) && (this._v8.removeAll()));
            this.onReset();
        }
        protected function startTask():void{
        }
        protected function onReset():void{
        }
        final protected function _C_t(_arg1:Boolean, _arg2:String=""):void{
            this._V_I_ = _arg1;
            this._error = _arg2;
            this._S_o = true;
            ((this._d3) && (this._d3.dispatch(this, _arg1, _arg2)));
            ((this._v8) && (this._v8.dispatch(this, _arg1, _arg2)));
        }
        final public function get _04K_():_aJ_{
            return ((this._ce = ((this._ce) || (new _0D_l()))));
        }
        final public function get _iu():_qB_{
            return ((this._d3 = ((this._d3) || (new _qB_()))));
        }
        internal final function get _0B_O_():_qB_{
            return ((this._v8 = ((this._v8) || (new _qB_()))));
        }
        public function get _0C_8():Boolean{
            return (this._rZ_);
        }
        public function get _qu():Boolean{
            return (this._S_o);
        }
        public function get _vm():Boolean{
            return (this._V_I_);
        }
        public function get error():String{
            return (this._error);
        }

    }
}//package _4X_

