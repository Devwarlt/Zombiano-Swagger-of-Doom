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

//Effects._B_B_

package Effects {
import com.company.assembleegameclient.objects.GameObject;
import com.company.assembleegameclient.util._04d;

public class GasEffect extends Effect {

    public var go_:GameObject;
    public var _dQ_:_D_J_;
    public var color_:int;
    public var rate:Number;
    public var type:String;

    public function GasEffect(_arg1:GameObject, _arg2:_D_J_) {
        this.go_ = _arg1;
        this.color_ = _arg2.color;
        this.rate = _arg2.rate;
        this._dQ_ = _arg2;
    }

    override public function update(_arg1:int, _arg2:int):Boolean {
        var _local5:Number;
        var _local6:Number;
        var _local7:Number;
        var _local8:Number;
        var _local9:Number;
        var _local10:_t7;
        if (this.go_.map_ == null) {
            return (false);
        }
        x_ = this.go_.x_;
        y_ = this.go_.y_;
        var _local3:int = 20;
        var _local4:int;
        while (_local4 < this.rate) {
            _local5 = ((Math.random() + 0.3) * 200);
            _local6 = Math.random();
            _local7 = _04d._F_e((this._dQ_.speed - (this._dQ_.speed * (_local6 * (1 - this._dQ_.speedVariance)))));
            _local8 = _04d._F_e((this._dQ_.speed - (this._dQ_.speed * (_local6 * (1 - this._dQ_.speedVariance)))));
            _local9 = ((this._dQ_.life * 1000) - ((this._dQ_.life * 1000) * (_local6 * this._dQ_.lifeVariance)));
            _local10 = new _t7(_local5, this.color_, _local9, this._dQ_.spread, 0.75, _local7, _local8);
            map_.addObj(_local10, x_, y_);
            _local4++;
        }
        return (true);
    }

}
}//package Effects

