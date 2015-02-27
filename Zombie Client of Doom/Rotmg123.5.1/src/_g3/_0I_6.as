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

//_g3._0I_6

package _g3 {
import _qj._8y;
import _qj.Description;

public class _0I_6 extends _8y {

    private var _value:Object;

    public function _0I_6(_arg1:Object) {
        this._value = _arg1;
    }

    override public function matches(_arg1:Object):Boolean {
        return (this._W_I_(_arg1, this._value));
    }

    override public function describeTo(_arg1:Description):void {
        _arg1._B_U_(this._value);
    }

    private function _W_I_(_arg1:Object, _arg2:Object):Boolean {
        if (isNaN((_arg1 as Number))) {
            return (isNaN((_arg2 as Number)));
        }
        if (_arg1 == null) {
            return ((_arg2 == null));
        }
        if ((_arg1 is Array)) {
            return ((((_arg2 is Array)) && (this._2C_((_arg1 as Array), (_arg2 as Array)))));
        }
        return ((_arg1 == _arg2));
    }

    private function _2C_(_arg1:Array, _arg2:Array):Boolean {
        return (((this._dk(_arg1, _arg2)) && (this._wB_(_arg1, _arg2))));
    }

    private function _dk(_arg1:Array, _arg2:Array):Boolean {
        return ((_arg1.length == _arg2.length));
    }

    private function _wB_(_arg1:Array, _arg2:Array):Boolean {
        var _local3:int;
        var _local4:int = _arg1.length;
        while (_local3 < _local4) {
            if (!this._W_I_(_arg1[_local3], _arg2[_local3])) {
                return (false);
            }
            _local3++;
        }
        return (true);
    }

}
}//package _g3

