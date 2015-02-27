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

//_D_d._Q_S_

package _D_d {
import _D_d._P_u;

import flash.display.Shape;
import flash.display.IGraphicsData;

import com.company.assembleegameclient.map._0D_v;

import flash.geom.Rectangle;

import com.company.assembleegameclient.map._pf;

import flash.display.BitmapData;

import com.company.assembleegameclient.map._ik;
import com.company.assembleegameclient.map._M_X_;

import _D_d._0E_2;

import ToolTips.ToolTip;

import _D_d.*;

internal class _Q_S_ extends _P_u {

    private static const _J_c:Vector.<Number> = new <Number>[0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0];
    private static const _0L_L_:Number = 0.6;

    public var _5b:XML;
    private var _G_m:Shape;

    public function _Q_S_(_arg1:XML) {
        super(int(_arg1.@type));
        this._5b = _arg1;
        var _local2:Vector.<IGraphicsData> = new Vector.<IGraphicsData>();
        var _local3:_0D_v = new _0D_v();
        _local3._K_(0.5, 0.5, 12, (Math.PI / 4), new Rectangle(-100, -100, 200, 200), false);
        var _local4:BitmapData = _pf.getBitmapData(type_);
        var _local5:_ik = new _ik(_local4, _J_c, 0, 0, _M_X_._0I_7, 0, 0);
        _local5.draw(_local2, _local3, 0);
        this._G_m = new Shape();
        this._G_m.graphics.drawGraphicsData(_local2);
        this._G_m.scaleX = (this._G_m.scaleY = _0L_L_);
        this._G_m.x = (WIDTH / 2);
        this._G_m.y = (HEIGHT / 2);
        addChild(this._G_m);
    }

    override protected function getToolTip():ToolTip {
        return (new _0E_2(this._5b));
    }

}
}//package _D_d

