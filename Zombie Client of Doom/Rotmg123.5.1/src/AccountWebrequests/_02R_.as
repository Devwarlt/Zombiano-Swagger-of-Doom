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

//AccountWebrequests._02R_

package AccountWebrequests{
    import flash.display.Sprite;
    import flash.display.Shape;
    import flash.display.Graphics;
    import com.company.assembleegameclient.appengine._02k;
    import _00g._0H_i;
    import flash.events.Event;
    import com.company.assembleegameclient.util.offer.Offers;
    import _00g._02U_;
    import Frames._A_R_;
    import WebRequestEvents.WebRequestSuccessEvent;
    import flash.display.Stage;
    import _9R_._B_w;

    public class _02R_ extends Sprite {

        private var _2m:Boolean;

        public function _02R_(){
            var _local1:Shape = new Shape();
            var _local2:Graphics = _local1.graphics;
            _local2.clear();
            _local2.beginFill(0, 0.8);
            _local2.drawRect(0, 0, 800, 600);
            _local2.endFill();
            addChild(_local1);
            _02k._U_t("/credits", this._nK_);
        }
        private function _nK_(_arg1:WebRequestSuccessEvent):void{
            var _local2:_0H_i = new _0H_i();
            _local2.addEventListener(Event.CANCEL, this.onCancel);
            _local2.addEventListener(Event.COMPLETE, this.onComplete);
            _local2._0J_E_ = new Offers(XML(_arg1.data_));
            _local2._yI_ = "$";
            _local2._Q_W_ = "";
            _local2._d0 = true;
            _local2._02Z_ = true;
            _local2._04Z_ = new _02U_();
            var _local3:_A_R_ = new _A_R_(_local2);
            addChild(_local3);
        }
        private function onCancel(_arg1:Event):void{
            parent.removeChild(this);
        }
        private function onComplete(_arg1:Event):void{
            stage.addEventListener(Event.ACTIVATE, this._5h);
            parent.removeChild(this);
        }
        private function _5h(_arg1:Event):void{
            var _local2:Stage = (_arg1.target as Stage);
            _local2.dispatchEvent(new _B_w());
            _local2.removeEventListener(Event.ACTIVATE, this._5h);
        }

    }
}//package AccountWebrequests

