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

//_05H_._zr

package _05H_ {
public class _zr extends _U_y {

    private var _7_:_09A_;

    public function _zr() {
        this._7_ = new _09A_();
    }

    override protected function compareSlots(_arg1:XML, _arg2:XML):void {
        var _local3:String;
        this._7_._N_Q_(_arg1, _arg2);
        _t4 = this._7_._t4;
        for (_local3 in this._7_._5n) {
            _5n[_local3] = this._7_._5n[_local3];
        }
        this._04S_(_arg1);
    }

    private function _04S_(itemXML:XML):void {
        var tag:XML;
        var str:String;
        if (itemXML.@id == "Shield of Ogmur") {
            tag = itemXML.ConditionEffect.(text() == "Armor Broken")[0];
            str = (("Armor Broken for " + tag.@duration) + " secs\n");
            str = ("Party Effect: " + _qF_(str, _0C_1));
            _t4 = (_t4 + str);
            _5n[tag.toXMLString()] = str;
        }
    }

}
}//package _05H_

