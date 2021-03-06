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

//OptionsStuff._0_i

package OptionsStuff {
import flash.display.Sprite;

import ToolTips.ToolTip;

import com.company.ui.SimpleText;

import flash.filters.DropShadowFilter;
import flash.events.MouseEvent;
import flash.events.Event;

import ToolTips._aS_;

public class _0_i extends Sprite {

    private static var _fO_:ToolTip;

    public var _W_Y_:String;
    public var _Z_E_:String;
    private var _00R_:SimpleText;

    public function _0_i(_arg1:String, _arg2:String, _arg3:String) {
        this._W_Y_ = _arg1;
        this._Z_E_ = _arg3;
        this._00R_ = new SimpleText(18, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this._00R_.text = _arg2;
        this._00R_.filters = [new DropShadowFilter(0, 0, 0, 1, 4, 4, 2)];
        this._00R_.updateMetrics();
        this._00R_.x = (_N_9.WIDTH + 24);
        this._00R_.y = (((_N_9.HEIGHT / 2) - (this._00R_.height / 2)) - 2);
        this._00R_.mouseEnabled = true;
        this._00R_.addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        this._00R_.addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
        addChild(this._00R_);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }

    public function refresh():void {
    }

    private function onMouseOver(_arg1:MouseEvent):void {
        _fO_ = new _aS_(0x310800, 0x828282, null, this._Z_E_, 150);
        stage.addChild(_fO_);
    }

    private function onRollOut(_arg1:MouseEvent):void {
        this.removeToolTip();
    }

    private function onRemovedFromStage(_arg1:Event):void {
        this.removeToolTip();
    }

    private function removeToolTip():void {
        if (((!((_fO_ == null))) && (stage.contains(_fO_)))) {
            stage.removeChild(_fO_);
            _fO_ = null;
        }
    }

}
}//package OptionsStuff

