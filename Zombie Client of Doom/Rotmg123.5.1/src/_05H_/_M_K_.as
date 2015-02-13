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

//_05H_._M_K_

package _05H_{
    public class _M_K_ extends _U_y {

        private static const _sw:String = "21";

        private var _1R_:XMLList;
        private var _W_6:XMLList;

        public function _M_K_(){
            _t4 = "";
        }
        override protected function compareSlots(itemXML:XML, curItemXML:XML):void{
            var defense:int;
            var otherDefense:int;
            this._1R_ = itemXML.ActivateOnEquip.(@stat == _sw);
            this._W_6 = curItemXML.ActivateOnEquip.(@stat == _sw);
            if ((((this._1R_.length() == 1)) && ((this._W_6.length() == 1))))
            {
                defense = int(this._1R_.@amount);
                otherDefense = int(this._W_6.@amount);
                _P_3[this._1R_[0].toXMLString()] = this._iN_(defense, otherDefense);
            }
        }
        private function _iN_(_arg1:int, _arg2:int):String{
            var _local3:String = _qy((_arg1 - _arg2));
            return (_qF_((("+" + _arg1) + " Defense"), _local3));
        }

    }
}//package _05H_

