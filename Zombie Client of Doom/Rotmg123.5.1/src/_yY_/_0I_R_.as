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

//_yY_._0I_R_

package _yY_{
    import flash.geom.Point;
    import flash.display.BitmapData;
    import com.company.util.AssetLibrary;
    import com.company.assembleegameclient.util.TextureRedrawer;

    public class _0I_R_ extends _0H_Q_ {

        public var lifetime_:int;
        public var timeLeft_:int;
        public var start_:Point;
        public var end_:Point;
        public var dx_:Number;
        public var dy_:Number;
        public var pathX_:Number;
        public var pathY_:Number;
        private var bitmapData:BitmapData;

        public function _0I_R_(_arg1:int, _arg2:Point, _arg3:Point){
            this.bitmapData = AssetLibrary._xK_("lofiObj3", 411);
            this.bitmapData = TextureRedrawer.redraw(this.bitmapData, 80, true, 0, 0, false);
            _A_o = 0.2;
            super(0, this.bitmapData);
            this.lifetime_ = (this.timeLeft_ = _arg1);
            this.start_ = _arg2;
            this.end_ = _arg3;
            this.dx_ = ((this.end_.x - this.start_.x) / this.timeLeft_);
            this.dy_ = ((this.end_.y - this.start_.y) / this.timeLeft_);
            var _local4:Number = (Point.distance(_arg2, _arg3) / this.timeLeft_);
            this.pathX_ = (x_ = this.start_.x);
            this.pathY_ = (y_ = this.start_.y);
        }
        override public function update(_arg1:int, _arg2:int):Boolean{
            this.timeLeft_ = (this.timeLeft_ - _arg2);
            if (this.timeLeft_ <= 0)
            {
                return (false);
            }
            z_ = (Math.sin(((this.timeLeft_ / this.lifetime_) * Math.PI)) * 2);
            _H_9(z_);
            this.pathX_ = (this.pathX_ + (this.dx_ * _arg2));
            this.pathY_ = (this.pathY_ + (this.dy_ * _arg2));
            moveTo(this.pathX_, this.pathY_);
            return (true);
        }

    }
}//package _yY_

