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

//_05H_._A_Y_

package _05H_ {
public class _A_Y_ extends _U_y {

    override protected function compareSlots(itemXML:XML, curItemXML:XML):void {
        var nova:XMLList;
        var otherNova:XMLList;
        var tag:XML;
        var range:int;
        var otherRange:int;
        var amount:int;
        var otherAmount:int;
        var wavg:Number;
        var otherWavg:Number;
        var effectText:String;
        nova = itemXML.Activate.(text() == "HealNova");
        otherNova = curItemXML.Activate.(text() == "HealNova");
        _t4 = "";
        if ((((nova.length() == 1)) && ((otherNova.length() == 1)))) {
            range = int(itemXML.Activate.@range);
            otherRange = int(curItemXML.Activate.@range);
            amount = int(itemXML.Activate.@amount);
            otherAmount = int(curItemXML.Activate.@amount);
            wavg = ((0.5 * range) + (0.5 * amount));
            otherWavg = ((0.5 * otherRange) + (0.5 * otherAmount));
            if (itemXML.@id == "Tome of Purification") {
                range = 6;
            }
            effectText = (((amount + " HP within ") + range) + " sqrs\n");
            _t4 = (_t4 + ("Party Heal: " + _qF_(effectText, _qy((wavg - otherWavg)))));
            _5n[nova.toXMLString()] = true;
        }
        if (itemXML.@id == "Tome of Purification") {
            tag = itemXML.Activate.(text() == "RemoveNegativeConditions")[0];
            _t4 = (_t4 + _qF_("Removes negative conditions\n", _0C_1));
            _5n[tag.toXMLString()] = true;
        } else {
            if (itemXML.@id == "Tome of Holy Protection") {
                tag = itemXML.Activate.(text() == "ConditionEffectSelf")[0];
                _t4 = (_t4 + ("Effect on Self:\n" + _qF_((("Armored for " + tag.@duration) + " secs\n"), _0C_1)));
                _5n[tag.toXMLString()] = true;
            }
        }
    }

}
}//package _05H_

