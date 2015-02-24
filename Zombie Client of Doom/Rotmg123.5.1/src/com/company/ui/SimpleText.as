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

//com.company.ui.SimpleText

package com.company.ui{
import com.company.ui.fonts.*;

    import flash.text.Font;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.text.TextFieldType;
    import flash.events.Event;
    import flash.text.TextLineMetrics;

    public class SimpleText extends TextField {

        private var font:Font;

        public var definedWidth:int;
        public var definedHeight:int;
        public var _c9:int;
        public var _I_x:int;

        public function SimpleText(size:int, color:uint, editable:Boolean=false, definedWidth:int=0, definedHeight:int=0, fontStyle:String="Myriad Pro"){
            this.definedWidth = definedWidth;
            if (this.definedWidth != 0)
            {
                width = definedWidth;
            }
            this.definedHeight = definedHeight;
            if (this.definedHeight != 0)
            {
                height = definedHeight;
            }
            switch (fontStyle) {
                case 'Myriad Pro':
                    font = new MyriadPro();
                    break;
                case 'Myriad Pro Bold':
                    font = new MyriadProBold();
                    break;
                case 'Myriad Pro CFF':
                    font = new MyriadProCFF();
                    break;
                case 'Myriad Pro Bold CFF':
                    font = new MyriadProBoldCFF();
                    break;
                case 'CHIP SB':
                    font = new BewareoftheHogs();
                    break;
                case 'CHIP SBKI':
                    font = new CHIPSBKI();
                    break;
                default:
                    font = new MyriadPro();
                    break;
            }
            var _local7:TextFormat = new TextFormat();
            _local7.kerning = true;
            if (!(fontStyle == null) && !(fontStyle == ""))
            {
                embedFonts = true; // CHANGED - was true, changed to false so that text shows (there is a problem with embeded fonts)
                _local7.font = font.fontName;
            }
            _local7.size = size;
            _local7.color = color;
            defaultTextFormat = _local7;
            if (editable)
            {
                selectable = true;
                mouseEnabled = true;
                type = TextFieldType.INPUT;
                border = true;
                borderColor = color;
                addEventListener(Event.CHANGE, this._bR_);
            } else
            {
                selectable = false;
                mouseEnabled = false;
            }
        }
        public function set size(newsize:int) {
            var _local3:TextFormat = defaultTextFormat;
            _local3.size = newsize;
            setTextFormat(_local3);
            defaultTextFormat = _local3;
        }
        public function get size():int {
            return int(defaultTextFormat.size);
        }
        public function _du(_arg1:int, _arg2:uint):void{
            var _local3:TextFormat = defaultTextFormat;
            _local3.size = _arg1;
            _local3.color = _arg2;
            setTextFormat(_local3);
            defaultTextFormat = _local3;
        }
        public function _gp(_arg1:uint):void{
            var _local2:TextFormat = defaultTextFormat;
            _local2.color = _arg1;
            setTextFormat(_local2);
            defaultTextFormat = _local2;
        }
        public function boldText(_arg1:Boolean):void{
            var _local2:TextFormat = defaultTextFormat;
            _local2.bold = _arg1;
            setTextFormat(_local2);
            defaultTextFormat = _local2;
        }
        private function _bR_(_arg1:Event):void{
            this.updateMetrics();
        }
        public function updateMetrics():void{
            var _local2:TextLineMetrics;
            var _local3:int;
            var _local4:int;
            this._c9 = 0;
            this._I_x = 0;
            var _local1:int;
            while (_local1 < numLines)
            {
                _local2 = getLineMetrics(_local1);
                _local3 = (_local2.width + 4);
                _local4 = (_local2.height + 4);
                if (_local3 > this._c9)
                {
                    this._c9 = _local3;
                }
                this._I_x = (this._I_x + _local4);
                _local1++;
            }
            width = (((this.definedWidth)==0) ? this._c9 : this.definedWidth);
            height = (((this.definedHeight)==0) ? this._I_x : this.definedHeight);
        }
        public function _08S_():void{
            width = (((this.definedWidth)==0) ? (textWidth + 4) : this.definedWidth);
            height = (((this.definedHeight)==0) ? (textHeight + 4) : this.definedHeight);
        }

    }
}//package com.company.ui

