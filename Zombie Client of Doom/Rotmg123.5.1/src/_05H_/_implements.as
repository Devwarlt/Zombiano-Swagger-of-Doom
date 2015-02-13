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

//_05H_._implements

package _05H_{
    public class _implements extends _U_y {

        private var _W_m:XML;
        private var _Z_x:XML;
        private var _cO_:XML;
        private var _W_M_:XML;

        override protected function compareSlots(itemXML:XML, curItemXML:XML):void{
            var tag:XML;
            _t4 = "";
            this._W_m = this._nd(itemXML, "Healing");
            this._Z_x = this._nd(itemXML, "Damaging");
            this._cO_ = this._nd(curItemXML, "Healing");
            this._W_M_ = this._nd(curItemXML, "Damaging");
            if (this._default())
            {
                this._0H_r();
                this._C_r();
                if (itemXML.@id == "Seal of Blasphemous Prayer")
                {
                    tag = itemXML.Activate.(text() == "ConditionEffectSelf")[0];
                    _t4 = (_t4 + ("Effect on Self:\n" + _qF_((("Invulnerable for " + tag.@duration) + " secs\n"), _0C_1)));
                    _5n[tag.toXMLString()] = true;
                }
            }
        }
        private function _default():Boolean{
            return (((((((!((this._W_m == null))) && (!((this._Z_x == null))))) && (!((this._cO_ == null))))) && (!((this._W_M_ == null)))));
        }
        private function _nd(xml:XML, effectName:String):XML{
            var matches:XMLList;
            var tag:XML;
            matches = xml.Activate.(text() == "ConditionEffectAura");
            for each (tag in matches)
            {
                if (tag.@effect == effectName)
                {
                    return (tag);
                }
            }
            return (null);
        }
        private function _0H_r():void{
            var _local1:int = int(this._W_m.@duration);
            var _local2:int = int(this._cO_.@duration);
            var _local3:Number = Number(this._W_m.@range);
            var _local4:Number = Number(this._cO_.@range);
            var _local5:Number = (((0.5 * _local1) * 0.5) * _local3);
            var _local6:Number = (((0.5 * _local2) * 0.5) * _local4);
            var _local7 = (((("Within " + this._W_m.@range) + " sqrs\nHealing for ") + _local1) + " seconds\n");
            _t4 = (_t4 + ("Party Effect: " + _qF_(_local7, _qy((_local5 - _local6)))));
            _5n[this._W_m.toXMLString()] = true;
        }
        private function _C_r():void{
            var _local1:int = int(this._Z_x.@duration);
            var _local2:int = int(this._W_M_.@duration);
            var _local3:Number = Number(this._Z_x.@range);
            var _local4:Number = Number(this._W_M_.@range);
            var _local5:Number = (((0.5 * _local1) * 0.5) * _local3);
            var _local6:Number = (((0.5 * _local2) * 0.5) * _local4);
            var _local7 = (((("Within " + this._Z_x.@range) + " sqrs\nDamaging for ") + _local1) + " seconds\n");
            _t4 = (_t4 + ("Party Effect: " + _qF_(_local7, _qy((_local5 - _local6)))));
            _5n[this._Z_x.toXMLString()] = true;
        }

    }
}//package _05H_

