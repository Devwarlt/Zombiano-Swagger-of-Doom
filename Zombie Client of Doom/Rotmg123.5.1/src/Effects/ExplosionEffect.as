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

//Effects.ExplosionEffect

package Effects{


    public class ExplosionEffect extends Effect {

        public var _I_X_:Vector.<uint>;
        public var _td:int;

        public function ExplosionEffect(_arg1:Vector.<uint>, _arg2:int, _arg3:int){
            this._I_X_ = _arg1;
            size_ = _arg2;
            this._td = _arg3;
        }
        override public function update(_arg1:int, _arg2:int):Boolean{
            var _local4:uint;
            var _local5:Particle;
            if (this._I_X_.length == 0)
            {
                return (false);
            }
            var _local3:int;
            while (_local3 < this._td)
            {
                _local4 = this._I_X_[int((this._I_X_.length * Math.random()))];
                _local5 = new ExplosionParticle(_local4, 0.5, size_, (200 + (Math.random() * 100)), (Math.random() - 0.5), (Math.random() - 0.5), 0);
                map_.addObj(_local5, x_, y_);
                _local3++;
            }
            return (false);
        }

    }
}//package Effects

import Effects.Particle;
import flash.geom.Vector3D;

class ExplosionParticle extends Particle {

    public var lifetime_:int;
    public var timeLeft_:int;
    protected var moveVec_:Vector3D;

    public function ExplosionParticle(_arg1:uint, _arg2:Number, _arg3:int, _arg4:int, _arg5:Number, _arg6:Number, _arg7:Number){
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

