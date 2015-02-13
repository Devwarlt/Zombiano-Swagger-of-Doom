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

//com.company.assembleegameclient.tutorial.UIDrawBox

package com.company.assembleegameclient.tutorial{
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import com.company.util.ConversionUtil;
    import flash.display.Graphics;

    public class UIDrawBox {

        public const _c5:int = 500;
        public const _P_5:Point = new Point(250, 200);

        public var rect_:Rectangle;
        public var color_:uint;

        public function UIDrawBox(_arg1:XML){
            this.rect_ = ConversionUtil._0M_q(_arg1);
            this.color_ = uint(_arg1.@color);
        }
        public function draw(_arg1:int, _arg2:Graphics, _arg3:int):void{
            var _local4:Number;
            var _local5:Number;
            var _local6:Number = (this.rect_.width - _arg1);
            var _local7:Number = (this.rect_.height - _arg1);
            if (_arg3 < this._c5)
            {
                _local4 = (this._P_5.x + (((this.rect_.x - this._P_5.x) * _arg3) / this._c5));
                _local5 = (this._P_5.y + (((this.rect_.y - this._P_5.y) * _arg3) / this._c5));
                _local6 = (_local6 * (_arg3 / this._c5));
                _local7 = (_local7 * (_arg3 / this._c5));
            } else
            {
                _local4 = (this.rect_.x + (_arg1 / 2));
                _local5 = (this.rect_.y + (_arg1 / 2));
            }
            _arg2.lineStyle(_arg1, this.color_);
            _arg2.drawRect(_local4, _local5, _local6, _local7);
        }

    }
}//package com.company.assembleegameclient.tutorial

