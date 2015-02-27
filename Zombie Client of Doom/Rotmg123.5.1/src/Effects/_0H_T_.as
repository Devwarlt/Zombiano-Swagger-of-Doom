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

//Effects._0H_T_

package Effects {
import com.company.assembleegameclient.objects.GameObject;

public class _0H_T_ extends Effect {

    public var go_:GameObject;
    public var color_:uint;

    public function _0H_T_(_arg1:GameObject, _arg2:uint) {
        this.go_ = _arg1;
        this.color_ = _arg2;
    }

    override public function update(_arg1:int, _arg2:int):Boolean {
        var _local5:Number;
        var _local6:int;
        var _local7:Number;
        var _local8:_N_h;
        if (this.go_.map_ == null) {
            return (false);
        }
        x_ = this.go_.x_;
        y_ = this.go_.y_;
        var _local3:int = 10;
        var _local4:int;
        while (_local4 < _local3) {
            _local5 = ((2 * Math.PI) * (_local4 / _local3));
            _local6 = ((3 + int((Math.random() * 5))) * 20);
            _local7 = (0.3 + (0.4 * Math.random()));
            _local8 = new _N_h(this.color_, (Math.random() * 0.3), _local6, 1000, (0.1 + (Math.random() * 0.1)), this.go_, _local5, _local7);
            map_.addObj(_local8, (x_ + (_local7 * Math.cos(_local5))), (y_ + (_local7 * Math.sin(_local5))));
            _local4++;
        }
        return (false);
    }

}
}//package Effects

