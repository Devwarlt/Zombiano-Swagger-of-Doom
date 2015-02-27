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

//com.company.assembleegameclient.ui._jM_

package com.company.assembleegameclient.ui {
import flash.display.Sprite;

import com.company.ui.SimpleText;

import flash.filters.DropShadowFilter;
import flash.events.MouseEvent;

import Sounds.UrlSoundEffects;

public class TextButton extends Sprite {

    public var text_:SimpleText;
    public var _c9:int;
    public var _I_x:int;
    public var _S_4:uint = 0xFFFFFF;

    public function TextButton(fontSize:int, boldText:Boolean, text:String) {
        this.text_ = new SimpleText(fontSize, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this.text_.boldText(boldText);
        this.text_.text = text;
        this.text_.updateMetrics();
        addChild(this.text_);
        this.text_.filters = [new DropShadowFilter(0, 0, 0)];
        addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
        addEventListener(MouseEvent.CLICK, this.onClick);
    }

    public function clickAble(_arg1:Boolean):void {
        if (_arg1 == this.mouseEnabled) {
            return;
        }
        this.setIdleColor(_arg1 ? 0xFFFFFF : 0x696969);
        this.mouseEnabled = _arg1;
    }

    public function updateText(_arg1:String):void {
        this.text_.text = _arg1;
        this.text_.updateMetrics();
        this.setIdleColor(0xB3B3B3);
        mouseEnabled = false;
        mouseChildren = false;
    }

    public function setTextColor(_arg1:uint):void {
        this.text_.setColor(_arg1);
    }

    public function setIdleColor(_arg1:uint):void {
        this._S_4 = _arg1;
        this.setTextColor(this._S_4);
    }

    private function onMouseOver(_arg1:MouseEvent):void {
        this.setTextColor(16768133);
    }

    private function onMouseOut(_arg1:MouseEvent):void {
        this.setTextColor(this._S_4);
    }

    private function onClick(_arg1:MouseEvent):void {
        UrlSoundEffects.play("button_click");
    }

}
}//package com.company.assembleegameclient.ui

