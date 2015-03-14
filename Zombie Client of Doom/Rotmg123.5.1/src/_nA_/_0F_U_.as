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

//_nA_._0F_U_

package _nA_ {
import flash.display.Sprite;

import _sp.Signal;

import _0L_V_._0B_3;
import _0L_V_._kD_;
import _0L_V_._0D_j;

public class _0F_U_ extends Sprite {

    public var buy:Signal;
    public var _hz:Signal;
    private var _T_S_:Sprite;

    public function _0F_U_() {
        this.buy = new Signal();
        this._hz = new Signal(String);
        tabChildren = false;
        tabEnabled = false;
        addChild(new _O_g());
    }

    public function _B_(_arg1:int):void {
        var _local2:_0B_3;
        _local2 = new _0B_3();
        _local2._sj(_arg1);
        _local2.close.addOnce(this.destroy);
        _local2.buy.addOnce(this._zN_);
        this._tM_(_local2);
    }

    public function _U_B_():void {
        var _local1:_kD_;
        _local1 = new _kD_();
        _local1.close.addOnce(this.destroy);
        this._tM_(_local1);
    }

    public function _M_F_():void {
        var _local1:_0D_j = new _0D_j();
        _local1.close.addOnce(this.destroy);
        _local1.select.addOnce(this._D_K_);
        this._tM_(_local1);
        _local1.y = (_local1.y - 5);
    }

    private function _D_K_(_arg1:String):void {
        this._hz.dispatch(_arg1);
    }

    private function _tM_(_arg1:Sprite):void {
        this._0J_K_();
        this._T_S_ = _arg1;
        stage;
        _arg1.x = (((800 / 2) - (_arg1.width / 2)) - 15);
        stage;
        _arg1.y = (((600 / 2) - (_arg1.height / 2)) - 15);
        addChild(_arg1);
    }

    private function _0J_K_():void {
        if (this._T_S_ != null) {
            removeChild(this._T_S_);
        }
        this._T_S_ = null;
    }

    public function _zN_():void {
        this.buy.dispatch();
    }

    public function destroy():void {
        parent.removeChild(this);
    }

}
}//package _nA_

