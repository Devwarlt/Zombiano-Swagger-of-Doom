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

//com.company.assembleegameclient.objects._T_f

package com.company.assembleegameclient.objects {
import flash.geom.ColorTransform;
import flash.display.BitmapData;

public class _T_f {

    public var startTime_:int;
    public var color_:uint;
    public var _89:int;
    public var _eP_:int;
    public var _4p:ColorTransform;
    public var _m_:int;
    public var _V_x:int;
    public var _0K_4:int;

    public function _T_f(_arg1:int, _arg2:uint, _arg3:Number, _arg4:int) {
        this.startTime_ = _arg1;
        this.color_ = _arg2;
        this._89 = (_arg3 * 1000);
        this._eP_ = _arg4;
        this._m_ = ((_arg2 >> 16) & 0xFF);
        this._V_x = ((_arg2 >> 8) & 0xFF);
        this._0K_4 = (_arg2 & 0xFF);
    }

    public function apply(_arg1:BitmapData, _arg2:int):BitmapData {
        var _local3:int = ((_arg2 - this.startTime_) % this._89);
        var _local4:Number = Math.sin(((_local3 / this._89) * Math.PI));
        var _local5:Number = (_local4 * 0.5);
        var _local6:ColorTransform = new ColorTransform((1 - _local5), (1 - _local5), (1 - _local5), 1, (_local5 * this._m_), (_local5 * this._V_x), (_local5 * this._0K_4), 0);
        var _local7:BitmapData = _arg1.clone();
        _local7.colorTransform(_local7.rect, _local6);
        return (_local7);
    }

    public function _jQ_(_arg1:int):Boolean {
        return ((_arg1 > (this.startTime_ + (this._89 * this._eP_))));
    }

}
}//package com.company.assembleegameclient.objects

