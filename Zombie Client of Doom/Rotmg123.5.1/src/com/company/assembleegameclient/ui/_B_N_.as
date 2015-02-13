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

//com.company.assembleegameclient.ui._B_N_

package com.company.assembleegameclient.ui{
import AccountManagement.ui.FancyTextButton;

import flash.display.Sprite;
    import flash.display.Bitmap;
    import flash.events.Event;
    import flash.display.BitmapData;
    import flash.events.MouseEvent;
    import flash.net.FileReference;
    import _q8._9l;

    public class _B_N_ extends Sprite {

        private var bitmap_:Bitmap;
        private var _B_k:FancyTextButton;
        private var _zF_:FancyTextButton;

        public function _B_N_(_arg1:BitmapData){
            this.bitmap_ = new Bitmap(_arg1);
            addChild(this.bitmap_);
            this._B_k = new FancyTextButton(16, "Save");
            addChild(this._B_k);
            this._zF_ = new FancyTextButton(16, "Close");
            addChild(this._zF_);
            addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
        }
        private function onAddedToStage(_arg1:Event):void{
            this._B_k.addEventListener(MouseEvent.CLICK, this._na);
            this._zF_.addEventListener(MouseEvent.CLICK, this._of);
            stage;
            this.bitmap_.x = ((600 / 2) - (this.bitmap_.width / 2));
            stage;
            this.bitmap_.y = ((600 / 2) - (this.bitmap_.height / 2));
            this._zF_.x = ((this.bitmap_.x + this.bitmap_.width) - this._zF_.width);
            this._zF_.y = ((this.bitmap_.y + this.bitmap_.height) + 10);
            this._B_k.x = ((this._zF_.x - this._B_k.width) - 10);
            this._B_k.y = ((this.bitmap_.y + this.bitmap_.height) + 10);
        }
        private function onRemovedFromStage(_arg1:Event):void{
            this._B_k.removeEventListener(MouseEvent.CLICK, this._na);
            this._zF_.removeEventListener(MouseEvent.CLICK, this._of);
        }
        private function _na(_arg1:Event):void{
            new FileReference().save(_9l.encode(this.bitmap_.bitmapData), "map.png");
        }
        private function _of(_arg1:Event):void{
            if (parent != null)
            {
                parent.removeChild(this);
            }
        }

    }
}//package com.company.assembleegameclient.ui

