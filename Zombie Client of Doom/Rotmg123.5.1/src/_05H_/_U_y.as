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

//_05H_._U_y

package _05H_ {
import flash.utils.Dictionary;

public class _U_y {

    internal static const _rJ_:String = "#00ff00";
    internal static const _at:String = "#ff0000";
    internal static const _iF_:String = "#FFFF8F";
    internal static const _u8:String = "#B3B3B3";
    internal static const _0C_1:String = "#8a2be2";

    public var _5n:Dictionary;
    public var _P_3:Dictionary;
    public var _t4:String;

    public function _N_Q_(_arg1:XML, _arg2:XML):void {
        this._09d();
        this.compareSlots(_arg1, _arg2);
    }

    protected function compareSlots(_arg1:XML, _arg2:XML):void {
    }

    private function _09d():void {
        this._5n = new Dictionary();
        this._P_3 = new Dictionary();
    }

    protected function _qy(_arg1:Number):String {
        if (_arg1 < 0) {
            return (_at);
        }
        if (_arg1 > 0) {
            return (_rJ_);
        }
        return (_iF_);
    }

    protected function _qF_(_arg1:String, _arg2:String = "#FFFF8F"):String {
        return ('<font color="' + _arg2 + '">' + _arg1 + "</font>");
    }

    protected function _X_C_(_arg1:String):String {
        return (this._qF_("MP Cost: ", _u8) + this._qF_(_arg1, _iF_) + "\n");
    }

}
}//package _05H_

