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

//com.company.util.Random

package com.company.util{
    public class Random {

        public var seed:uint;

        public function Random(_arg1:uint=1){
            this.seed = _arg1;
        }
        public static function _6Z_():uint{
            return (Math.round(((Math.random() * (uint.MAX_VALUE - 1)) + 1)));
        }

        public function _ds():uint{
            return (this._M_L_());
        }
        public function _J_t():Number{
            return ((this._M_L_() / 2147483647));
        }
        public function _9D_(_arg1:Number=0, _arg2:Number=1):Number{
            var _local3:Number = (this._M_L_() / 2147483647);
            var _local4:Number = (this._M_L_() / 2147483647);
            var _local5:Number = (Math.sqrt((-2 * Math.log(_local3))) * Math.cos(((2 * _local4) * Math.PI)));
            return ((_arg1 + (_local5 * _arg2)));
        }
        public function _0M_K_(_arg1:uint, _arg2:uint):uint{
            return ((((_arg1)==_arg2) ? _arg1 : (_arg1 + (this._M_L_() % (_arg2 - _arg1)))));
        }
        public function _0E_0(_arg1:Number, _arg2:Number):Number{
            return ((_arg1 + ((_arg2 - _arg1) * this._J_t())));
        }
        private function _M_L_():uint{
            var _local1:uint;
            var _local2:uint;
            _local2 = (16807 * (this.seed & 0xFFFF));
            _local1 = (16807 * (this.seed >> 16));
            _local2 = (_local2 + ((_local1 & 32767) << 16));
            _local2 = (_local2 + (_local1 >> 15));
            if (_local2 > 2147483647)
            {
                _local2 = (_local2 - 2147483647);
            }
            return ((this.seed = _local2));
        }

    }
}//package com.company.util

