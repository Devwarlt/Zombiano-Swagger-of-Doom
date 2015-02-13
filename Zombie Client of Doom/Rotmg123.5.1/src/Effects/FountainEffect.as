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

//Effects.FountainEffect

package Effects{
    import com.company.assembleegameclient.objects.GameObject;
    import com.company.assembleegameclient.util._wW_;

    public class FountainEffect extends Effect {

        public var go_:GameObject;
        public var lastUpdate_:int = -1;

        public function FountainEffect(_arg1:GameObject){
            this.go_ = _arg1;
        }
        override public function update(_arg1:int, _arg2:int):Boolean{
            var _local4:int;
            var _local5:FountainParticle;
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
            var _local3:int = (this.lastUpdate_ / 50);
            while (_local3 < (_arg1 / 50))
            {
                _local4 = (_local3 * 50);
                _local5 = (_wW_._B_1(FountainParticle) as FountainParticle);
                _local5.restart(_local4, _arg1);
                map_.addObj(_local5, x_, y_);
                _local3++;
            }
            this.lastUpdate_ = _arg1;
            return (true);
        }

    }
}//package Effects

import Effects.Particle;
import flash.geom.Vector3D;
import com.company.assembleegameclient.util._wW_;

class FountainParticle extends Particle {

    /*private*/ internal static const G:Number = -4.9;
    /*private*/ internal static const VI:Number = 6.5;
    /*private*/ internal static const ZI:Number = 0.75;

    public var startTime_:int;
    protected var moveVec_:Vector3D;

    public function FountainParticle(){
        this.moveVec_ = new Vector3D();
        super(4285909, ZI, 100);
    }
    public function restart(_arg1:int, _arg2:int):void{
        var _local4:int;
        var _local3:Number = ((2 * Math.PI) * Math.random());
        this.moveVec_.x = Math.cos(_local3);
        this.moveVec_.y = Math.sin(_local3);
        this.startTime_ = _arg1;
        _local4 = (_arg2 - this.startTime_);
        x_ = (x_ + ((this.moveVec_.x * _local4) * 0.0008));
        y_ = (y_ + ((this.moveVec_.y * _local4) * 0.0008));
        var _local5:Number = ((_arg2 - this.startTime_) / 1000);
        z_ = ((0.75 + (VI * _local5)) + (G * (_local5 * _local5)));
    }
    override public function removeFromMap():void{
        super.removeFromMap();
        _wW_._ay(this);
    }
    override public function update(_arg1:int, _arg2:int):Boolean{
        var _local3:Number = ((_arg1 - this.startTime_) / 1000);
        moveTo((x_ + ((this.moveVec_.x * _arg2) * 0.0008)), (y_ + ((this.moveVec_.y * _arg2) * 0.0008)));
        z_ = ((0.75 + (VI * _local3)) + (G * (_local3 * _local3)));
        return ((z_ > 0));
    }

}

