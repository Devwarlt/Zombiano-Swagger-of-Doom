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

//com.company.assembleegameclient.ui._00A_

package com.company.assembleegameclient.ui{
    import flash.display.Sprite;
    import com.company.ui.SimpleText;
    import flash.events.MouseEvent;

    public class _00A_ extends Sprite {

        public var label_:String;
        private var over_:Boolean = false;
        private var _fc:Boolean = false;
        private var selected_:Boolean = false;
        private var text_:SimpleText;

        public function _00A_(_arg1:String){
            this.label_ = _arg1;
            this.text_ = new SimpleText(20, 0xFFFFFF, false, 0, 0, "Myriad Pro");
            this.text_.boldText(true);
            this.text_.text = _arg1;
            this.text_.updateMetrics();
            this.text_.x = 2;
            addChild(this.text_);
            this.redraw();
            addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
            addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
            addEventListener(MouseEvent.MOUSE_DOWN, this.onMouseDown);
            addEventListener(MouseEvent.MOUSE_UP, this._0_5);
        }
        public function setSelected(_arg1:Boolean):void{
            this.selected_ = _arg1;
            this.redraw();
        }
        private function redraw():void{
            if (this.over_)
            {
                this.text_._gp(16567065);
            } else
            {
                if (((this.selected_) || (this._fc)))
                {
                    this.text_._gp(0xFFFFFF);
                } else
                {
                    this.text_._gp(0xB2B2B2);
                }
            }
        }
        private function onMouseOver(_arg1:MouseEvent):void{
            this.over_ = true;
            this.redraw();
        }
        private function onMouseOut(_arg1:MouseEvent):void{
            this.over_ = false;
            this._fc = false;
            this.redraw();
        }
        private function onMouseDown(_arg1:MouseEvent):void{
            this._fc = true;
            this.redraw();
        }
        private function _0_5(_arg1:MouseEvent):void{
            this._fc = false;
            this.redraw();
        }

    }
}//package com.company.assembleegameclient.ui

