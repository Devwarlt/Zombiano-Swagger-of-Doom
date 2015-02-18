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

package Effects {
import com.company.assembleegameclient.objects.GameObject;
import com.company.assembleegameclient.util._wW_;

public class RainbowEffect extends Effect {

    private static const _03n:int = 50;

    public var go_:GameObject;
    public var lastUpdate_:int = -1;

    public function RainbowEffect(_arg1:GameObject){
        this.go_ = _arg1;
    }
    override public function update(_arg1:int, _arg2:int):Boolean{
        var _local4:int;
        var _local5:RainbowParticle;
        var _local6:Number;
        var _local7:Number;
        var _local8:Number;
        var _local9:Number;
        if (this.go_.map_ == null)
        {
            return (false);
        }
        if (this.lastUpdate_ < 0)
        {
            this.lastUpdate_ = Math.max(0, (_arg1 - 400));
        }
        x_ = this.go_.x_;
        y_ = this.go_.y_;
        var _local3:int = int((this.lastUpdate_ / _03n));
        while (_local3 < int((_arg1 / _03n)))
        {
            _local4 = (_local3 * _03n);
            _local5 = (_wW_._B_1(RainbowParticle) as RainbowParticle);
            _local5.restart(_local4, _arg1);
            _local6 = (Math.random() * Math.PI);
            _local7 = (Math.random() * 0.4);
            _local8 = (this.go_.x_ + (_local7 * Math.cos(_local6)));
            _local9 = (this.go_.y_ + (_local7 * Math.sin(_local6)));
            map_.addObj(_local5, _local8, _local9);
            _local3++;
        }
        this.lastUpdate_ = _arg1;
        return (true);
    }

}
}

import Effects.Particle;

import com.company.assembleegameclient.util._wW_;
import com.company.util.Random;

class RainbowParticle extends Particle {

    private static const colors:Array = [0xFF0000, 0xFFFF00, 0x00FF00, 0x00FFFF, 0x0000FF, 0xFF00FF];
    private static var rand:Random = new Random(int(Math.random() * 100));

    public var startTime_:int;
    public var speed_:int;

    public function RainbowParticle(){
        var _local1:Number = Math.random();
        super(colors[rand.next(0, colors.length - 1)], 0, (75 + (_local1 * 50)));
        this.speed_ = (2.5 - (_local1 * 1.5));
    }
    public function restart(_arg1:int, _arg2:int):void{
        this.startTime_ = _arg1;
        var timeDif:Number = ((_arg2 - this.startTime_) / 1000);
        z_ = (this.speed_ * timeDif);
    }
    override public function removeFromMap():void{
        super.removeFromMap();
        _wW_._ay(this);
    }
    override public function update(_arg1:int, _arg2:int):Boolean{
        var timeDif:Number = ((_arg1 - this.startTime_) / 1000);
        z_ = (this.speed_ * timeDif);
        return ((z_ < 1));
    }
}