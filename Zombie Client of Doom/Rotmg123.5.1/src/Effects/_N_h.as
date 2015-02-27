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

//Effects._N_h

package Effects {
import com.company.assembleegameclient.objects.GameObject;

import flash.geom.Vector3D;

public class _N_h extends Particle {

    public var timeLeft_:int;
    public var go_:GameObject;
    public var angle_:Number;
    public var _j0:Number;
    protected var moveVec_:Vector3D;

    public function _N_h(_arg1:uint, _arg2:Number, _arg3:int, _arg4:int, _arg5:Number, _arg6:GameObject, _arg7:Number, _arg8:Number) {
        this.moveVec_ = new Vector3D();
        super(_arg1, _arg2, _arg3);
        this.moveVec_.z = _arg5;
        this.timeLeft_ = _arg4;
        this.go_ = _arg6;
        this.angle_ = _arg7;
        this._j0 = _arg8;
    }

    override public function update(_arg1:int, _arg2:int):Boolean {
        this.timeLeft_ = (this.timeLeft_ - _arg2);
        if (this.timeLeft_ <= 0) {
            return (false);
        }
        x_ = (this.go_.x_ + (this._j0 * Math.cos(this.angle_)));
        y_ = (this.go_.y_ + (this._j0 * Math.sin(this.angle_)));
        z_ = (z_ + ((this.moveVec_.z * _arg2) * 0.008));
        return (true);
    }

}
}//package Effects

