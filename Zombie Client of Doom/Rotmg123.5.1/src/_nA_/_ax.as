﻿// Copyright (c) 2015, FireBite/Aceticsoft Studios Inc.
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

//_nA_._ax

package _nA_ {
import flash.display.Sprite;

import _sp.Signal;

import com.company.ui.SimpleText;

import flash.display.Bitmap;

import _S_K_._u3;

import flash.events.MouseEvent;

import com.company.util.AssetLibrary;

import flash.display.BitmapData;

import com.company.assembleegameclient.util.TextureRedrawer;

import flash.filters.DropShadowFilter;

public class _ax extends Sprite {

    private static const _Y_J_:int = 18;

    public var _bF_:Signal;
    private var _056:SimpleText;
    private var _F_c:Bitmap;
    private var _08t:int = -1;
    private var _iY_:Sprite;

    public function _ax() {
        tabChildren = false;
        tabEnabled = false;
        this._08o();
        this._bF_ = new _u3(this._iY_, MouseEvent.CLICK);
    }

    public function _zP_(_arg1:int):void {
        if (this._08t != _arg1) {
            this._08t = _arg1;
            this._jk();
        }
    }

    public function destroy():void {
        parent.removeChild(this);
    }

    private function _08o():void {
        this._N_B_();
        this._07g();
        this._zP_(0);
        this._08N_();
    }

    private function _N_B_():void {
        var _local1:BitmapData = AssetLibrary._xK_("redLootBag", 0);
        _local1 = TextureRedrawer.redraw(_local1, 40, true, 0, 0);
        this._F_c = new Bitmap(_local1);
        this._F_c.x = -(this._F_c.width);
        addChild(this._F_c);
    }

    private function _07g():void {
        this._056 = new SimpleText(_Y_J_, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this._056.filters = [new DropShadowFilter(0, 0, 0, 1, 4, 4, 2)];
        this._jk();
        addChild(this._056);
    }

    private function _jk():void {
        this._056.text = ((this._08t.toString() + " day") + (((this._08t) > 1) ? "s" : ""));
        this._056.x = (this._F_c.x + 30);
        this._056.y = (((this._F_c.height / 2) - (this._F_c.height / 2)) + 5);
    }

    private function _08N_():void {
        this._iY_ = new Sprite();
        this._iY_.graphics.beginFill(0xFF0000, 0);
        this._iY_.graphics.drawRect(0, 0, 55, 18);
        this._iY_.graphics.endFill();
        this._iY_.buttonMode = true;
        this._iY_.x = (this._iY_.x - 15);
        this._iY_.y = (this._iY_.y + 10);
        addChild(this._iY_);
    }

}
}//package _nA_

