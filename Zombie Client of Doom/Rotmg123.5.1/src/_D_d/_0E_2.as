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

//_D_d._0E_2

package _D_d {
import ToolTips.ToolTip;

import com.company.ui.SimpleText;

import flash.filters.DropShadowFilter;

public class _0E_2 extends ToolTip {

    private static const _be:int = 180;

    private var _P_V_:SimpleText;
    private var _C_G_:SimpleText;

    public function _0E_2(_arg1:XML) {
        super(0x500C00, 1, 0x9B9B9B, 1, true);
        this._P_V_ = new SimpleText(16, 0xFFFFFF, false, (_be - 4), 0, "Myriad Pro");
        this._P_V_.boldText(true);
        this._P_V_.wordWrap = true;
        this._P_V_.text = String(_arg1.@id);
        this._P_V_._08S_();
        this._P_V_.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
        this._P_V_.x = 0;
        this._P_V_.y = 0;
        addChild(this._P_V_);
        var _local2 = "";
        if (_arg1.hasOwnProperty("Speed")) {
            _local2 = (_local2 + (("Speed: " + Number(_arg1.Speed).toFixed(2)) + "\n"));
        } else {
            _local2 = (_local2 + "Speed: 1.00\n");
        }
        if (_arg1.hasOwnProperty("NoWalk")) {
            _local2 = (_local2 + "Unwalkable\n");
        }
        if (_arg1.hasOwnProperty("Push")) {
            _local2 = (_local2 + "Push\n");
        }
        if (_arg1.hasOwnProperty("Sink")) {
            _local2 = (_local2 + "Sink\n");
        }
        if (_arg1.hasOwnProperty("Sinking")) {
            _local2 = (_local2 + "Sinking\n");
        }
        if (_arg1.hasOwnProperty("Animate")) {
            _local2 = (_local2 + "Animated\n");
        }
        if (_arg1.hasOwnProperty("RandomOffset")) {
            _local2 = (_local2 + "Randomized\n");
        }
        this._C_G_ = new SimpleText(14, 0xB3B3B3, false, _be, 0, "Myriad Pro");
        this._C_G_.wordWrap = true;
        this._C_G_.text = String(_local2);
        this._C_G_._08S_();
        this._C_G_.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
        this._C_G_.x = 0;
        this._C_G_.y = (this._P_V_.height + 2);
        addChild(this._C_G_);
    }
}
}//package _D_d

