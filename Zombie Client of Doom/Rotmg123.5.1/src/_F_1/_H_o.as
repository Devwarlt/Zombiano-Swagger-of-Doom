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

//_F_1._H_o

package _F_1 {
import flash.display.Sprite;
import flash.geom.ColorTransform;

import com.company.ui.SimpleText;

import flash.filters.DropShadowFilter;
import flash.events.MouseEvent;
import flash.events.Event;
import flash.utils.getTimer;

import com.company.util.MoreColorUtil;

import Sounds.UrlSoundEffects;

public class _H_o extends Sprite {

    protected static const _0A_8:ColorTransform = new ColorTransform(1, (220 / 0xFF), (133 / 0xFF));

    protected var _4p:ColorTransform = null;
    protected var text_:SimpleText;
    protected var _U_r:Boolean;
    private var _0H_X_:Number;
    private var _N_a:Number;

    public function _H_o(_arg1:String, _arg2:int, _arg3:Boolean, lowercase:Boolean = true) {
        name = _arg1;
        this.text_ = new SimpleText(_arg2, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this.text_.boldText(true);
        this.text_.text = lowercase ? _arg1.toLowerCase() : _arg1;
        this.text_.updateMetrics();
        this.text_.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
        addChild(this.text_);
        this._U_r = _arg3;
        this._0H_X_ = width;
        this._N_a = height;
        addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
        addEventListener(MouseEvent.CLICK, this._09t);
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }

    private function onAddedToStage(_arg1:Event):void {
        if (this._U_r) {
            addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        }
    }

    private function onRemovedFromStage(_arg1:Event):void {
        if (this._U_r) {
            removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        }
    }

    private function onEnterFrame(_arg1:Event):void {
        var _local2:Number = (1.05 + (0.05 * Math.sin((getTimer() / 200))));
        this.text_.scaleX = _local2;
        this.text_.scaleY = _local2;
        this.text_.x = ((this._0H_X_ / 2) - (this.text_.width / 2));
        this.text_.y = ((this._N_a / 2) - (this.text_.height / 2));
    }

    public function _037(_arg1:ColorTransform):void {
        if (_arg1 == this._4p) {
            return;
        }
        this._4p = _arg1;
        if (this._4p == null) {
            this.text_.transform.colorTransform = MoreColorUtil.identity;
        } else {
            this.text_.transform.colorTransform = this._4p;
        }
    }

    protected function onMouseOver(_arg1:MouseEvent):void {
        this._037(_0A_8);
    }

    protected function onMouseOut(_arg1:MouseEvent):void {
        this._037(null);
    }

    protected function _09t(_arg1:MouseEvent):void {
        UrlSoundEffects.play("button_click");
    }

}
}//package _F_1

