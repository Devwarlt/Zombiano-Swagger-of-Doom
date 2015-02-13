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

//Effects._4m

package Effects{
    import com.company.assembleegameclient.objects.GameObject;

    public class HealingEffect extends Effect {

        public var go_:GameObject;
        public var _0M_4:int;

        public function HealingEffect(_arg1:GameObject){
            this.go_ = _arg1;
            this._0M_4 = 0;
        }
        override public function update(_arg1:int, _arg2:int):Boolean{
            var _local4:Number;
            var _local5:int;
            var _local6:Number;
            var _local7:_N_h;
            if (this.go_.map_ == null)
            {
                return (false);
            }
            x_ = this.go_.x_;
            y_ = this.go_.y_;
            var _local3:int = (_arg1 - this._0M_4);
            if (_local3 > 500)
            {
                _local4 = ((2 * Math.PI) * Math.random());
                _local5 = ((3 + int((Math.random() * 5))) * 20);
                _local6 = (0.3 + (0.4 * Math.random()));
                _local7 = new _N_h(0xFFFFFF, (Math.random() * 0.3), _local5, 1000, (0.1 + (Math.random() * 0.1)), this.go_, _local4, _local6);
                map_.addObj(_local7, (x_ + (_local6 * Math.cos(_local4))), (y_ + (_local6 * Math.sin(_local4))));
                this._0M_4 = _arg1;
            }
            return (true);
        }

    }
}//package Effects

