﻿// Copyright (c) 2015, FireBite/Aceticsoft Studios Inc.
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

//Effects._pK_

package Effects {
import flash.geom.Point;

public class _pK_ extends Effect {

    public var start_:Point;
    public var _0E_u:Number;
    public var color_:int;

    public function _pK_(_arg1:Point, _arg2:Number, _arg3:int) {
        this.start_ = _arg1;
        this._0E_u = _arg2;
        this.color_ = _arg3;
    }

    override public function update(_arg1:int, _arg2:int):Boolean {
        var _local7:Number;
        var _local8:Point;
        var _local9:Particle;
        x_ = this.start_.x;
        y_ = this.start_.y;
        var _local3 = 200;
        var _local4 = 200;
        var _local5:int = (4 + (this._0E_u * 2));
        var _local6:int;
        while (_local6 < _local5) {
            _local7 = (((_local6 * 2) * Math.PI) / _local5);
            _local8 = new Point((this.start_.x + (this._0E_u * Math.cos(_local7))), (this.start_.y + (this._0E_u * Math.sin(_local7))));
            _local9 = new _7c(_local3, this.color_, _local4, this.start_, _local8);
            map_.addObj(_local9, x_, y_);
            _local6++;
        }
        return (false);
    }

}
}//package Effects

