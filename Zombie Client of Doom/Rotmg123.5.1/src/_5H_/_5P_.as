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

//_5H_._5P_

package _5H_ {


public class _5P_ {

    private var _05t:Vector.<_xY_>;
    private var selected:_xY_;

    public function _5P_(_arg1:Vector.<_xY_>) {
        this._05t = _arg1;
    }

    public function setSelected(_arg1:String):void {
        var _local2:_xY_;
        for each (_local2 in this._05t) {
            if (_local2.getValue() == _arg1) {
                this._0H_V_(_local2);
                return;
            }
        }
    }

    public function _rq():_xY_ {
        return (this.selected);
    }

    private function _0H_V_(_arg1:_xY_):void {
        if (this.selected != null) {
            this.selected.setSelected(false);
        }
        this.selected = _arg1;
        this.selected.setSelected(true);
    }

}
}//package _5H_

