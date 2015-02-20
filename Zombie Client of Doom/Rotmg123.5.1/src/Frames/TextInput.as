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

/**
 * Created by Fabian on 20.02.2015.
 */
package Frames {
import Abstract.AbstractManager;

import com.company.ui.SimpleText;

import flash.display.CapsStyle;
import flash.display.JointStyle;
import flash.display.LineScaleMode;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.FocusEvent;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;

public class TextInput extends Sprite {

    private static const BIG_HEIGHT:int = 88;
    private static const SMALL_HEIGHT:int = BIG_HEIGHT - 30;

    public var nameText_:SimpleText;
    public var inputText_:SimpleText;
    public var errorText_:SimpleText;

    private var w_:Number;
    private var over:Boolean;
    private var focused:Boolean;

    public function TextInput(description:String, displayAsPassword:Boolean, errorText:String) {
        AbstractManager.getConfig(TextInput).throwOnPureCall(this);

        this.w_ = 238;

        this.nameText_ = new SimpleText(18, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this.nameText_.text = description;
        this.nameText_.updateMetrics();
        this.nameText_.filters = [new DropShadowFilter(0, 0, 0)];
        addChild(this.nameText_);
        this.inputText_ = new SimpleText(20, 0xffffff, true, this.w_, 30, "Myriad Pro");
        this.inputText_.boldText(true);
        this.inputText_.border = false;
        this.inputText_.displayAsPassword = displayAsPassword;
        this.inputText_.updateMetrics();
        this.inputText_.addEventListener(MouseEvent.ROLL_OVER, this.onRollOver);
        this.inputText_.addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
        this.inputText_.addEventListener(FocusEvent.FOCUS_IN, this.onFocusIn);
        this.inputText_.addEventListener(FocusEvent.FOCUS_OUT, this.onFocusOut);
        addChild(this.inputText_);
        this.inputText_.addEventListener(Event.CHANGE, this.onChange);
        this.errorText_ = new SimpleText(12, 16549442, false, 0, 0, "Myriad Pro");
        this.errorText_.y = (this.inputText_.y + 32);
        this.errorText_.text = errorText;
        this.errorText_.updateMetrics();
        this.errorText_.filters = [new DropShadowFilter(0, 0, 0)];
        addChild(this.errorText_);
    }

    public function get HEIGHT():int {
        return this is TextInputBig ? BIG_HEIGHT : SMALL_HEIGHT;
    }

    public function text():String {
        return (this.inputText_.text);
    }

    public function setErrorText(_arg1:String):void {
        this.errorText_.text = _arg1;
        this.errorText_.updateMetrics();
    }

    public function setWidth(val:Number):void {
        this.w_ = val;
        this.draw();
    }

    protected function onChange(_arg1:Event):void {
        this.setErrorText("");
    }

    protected function draw():void {
        this.inputText_.definedWidth = this.w_;
        this.inputText_.updateMetrics();
        graphics.clear();
        graphics.lineStyle(1, this.over || this.focused ? 0xffffff : 0x9C9C9C, 1, false, LineScaleMode.NORMAL, CapsStyle.ROUND, JointStyle.ROUND);
        graphics.beginFill(0x000000, 1);
        graphics.drawRect(0, this.inputText_.y, this.w_, 30);
        graphics.endFill();
        graphics.lineStyle();
    }

    protected function onRollOver(event:MouseEvent):void {
        this.over = true;
        draw();
    }

    protected function onRollOut(event:MouseEvent):void {
        this.over = false;
        draw();
    }

    private function onFocusIn(event:FocusEvent):void {
        this.focused = true;
        draw();
    }

    private function onFocusOut(event:FocusEvent):void {
        this.focused = false;
        draw();
    }
}
}
