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

//ToolTips._aS_

package ToolTips {
import com.company.ui.SimpleText;

import flash.filters.DropShadowFilter;

public class _aS_ extends ToolTip {

    public var _P_V_:SimpleText;
    public var _0B_A_:SimpleText;

    public function _aS_(_arg1:uint, _arg2:uint, _arg3:String, _arg4:String, _arg5:int) {
        super(_arg1, 1, _arg2, 1);
        if (_arg3 != null) {
            this._P_V_ = new SimpleText(20, 0xFFFFFF, false, _arg5, 0, "Myriad Pro");
            this._P_V_.boldText(true);
            this._P_V_.wordWrap = true;
            this._P_V_.text = _arg3;
            this._P_V_.updateMetrics();
            this._P_V_.filters = [new DropShadowFilter(0, 0, 0)];
            addChild(this._P_V_);
        }
        if (_arg4 != null) {
            this._0B_A_ = new SimpleText(14, 0xB3B3B3, false, _arg5, 0, "Myriad Pro");
            this._0B_A_.wordWrap = true;
            this._0B_A_.y = (((this._P_V_) != null) ? (this._P_V_.height + 8) : 0);
            this._0B_A_.text = _arg4;
            this._0B_A_._08S_();
            this._0B_A_.filters = [new DropShadowFilter(0, 0, 0)];
            addChild(this._0B_A_);
        }
    }

    public function _N_k(_arg1:String):void {
        this._P_V_.text = _arg1;
        this._P_V_.updateMetrics();
        draw();
    }

    public function _02C_(_arg1:String):void {
        this._0B_A_.text = _arg1;
        this._0B_A_._08S_();
        draw();
    }

}
}//package ToolTips

