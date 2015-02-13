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

//Frames._T_I_

package Frames{
    import flash.display.Sprite;
    import _5H_._xY_;
    import com.company.ui.SimpleText;
    import _5H_._ii;
    import flash.events.MouseEvent;
    import flash.filters.DropShadowFilter;

    public class _T_I_ extends Sprite implements _xY_ {

        public static const HEIGHT:int = 28;

        private var _9g:String;
        private var text:SimpleText;
        private var _E_:_ii;

        public function _T_I_(_arg1:String){
            this._9g = _arg1;
            this._w0();
            this._013();
            addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
            addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
        }
        public function getValue():String{
            return (this._9g);
        }
        private function _w0():void{
            this._E_ = new _ii();
            addChild(this._E_);
        }
        private function _013():void{
            this.text = new SimpleText(18, 0xFFFFFF, false, 0, 0, "Myriad Pro");
            this.text.boldText(true);
            this.text.text = this._9g;
            this.text.updateMetrics();
            this.text.filters = [new DropShadowFilter(0, 0, 0)];
            this.text.x = (HEIGHT + 8);
            addChild(this.text);
        }
        public function setSelected(_arg1:Boolean):void{
            this._E_.setSelected(_arg1);
        }
        private function onMouseOver(_arg1:MouseEvent):void{
            this.text._gp(16768133);
        }
        private function onRollOut(_arg1:MouseEvent):void{
            this.text._gp(0xFFFFFF);
        }

    }
}//package Frames

