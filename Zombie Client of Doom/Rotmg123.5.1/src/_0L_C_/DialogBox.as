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

//_0L_C_.DialogBox

package _0L_C_{
import AccountManagement.ui.FancyTextButton;

import com.company.util.GraphicHelper;
import com.company.ui.SimpleText;

import flash.display.Shape;
import flash.display.Sprite;
import flash.text.TextFieldAutoSize;
import flash.filters.DropShadowFilter;
import flash.events.MouseEvent;
import flash.events.Event;
import flash.display.Graphics;


    public class DialogBox extends Sprite {

        public static const BUTTON1_EVENT:String = "DIALOG_BUTTON1";
        public static const BUTTON2_EVENT:String = "DIALOG_BUTTON2";
        private static const WIDTH:int = 300;

        protected var _T_y:Shape;
        protected var box_:Sprite;
        protected var rect_:Sprite;
        protected var _p:SimpleText;
        protected var _P_V_:SimpleText = null;
        protected var button1_:FancyTextButton = null;
        protected var button2_:FancyTextButton = null;

        public function DialogBox(bodyText:String, title:String, button1Text:String, button2Text:String){
            this.box_ = new Sprite();
            super();
            this._p = new SimpleText(14, 0xB3B3B3, false, (WIDTH - 40), 0, "Myriad Pro");
            this._p.x = 20;
            this._p.multiline = true;
            this._p.wordWrap = true;
            this._p.htmlText = (('<p align="center">' + bodyText) + "</p>");
            this._p.autoSize = TextFieldAutoSize.CENTER;
            this._p.mouseEnabled = true;
            this._p.updateMetrics();
            this._p.filters = [new DropShadowFilter(0, 0, 0, 1, 6, 6, 1)];
            if (title != null)
            {
                this._P_V_ = new SimpleText(18, 0x000000, false, WIDTH, 0, "Myriad Pro");
                this._P_V_.boldText(true);
                this._P_V_.htmlText = (('<p align="center">' + title) + "</p>");
                this._P_V_.updateMetrics();
            }
            if (button1Text != null)
            {
                this.button1_ = new FancyTextButton(16, button1Text, 120);
                this.button1_.addEventListener(MouseEvent.CLICK, this.onButton1Click);
            }
            if (button2Text != null)
            {
                this.button2_ = new FancyTextButton(16, button2Text, 120);
                this.button2_.addEventListener(MouseEvent.CLICK, this.onButton2Click);
            }
            this.draw();
            addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
        }
        private function draw():void{
            var _local2:int;
            if (this._P_V_ != null)
            {
                this._P_V_.y = 2;
                this.box_.addChild(this._P_V_);
                this._p.y = (this.box_.height + 8);
            } else
            {
                this._p.y = 4;
            }
            this.box_.addChild(this._p);
            if (this.button1_ != null)
            {
                _local2 = (this.box_.height + 16);
                this.box_.addChild(this.button1_);
                this.button1_.y = _local2;
                if (this.button2_ == null)
                {
                    this.button1_.x = ((WIDTH / 2) - (this.button1_.width / 2));
                } else
                {
                    this.button1_.x = ((WIDTH / 4) - (this.button1_.width / 2));
                    this.box_.addChild(this.button2_);
                    this.button2_.x = (((3 * WIDTH) / 4) - (this.button2_.width / 2));
                    this.button2_.y = _local2;
                }
            }
            this.rect_ = new Sprite();
            this.rect_.graphics.beginFill(0x000000, 1.0);
            this.rect_.graphics.drawRect(0, 0, this.box_.width + 10, this.box_.height + 10);
            this.rect_.graphics.endFill();

            if(this._P_V_ != null) {
                this.rect_.graphics.beginFill(0xffffff, 1.0);
                this.rect_.graphics.drawRect(0, 0, this.box_.width + 10, this._P_V_.y + this._P_V_.height + 3);
                this.rect_.graphics.endFill();
            }
            GraphicHelper.createBorder(this.rect_, 1, 0xffffff);

            this.box_.addChildAt(this.rect_, 0);
            this.box_.filters = [new DropShadowFilter(0, 0, 0, 1, 16, 16, 1)];
            addChild(this.box_);
            this._T_y = new Shape();
        }
        private function onAddedToStage(_arg1:Event):void{
            stage;
            this.box_.x = ((800 / 2) - (this.box_.width / 2));
            stage;
            this.box_.y = ((600 / 2) - (this.box_.height / 2));
            var _local2:Graphics = this._T_y.graphics;
            _local2.clear();
            _local2.beginFill(0, 0.8);
            stage;
            stage;
            _local2.drawRect(0, 0, 800, 600);
            _local2.endFill();
            addChildAt(this._T_y, 0);
        }
        private function onRemovedFromStage(_arg1:Event):void{
        }
        private function onButton1Click(_arg1:MouseEvent):void{
            dispatchEvent(new Event(BUTTON1_EVENT));
        }
        private function onButton2Click(_arg1:MouseEvent):void{
            dispatchEvent(new Event(BUTTON2_EVENT));
        }

    }
}//package _0L_C_