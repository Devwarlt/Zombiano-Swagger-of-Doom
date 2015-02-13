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

//Effects._l2

package Effects{
    import com.company.assembleegameclient.objects.GameObject;
    import com.company.assembleegameclient.util._04d;

    public class _l2 extends Effect {

        public var go_:GameObject;
        public var color_:int;

        public function _l2(_arg1:GameObject, _arg2:int){
            this.go_ = _arg1;
            this.color_ = _arg2;
        }
        override public function update(_arg1:int, _arg2:int):Boolean{
            if (this.go_.map_ == null)
            {
                return (false);
            }
            x_ = this.go_.x_;
            y_ = this.go_.y_;
            var _local3:int = 10;
            var _local4:int;
            while (_local4 < _local3)
            {
                map_.addObj(new _06s(100, this.color_, 400, 0.75, _04d._F_e(4), _04d._F_e(4)), x_, y_);
                _local4++;
            }
            return (false);
        }

    }
}//package Effects

