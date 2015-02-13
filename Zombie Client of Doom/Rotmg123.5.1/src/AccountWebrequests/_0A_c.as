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

//AccountWebrequests._0A_c

package AccountWebrequests{
    import flash.display.Sprite;
    import flash.display.Shape;
    import flash.display.Graphics;
    import flash.events.Event;

    public class _0A_c extends Sprite {

        private var _T_y:Shape;

        public function _0A_c(){
            this._T_y = new Shape();
            var _local1:Graphics = this._T_y.graphics;
            _local1.clear();
            _local1.beginFill(0, 0.8);
            _local1.drawRect(0, 0, 800, 600);
            _local1.endFill();
            addChild(this._T_y);
            var _local2:_0L_h = new _0L_h(false);
            _local2.addEventListener(_nJ_.DONE, this._0E_C_);
            _local2.addEventListener(_nJ_._tp, this._0E_C_);
            addChild(_local2);
        }
        private function _0E_C_(_arg1:Event):void{
            parent.removeChild(this);
        }

    }
}//package AccountWebrequests

