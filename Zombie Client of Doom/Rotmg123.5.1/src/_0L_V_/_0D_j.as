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

//_0L_V_._0D_j

package _0L_V_ {
import flash.display.Sprite;

import _sp._aJ_;

import _0I_J_._0J_v;

import flash.events.MouseEvent;

import _S_K_._u3;

public class _0D_j extends Sprite {

    public static var _1J_:Class = _R_u;

    public var close:_aJ_;
    public var select:_0J_v;

    public function _0D_j() {
        this.close = new _aJ_();
        this.select = new _0J_v(MouseEvent.CLICK, String);
        this._044();
        this._Q_G_();
        this._T_b();
    }

    private function _044():void {
        addChild(new _1J_());
    }

    private function _Q_G_():void {
        var _local1:Sprite = this._mX_(550, 30, 30, 30);
        this.close = new _u3(_local1, MouseEvent.CLICK);
    }

    private function _T_b():void {
        var _local1:Sprite = this._mX_(220, 180, 180, 35);
        //var _local2:Sprite = this._mX_(220, 224, 180, 35);
        //var _local3:Sprite = this._mX_(220, 268, 180, 35);
        this.select.map(_local1, "PayPal");
        //this.select.map(_local2, "Credit Cards, etc.");
        //this.select.map(_local3, "Google Checkout");
    }

    private function _mX_(_arg1:int, _arg2:int, _arg3:int, _arg4:int):Sprite {
        var _local5:_A_V_ = new _A_V_(_arg1, _arg2, _arg3, _arg4);
        addChild(_local5);
        return (_local5);
    }

}
}//package _0L_V_

