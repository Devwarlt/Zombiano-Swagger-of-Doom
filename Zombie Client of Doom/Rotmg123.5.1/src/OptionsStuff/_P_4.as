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

//OptionsStuff._P_4

package OptionsStuff{
    import flash.display.Sprite;
    import com.company.ui.SimpleText;
    import flash.filters.DropShadowFilter;
    import flash.events.MouseEvent;

    public class _P_4 extends Sprite {

        private static const _H_5:int = 16;

        public var text_:String;
        protected var _p:SimpleText;
        protected var selected_:Boolean;

        public function _P_4(_arg1:String){
            this.text_ = _arg1;
            this._p = new SimpleText(_H_5, 0xB3B3B3, false, 0, 0, "Myriad Pro");
            this._p.boldText(true);
            this._p.text = this.text_;
            this._p.updateMetrics();
            this._p.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
            addChild(this._p);
            this.selected_ = false;
            addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
            addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
        }
        public function setSelected(_arg1:Boolean):void{
            this.selected_ = _arg1;
            this.redraw(false);
        }
        private function onMouseOver(_arg1:MouseEvent):void{
            this.redraw(true);
        }
        private function onRollOut(_arg1:MouseEvent):void{
            this.redraw(false);
        }
        private function redraw(_arg1:Boolean):void{
            var _local2:uint = ((_arg1) ? 0xFFFFFF : 0xB3B3B3);
            if (this.selected_)
            {
                _local2 = 0xFFC800;
            }
            this._p._du(_H_5, _local2);
        }

    }
}//package OptionsStuff

