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

//Effects.HitEffect

package Effects{


    public class HitEffect extends Effect {

        public var _I_X_:Vector.<uint>;
        public var _td:int;
        public var angle_:Number;
        public var speed_:Number;

        public function HitEffect(_arg1:Vector.<uint>, _arg2:int, _arg3:int, _arg4:Number, _arg5:Number){
            this._I_X_ = _arg1;
            size_ = _arg2;
            this._td = _arg3;
            this.angle_ = _arg4;
            this.speed_ = _arg5;
        }
        override public function update(_arg1:int, _arg2:int):Boolean{
            var _local6:uint;
            var _local7:Particle;
            if (this._I_X_.length == 0)
            {
                return (false);
            }
            var _local3:Number = ((this.speed_ / 600) * Math.cos((this.angle_ + Math.PI)));
            var _local4:Number = ((this.speed_ / 600) * Math.sin((this.angle_ + Math.PI)));
            var _local5:int;
            while (_local5 < this._td)
            {
                _local6 = this._I_X_[int((this._I_X_.length * Math.random()))];
                _local7 = new HitParticle(_local6, 0.5, size_, (200 + (Math.random() * 100)), (_local3 + ((Math.random() - 0.5) * 0.4)), (_local4 + ((Math.random() - 0.5) * 0.4)), 0);
                map_.addObj(_local7, x_, y_);
                _local5++;
            }
            return (false);
        }

    }
}//package Effects

import Effects.Particle;
import flash.geom.Vector3D;

class HitParticle extends Particle {

    public var lifetime_:int;
    public var timeLeft_:int;
    protected var moveVec_:Vector3D;

    public function HitParticle(_arg1:uint, _arg2:Number, _arg3:int, _arg4:int, _arg5:Number, _arg6:Number, _arg7:Number){
        this.moveVec_ = new Vector3D();
        super(_arg1, _arg2, _arg3);
        this.timeLeft_ = (this.lifetime_ = _arg4);
        this.moveVec_.x = _arg5;
        this.moveVec_.y = _arg6;
        this.moveVec_.z = _arg7;
    }
    override public function update(_arg1:int, _arg2:int):Boolean{
        this.timeLeft_ = (this.timeLeft_ - _arg2);
        if (this.timeLeft_ <= 0)
        {
            return (false);
        }
        x_ = (x_ + ((this.moveVec_.x * _arg2) * 0.008));
        y_ = (y_ + ((this.moveVec_.y * _arg2) * 0.008));
        z_ = (z_ + ((this.moveVec_.z * _arg2) * 0.008));
        return (true);
    }

}

