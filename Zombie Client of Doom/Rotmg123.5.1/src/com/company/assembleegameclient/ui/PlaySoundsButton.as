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

//com.company.assembleegameclient.ui._zX_

package com.company.assembleegameclient.ui{
    import flash.display.Sprite;
    import flash.display.Bitmap;
    import flash.events.MouseEvent;
    import flash.filters.GlowFilter;
    import com.company.assembleegameclient.parameters.Parameters;
    import com.company.util.AssetLibrary;
    import Sounds.Music;
    import Sounds._Q_P_;

    public class PlaySoundsButton extends Sprite {

        private var bitmap_:Bitmap;

        public function PlaySoundsButton(){
            this.bitmap_ = new Bitmap();
            super();
            addChild(this.bitmap_);
            this.bitmap_.scaleX = 1;
            this.bitmap_.scaleY = 1;
            this.resolveBitmapData();
            addEventListener(MouseEvent.CLICK, this.onClick);
            filters = [new GlowFilter(0, 1, 4, 4, 2, 1)];
        }
        private function resolveBitmapData():void{
            this.bitmap_.bitmapData = ((((Parameters.data_.playMusic) || (Parameters.data_.playSFX))) ? AssetLibrary._xK_("lofiInterfaceBig", 3) : AssetLibrary._xK_("lofiInterfaceBig", 4));
        }
        private function onClick(_arg1:MouseEvent):void{
            var _local2:Boolean = !(((Parameters.data_.playMusic) || (Parameters.data_.playSFX)));
            Music._continue(_local2);
            _Q_P_._2c(_local2);
            Parameters.data_.playPewPew = _local2;
            Parameters.save();
            this.resolveBitmapData();
        }

    }
}//package com.company.assembleegameclient.ui

