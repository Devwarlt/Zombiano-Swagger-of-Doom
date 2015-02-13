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

//_0G_l._0G_s

package _0G_l{
    import flash.display.Sprite;
    import com.company.ui.SimpleText;
    import flash.display.LineScaleMode;
    import flash.display.CapsStyle;
    import flash.display.JointStyle;
    import flash.events.FocusEvent;
    import flash.filters.DropShadowFilter;

    public class _0G_s extends Sprite {

        public static const WIDTH:int = 200;
        public static const HEIGHT:int = 30;

        public var inputText_:SimpleText;
        public var _tr:SimpleText;

        public function _0G_s(){
            this.inputText_ = new SimpleText(16, 0xB3B3B3, true, WIDTH, 30, "Myriad Pro");
            this.inputText_.border = false;
            this.inputText_.maxChars = 0x0100;
            this.inputText_.restrict = "a-z0-9 ,";
            this.inputText_.updateMetrics();
            this.inputText_.x = 2;
            addChild(this.inputText_);
            graphics.lineStyle(2, 0x454545, 1, false, LineScaleMode.NORMAL, CapsStyle.ROUND, JointStyle.ROUND);
            graphics.beginFill(0x333333, 1);
            graphics.drawRect(0, -2, WIDTH, 30);
            graphics.endFill();
            graphics.lineStyle();
            this.inputText_.addEventListener(FocusEvent.FOCUS_IN, this._0_L_);
            this.inputText_.addEventListener(FocusEvent.FOCUS_OUT, this._I_W_);
            this._tr = new SimpleText(14, 0x939393, false, 200, 30, "Myriad Pro");
            this._tr.htmlText = '<p align="center">tags (comma-separated)</p>';
            this._tr.updateMetrics();
            this._tr.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8, 1)];
            this._tr.y = (((HEIGHT / 2) - (this._tr.height / 2)) + 2);
            addChild(this._tr);
        }
        public function _03h():String{
            return (this.inputText_.text);
        }
        private function _0_L_(_arg1:FocusEvent):void{
            if (contains(this._tr))
            {
                removeChild(this._tr);
            }
        }
        private function _I_W_(_arg1:FocusEvent):void{
            if (((!(contains(this._tr))) && ((this.inputText_.text == ""))))
            {
                addChild(this._tr);
            }
        }

    }
}//package _0G_l

