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

//_05H_._L_m

package _05H_{
    public class _L_m extends _U_y {

        override protected function compareSlots(_arg1:XML, _arg2:XML):void{
            var _local3:XML;
            var _local4:XML;
            var _local5:Number;
            var _local6:Number;
            _local3 = this._06O_(_arg1);
            _local4 = this._06O_(_arg2);
            _t4 = "";
            if (((!((_local3 == null))) && (!((_local4 == null)))))
            {
                _local5 = Number(_local3.@duration);
                _local6 = Number(_local4.@duration);
                _t4 = (_t4 + this._it(_local5, _local6));
                _5n[_local3.toXMLString()] = true;
            }
            this._O_J_(_arg1);
        }
        private function _O_J_(itemXML:XML):void{
            var teleportTag:XML;
            if (itemXML.@id == "Cloak of the Planewalker")
            {
                _t4 = (_t4 + _qF_("RequestTeleport to Target\n", _0C_1));
                teleportTag = XML(itemXML.Activate.(text() == "RequestTeleport"))[0];
                _5n[teleportTag.toXMLString()] = true;
            }
        }
        private function _06O_(xml:XML):XML{
            var matches:XMLList;
            var conditionTag:XML;
            matches = xml.Activate.(text() == "ConditionEffectSelf");
            for each (conditionTag in matches)
            {
                if (conditionTag.(@effect == "Invisible"))
                {
                    return (conditionTag);
                }
            }
            return (null);
        }
        private function _it(_arg1:Number, _arg2:Number):String{
            var _local3 = "";
            var _local4:String = _qy((_arg1 - _arg2));
            _local3 = "Effect on Self:\n";
            return ((_local3 + _qF_((("Invisible for " + _arg1) + " secs\n"), _local4)));
        }

    }
}//package _05H_

