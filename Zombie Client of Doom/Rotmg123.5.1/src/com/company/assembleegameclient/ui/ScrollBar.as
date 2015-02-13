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

//com.company.assembleegameclient.ui._0K_B_

package com.company.assembleegameclient.ui{
    import flash.display.Sprite;

    import flash.display.IGraphicsData;
    import com.company.util.GraphicHelper;
    import flash.geom.Rectangle;
    import flash.display.GraphicsSolidFill;
    import flash.display.GraphicsPath;
    import flash.events.MouseEvent;
    import flash.display.Graphics;
    import flash.geom.ColorTransform;
    import flash.events.Event;
    import flash.utils.getTimer;


    public class ScrollBar extends Sprite {

        private var width_:int;
        private var height_:int;
        private var speed_:Number;
        private var _gC_:Rectangle;
        private var _oI_:Number;
        private var background_:Sprite;
        private var _mQ_:Sprite;
        private var _pr:Sprite;
        private var sliderDrag:Sprite;
        private var _I_n:int;
        private var _H_:Number;

        public var totalHeight:int;

        public function ScrollBar(width:int, height:int, scrollSpeed:Number=1){
            super();
            this.background_ = new Sprite();
            this.background_.addEventListener(MouseEvent.MOUSE_DOWN, this._06t);
            addChild(this.background_);
            this._mQ_ = this._y9(this._0C_S_);
            addChild(this._mQ_);
            this._pr = this._y9(this._bX_);
            addChild(this._pr);
            this.sliderDrag = this._y9(this._0N_3);
            addChild(this.sliderDrag);
            this.resize(width, height, scrollSpeed);
        }
        private static function _G_k(_arg1:int, _arg2:int, _arg3:Graphics):void{
            _arg3.clear();
            _arg3.beginFill(0x353535, 0.01);
            _arg3.drawRect((-(_arg1) / 2), (-(_arg2) / 2), _arg1, _arg2);
            _arg3.endFill();
            _arg3.beginFill(0x6E6E6E, 1);
            _arg3.moveTo((-(_arg1) / 2), (-(_arg2) / 2));
            _arg3.lineTo((_arg1 / 2), 0);
            _arg3.lineTo((-(_arg1) / 2), (_arg2 / 2));
            _arg3.lineTo((-(_arg1) / 2), (-(_arg2) / 2));
            _arg3.endFill();
        }

        public function _Q_D_():Number{
            return (((this.sliderDrag.y - this._gC_.y) / (this._gC_.height - this.sliderDrag.height)));
        }
        public function _fA_(baseValue:Number, totalHeight:Number, moveToTop:Boolean=true):void{
            var _local4:int = (((totalHeight == 0)) ? this._gC_.height : ((baseValue / totalHeight) * this._gC_.height));
            _local4 = Math.min(this._gC_.height, Math.max(this.width_, _local4));
            this._5s(this.width_, _local4, this.sliderDrag);
            this._oI_ = (baseValue / (totalHeight - baseValue));
            this.totalHeight = totalHeight;
            if (moveToTop)
            {
                this._0D__(0);
            }
        }
        public function _0D__(_arg1:Number):void{
            _arg1 = Math.max(0, Math.min(1, _arg1));
            this.sliderDrag.y = ((_arg1 * (this._gC_.height - this.sliderDrag.height)) + this._gC_.y);
            this._bf();
        }
        public function _d9():void{
            this._0D__((this._Q_D_() - this._oI_));
        }
        public function _tE_():void{
            this._0D__((this._Q_D_() + this._oI_));
        }
        private function _y9(_arg1:Function):Sprite{
            var _local2:Sprite = new Sprite();
            _local2.addEventListener(MouseEvent.MOUSE_DOWN, _arg1);
            _local2.addEventListener(MouseEvent.ROLL_OVER, this._0G_t);
            _local2.addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
            return (_local2);
        }
        private function _0G_t(_arg1:MouseEvent):void{
            var _local2:Sprite = (_arg1.target as Sprite);
            _local2.transform.colorTransform = new ColorTransform(1.0, 1.0, 1.0, 1.0, 146, 146, 146);
        }
        private function onRollOut(_arg1:MouseEvent):void{
            var _local2:Sprite = (_arg1.target as Sprite);
            _local2.transform.colorTransform = new ColorTransform(1, 1, 1);
        }
        private function _06t(_arg1:MouseEvent):void{
            if (_arg1.localY < this.sliderDrag.y)
            {
                this._d9();
            } else
            {
                this._tE_();
            }
        }
        private function _0C_S_(_arg1:MouseEvent):void{
            addEventListener(Event.ENTER_FRAME, this._0N_);
            addEventListener(MouseEvent.MOUSE_UP, this._04J_);
            this._I_n = getTimer();
            this._H_ = -(this.speed_);
        }
        private function _bX_(_arg1:MouseEvent):void{
            addEventListener(Event.ENTER_FRAME, this._0N_);
            addEventListener(MouseEvent.MOUSE_UP, this._04J_);
            this._I_n = getTimer();
            this._H_ = this.speed_;
        }
        private function _0N_(_arg1:Event):void{
            var _local2:int = getTimer();
            var _local3:Number = ((_local2 - this._I_n) / 1000);
            var _local4:int = (((this.height_ - (this.width_ * 3)) * _local3) * this._H_);
            this._0D__((((this.sliderDrag.y + _local4) - this._gC_.y) / (this._gC_.height - this.sliderDrag.height)));
            this._I_n = _local2;
        }
        private function _04J_(_arg1:Event):void{
            removeEventListener(Event.ENTER_FRAME, this._0N_);
            removeEventListener(MouseEvent.MOUSE_UP, this._04J_);
        }
        private function _0N_3(_arg1:MouseEvent):void{
            this.sliderDrag.startDrag(false, new Rectangle(0, this._gC_.y, 0, (this._gC_.height - this.sliderDrag.height)));
            stage.addEventListener(MouseEvent.MOUSE_UP, this._J_J_);
            stage.addEventListener(MouseEvent.MOUSE_MOVE, this._ma);
            this._bf();
        }
        private function _J_J_(_arg1:MouseEvent):void{
            stage.removeEventListener(MouseEvent.MOUSE_UP, this._J_J_);
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, this._ma);
            this.sliderDrag.stopDrag();
            this._bf();
        }
        private function _ma(_arg1:MouseEvent):void{
            this._bf();
        }
        private function _bf():void{
            dispatchEvent(new Event(Event.CHANGE));
        }
        public function resize(_arg1:int, _arg2:int, _arg3:Number=1):void{
            this.width_ = _arg1;
            this.height_ = _arg2;
            this.speed_ = _arg3;
            var _local4:int = (this.width_ * 0.75);
            this._gC_ = new Rectangle(0, (_local4 + 5), this.width_, ((this.height_ - (_local4 * 2)) - 10));
            var _local5:Graphics = this.background_.graphics;
            _local5.clear();
            _local5.beginFill(0x666666, 1.0);
            _local5.drawRect(this._gC_.x, this._gC_.y, this._gC_.width, this._gC_.height);
            _local5.endFill();
            _G_k(_local4, this.width_, this._mQ_.graphics);
            this._mQ_.rotation = -90;
            this._mQ_.x = (this.width_ / 2);
            this._mQ_.y = (_local4 / 2);
            _G_k(_local4, this.width_, this._pr.graphics);
            this._pr.x = (this.width_ / 2);
            this._pr.y = (this.height_ - (_local4 / 2));
            this._pr.rotation = 90;
            this._5s(this.width_, this.height_, this.sliderDrag);
            this.sliderDrag.x = 0;
            this.sliderDrag.y = this._gC_.y;
        }
        private function _5s(_arg1:int, _arg2:int, _arg3:Sprite):void{
            _arg3.graphics.clear();
            _arg3.graphics.beginFill(0x3D3D3D, 1.0);
            _arg3.graphics.drawRect(0, 0, _arg1, _arg2);
            _arg3.graphics.endFill();

            _arg3.graphics.lineStyle(1, 0xffffff, 1.0);
            _arg3.graphics.drawRect(0.5, 0.5, _arg1 - 1, _arg2 - 1);
            _arg3.graphics.lineStyle();
        }
    }
}//package com.company.assembleegameclient.ui

