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

//_05H_._F_o

package _05H_ {
public class _F_o extends _U_y {

    private var _7_:_09A_;
    private var condition:XMLList;
    private var _0r:XMLList;

    public function _F_o() {
        this._7_ = new _09A_();
    }

    override protected function compareSlots(itemXML:XML, curItemXML:XML):void {
        var tagStr:String;
        var duration:Number;
        var conditionName:String;
        var compositeStr:String;
        var htmlStr:String;
        this.condition = itemXML.Projectile.ConditionEffect.(((((text() == "Slowed")) || ((text() == "Paralyzed")))) || ((text() == "Dazed")));
        this._0r = curItemXML.Projectile.ConditionEffect.(((((text() == "Slowed")) || ((text() == "Paralyzed")))) || ((text() == "Dazed")));
        this._7_._N_Q_(itemXML, curItemXML);
        _t4 = this._7_._t4;
        for (tagStr in this._7_._5n) {
            _5n[tagStr] = true;
        }
        if ((((this.condition.length() == 1)) && ((this._0r.length() == 1)))) {
            duration = Number(this.condition[0].@duration);
            conditionName = this.condition.text();
            compositeStr = ((((" " + conditionName) + " for ") + duration) + " secs\n");
            htmlStr = ("Shot Effect:\n" + _qF_(compositeStr, _iF_));
            _t4 = (_t4 + htmlStr);
            _5n[this.condition[0].toXMLString()] = htmlStr;
        }
    }

}
}//package _05H_

