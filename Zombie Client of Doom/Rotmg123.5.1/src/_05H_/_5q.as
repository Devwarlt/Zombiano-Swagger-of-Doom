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

//_05H_._5q

package _05H_ {
public class _5q extends _U_y {

    private var _S_y:XMLList;
    private var _1Q_:XMLList;

    override protected function compareSlots(itemXML:XML, curItemXML:XML):void {
        var duration:Number;
        var otherDuration:Number;
        this._S_y = itemXML.Activate.(text() == "Decoy");
        this._1Q_ = curItemXML.Activate.(text() == "Decoy");
        _t4 = "";
        if ((((this._S_y.length() == 1)) && ((this._1Q_.length() == 1)))) {
            duration = Number(this._S_y[0].@duration);
            otherDuration = Number(this._1Q_[0].@duration);
            _t4 = (_t4 + ("Decoy: " + _qF_((duration.toString() + " secs\n"), _qy((duration - otherDuration)))));
            _5n[this._S_y[0].toXMLString()] = true;
        }
    }

}
}//package _05H_

