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

//_zm._fp

package _zm{
    import flash.display.Sprite;
    import com.company.ui.SimpleText;
    import flash.filters.DropShadowFilter;
    import flash.events.MouseEvent;

    public class _fp extends Sprite {

        public var w_:int;
        public var h_:int;
        private var nameText_:SimpleText;

        public function _fp(_arg1:String, _arg2:int, _arg3:int){
            this.w_ = _arg2;
            this.h_ = _arg3;
            this.nameText_ = new SimpleText(16, 0xB3B3B3, false, 0, 0, "Myriad Pro");
            this.nameText_.boldText(true);
            this.nameText_.text = _arg1;
            this.nameText_.updateMetrics();
            this.nameText_.filters = [new DropShadowFilter(0, 0, 0)];
            this.nameText_.x = ((this.w_ / 2) - (this.nameText_.width / 2));
            this.nameText_.y = ((this.h_ / 2) - (this.nameText_.height / 2));
            addChild(this.nameText_);
            this._rC_(0x363636);
            addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
            addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
        }
        public function getValue():String{
            return (this.nameText_.text);
        }
        private function onMouseOver(_arg1:MouseEvent):void{
            this._rC_(0x565656);
        }
        private function onMouseOut(_arg1:MouseEvent):void{
            this._rC_(0x363636);
        }
        private function _rC_(_arg1:uint):void{
            graphics.clear();
            graphics.lineStyle(1, 0xB3B3B3);
            graphics.beginFill(_arg1, 1);
            graphics.drawRect(0, 0, this.w_, this.h_);
            graphics.endFill();
            graphics.lineStyle();
        }

    }
}//package _zm

