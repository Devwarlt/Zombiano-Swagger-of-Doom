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

//_092._0H_I_

package _092{
    import _qj._0K_d;
    import _qj._pn;
    import _qj.Description;

    public class _0H_I_ extends _0K_d {

        private var _Z_1:Array;

        public function _0H_I_(_arg1:Array){
            this._Z_1 = ((_arg1) || ([]));
        }
        override protected function matchesOrDescribesMismatch(_arg1:Object, _arg2:Description):Boolean{
            var _local3:_pn;
            for each (_local3 in this._Z_1)
            {
                if (!_local3.matches(_arg1))
                {
                    _arg2._ka(_local3).appendText(" ")._zW_(_local3, _arg1);
                    return (false);
                }
            }
            return (true);
        }
        override public function describeTo(_arg1:Description):void{
            _arg1._05o("(", " and ", ")", this._Z_1);
        }

    }
}//package _092

