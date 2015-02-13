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

//_W_G_._024

package _W_G_{

    import flash.errors.IllegalOperationError;


    public class _024 implements _r6, _aK_ {

        protected const _06E_:Vector.<Class> = new Vector.<Class>();
        protected const _cL_:Vector.<Class> = new Vector.<Class>();
        protected const _T_H_:Vector.<Class> = new Vector.<Class>();

        protected var _eD_:_09a;

        public function allOf(... _args):_024{
            this._E_c(_args, this._06E_);
            return (this);
        }
        public function anyOf(... _args):_024{
            this._E_c(_args, this._cL_);
            return (this);
        }
        public function noneOf(... _args):_024{
            this._E_c(_args, this._T_H_);
            return (this);
        }
        public function _oJ_():_09a{
            return ((this._eD_ = ((this._eD_) || (this._3K_()))));
        }
        public function _0K_C_():_aK_{
            this._oJ_();
            return (this);
        }
        public function clone():_024{
            return (new _024().allOf(this._06E_).anyOf(this._cL_).noneOf(this._T_H_));
        }
        protected function _3K_():_09a{
            if ((((((this._06E_.length == 0)) && ((this._cL_.length == 0)))) && ((this._T_H_.length == 0))))
            {
                throw (new _s2(_s2._0D_O_));
            }
            return (new _L_b(this._06E_, this._cL_, this._T_H_));
        }
        protected function _E_c(_arg1:Array, _arg2:Vector.<Class>):void{
            ((this._eD_) && (this._0L_l()));
            this._05X_(_arg1, _arg2);
        }
        protected function _0L_l():void{
            throw (new IllegalOperationError("This TypeMatcher has been sealed and can no longer be configured"));
        }
        protected function _05X_(_arg1:Array, _arg2:Vector.<Class>):void{
            var _local3:Class;
            if ((((_arg1.length == 1)) && ((((_arg1[0] is Array)) || ((_arg1[0] is Vector.<Class>))))))
            {
                for each (_local3 in _arg1[0])
                {
                    _arg2.push(_local3);
                }
            } else
            {
                for each (_local3 in _arg1)
                {
                    _arg2.push(_local3);
                }
            }
        }

    }
}//package _W_G_

