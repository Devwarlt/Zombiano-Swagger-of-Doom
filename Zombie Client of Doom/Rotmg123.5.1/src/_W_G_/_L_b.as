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

//_W_G_._L_b

package _W_G_{

    import flash.utils.getQualifiedClassName;


    public class _L_b implements _09a {

        protected var _06E_:Vector.<Class>;
        protected var _cL_:Vector.<Class>;
        protected var _U_7:String;
        protected var _T_H_:Vector.<Class>;

        public function _L_b(_arg1:Vector.<Class>, _arg2:Vector.<Class>, _arg3:Vector.<Class>){
            if (((((!(_arg1)) || (!(_arg2)))) || (!(_arg3))))
            {
                throw (ArgumentError("TypeFilter parameters can not be null"));
            }
            this._06E_ = _arg1;
            this._cL_ = _arg2;
            this._T_H_ = _arg3;
        }
        public function get _M_Y_():Vector.<Class>{
            return (this._06E_);
        }
        public function get _eL_():Vector.<Class>{
            return (this._cL_);
        }
        public function get _0G_1():String{
            return ((this._U_7 = ((this._U_7) || (this._F_n()))));
        }
        public function get _E_p():Vector.<Class>{
            return (this._T_H_);
        }
        public function matches(_arg1:*):Boolean{
            var _local2:uint = this._06E_.length;
            while (_local2--)
            {
                if (!(_arg1 is this._06E_[_local2]))
                {
                    return (false);
                }
            }
            _local2 = this._T_H_.length;
            while (_local2--)
            {
                if ((_arg1 is this._T_H_[_local2]))
                {
                    return (false);
                }
            }
            if ((((this._cL_.length == 0)) && ((((this._06E_.length > 0)) || ((this._T_H_.length > 0))))))
            {
                return (true);
            }
            _local2 = this._cL_.length;
            while (_local2--)
            {
                if ((_arg1 is this._cL_[_local2]))
                {
                    return (true);
                }
            }
            return (false);
        }
        protected function _C_S_(_arg1:Vector.<Class>):Vector.<String>{
            var _local2:String;
            var _local3:Vector.<String> = new <String>[];
            var _local4:uint = _arg1.length;
            var _local5:uint;
            while (_local5 < _local4)
            {
                _local2 = getQualifiedClassName(_arg1[_local5]);
                _local3[_local3.length] = _local2;
                _local5++;
            }
            _local3.sort(this._K_s);
            return (_local3);
        }
        protected function _F_n():String{
            var _local1:Vector.<String> = this._C_S_(this._M_Y_);
            var _local2:Vector.<String> = this._C_S_(this._eL_);
            var _local3:Vector.<String> = this._C_S_(this._E_p);
            return (((((("all of: " + _local1.toString()) + ", any of: ") + _local2.toString()) + ", none of: ") + _local3.toString()));
        }
        protected function _K_s(_arg1:String, _arg2:String):int{
            if (_arg1 < _arg2)
            {
                return (1);
            }
            return (-1);
        }

    }
}//package _W_G_

