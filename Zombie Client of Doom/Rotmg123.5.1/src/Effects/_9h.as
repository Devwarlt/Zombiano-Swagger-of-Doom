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

//Effects._9h

package Effects{
    import flash.geom.Point;
    import com.company.assembleegameclient.objects.GameObject;
    import com.company.assembleegameclient.net.messages.data.Position;
    import com.company.assembleegameclient.util._04d;

    public class _9h extends Effect {

        public var start_:Point;
        public var end_:Point;
        public var color_:int;
        public var _wp:int;

        public function _9h(_arg1:GameObject, _arg2:Position, _arg3:int, _arg4:int){
            this.start_ = new Point(_arg1.x_, _arg1.y_);
            this.end_ = new Point(_arg2.x_, _arg2.y_);
            this.color_ = _arg3;
            this._wp = _arg4;
        }
        override public function update(_arg1:int, _arg2:int):Boolean{
            var _local6:Point;
            var _local7:Particle;
            var _local8:Number;
            x_ = this.start_.x;
            y_ = this.start_.y;
            var _local3:Number = Point.distance(this.start_, this.end_);
            var _local4:int = (_local3 * 3);
            var _local5:int;
            while (_local5 < _local4)
            {
                _local6 = Point.interpolate(this.start_, this.end_, (_local5 / _local4));
                _local7 = new _06s(this._wp, this.color_, (1000 - ((_local5 / _local4) * 900)), 0.5, 0, 0);
                _local8 = Math.min(_local5, (_local4 - _local5));
                map_.addObj(_local7, (_local6.x + _04d._F_e(((_local3 / 200) * _local8))), (_local6.y + _04d._F_e(((_local3 / 200) * _local8))));
                _local5++;
            }
            return (false);
        }

    }
}//package Effects

