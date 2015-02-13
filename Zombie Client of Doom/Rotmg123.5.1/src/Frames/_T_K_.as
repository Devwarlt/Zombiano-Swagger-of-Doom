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

//Frames._T_K_

package Frames{
    import flash.display.Sprite;
    import flash.display.Shape;
    import flash.display.Graphics;
    import flash.events.Event;

    public class _T_K_ extends Sprite {

        private var _T_y:Shape;
        private var _U_S_:_A_t;

        public function _T_K_(){
            this._T_y = new Shape();
            var _local1:Graphics = this._T_y.graphics;
            _local1.clear();
            _local1.beginFill(0, 0.8);
            _local1.drawRect(0, 0, 800, 600);
            _local1.endFill();
            addChild(this._T_y);
            this._U_S_ = new _A_t();
            this._U_S_.addEventListener(Event.CANCEL, this.onCancel);
            this._U_S_.addEventListener(Event.COMPLETE, this.onComplete);
            addChild(this._U_S_);
        }
        private function onCancel(_arg1:Event):void{
            parent.removeChild(this);
        }
        private function onComplete(_arg1:Event):void{
            parent.removeChild(this);
            dispatchEvent(new Event(Event.COMPLETE));
        }

    }
}//package Frames

