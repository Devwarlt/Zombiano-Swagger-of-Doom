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

//Frames._O_I_

package Frames{
import flash.display.Sprite;
import com.company.ui.SimpleText;
import flash.filters.DropShadowFilter;
import flash.display.LineScaleMode;
import flash.display.CapsStyle;
import flash.display.JointStyle;
import flash.events.Event;

public class TextInput extends Sprite {

    public static const HEIGHT:int = 88;

    public var nameText_:SimpleText;
    public var inputText_:SimpleText;
    public var errorText_:SimpleText;

    private var w_:Number;

    public function TextInput(_arg1:String, _arg2:Boolean, _arg3:String) {
        this.w_ = 238;
        this.nameText_ = new SimpleText(18, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this.nameText_.boldText(true);
        this.nameText_.text = _arg1;
        this.nameText_.updateMetrics();
        this.nameText_.filters = [new DropShadowFilter(0, 0, 0)];
        addChild(this.nameText_);
        this.inputText_ = new SimpleText(20, 0xB3B3B3, true, this.w_, 30, "Myriad Pro");
        this.inputText_.y = 30;
        this.inputText_.x = 6;
        this.inputText_.border = false;
        this.inputText_.displayAsPassword = _arg2;
        this.inputText_.updateMetrics();
        addChild(this.inputText_);
        this.inputText_.addEventListener(Event.CHANGE, this._02L_);
        this.errorText_ = new SimpleText(12, 16549442, false, 0, 0, "Myriad Pro");
        this.errorText_.y = (this.inputText_.y + 32);
        this.errorText_.text = _arg3;
        this.errorText_.updateMetrics();
        this.errorText_.filters = [new DropShadowFilter(0, 0, 0)];
        addChild(this.errorText_);
        draw();
    }
    public function text():String{
        return (this.inputText_.text);
    }
    public function setErrorText(_arg1:String):void{
        this.errorText_.text = _arg1;
        this.errorText_.updateMetrics();
    }
    public function _02L_(_arg1:Event):void{
        this.setErrorText("");
    }
    public function setWidth(val:Number):void {
        this.w_ = val;
        this.draw();
    }

    private function draw():void {
        this.inputText_.definedWidth = this.w_;
        this.inputText_.updateMetrics();
        graphics.clear();
        graphics.lineStyle(2, 0xffffff, 1, false, LineScaleMode.NORMAL, CapsStyle.ROUND, JointStyle.ROUND);
        graphics.beginFill(0x383838, 1);
        graphics.drawRect(0, this.inputText_.y, this.w_, 30);
        graphics.endFill();
        graphics.lineStyle();
    }

}
}//package Frames