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

//com.company.assembleegameclient.game._uw

package com.company.assembleegameclient.game {

import com.company.assembleegameclient.net.messages.data.TimedPosition;

public class PositionHistoryManager {

    public var lastClearTime_:int = -1;
    public var records_:Vector.<TimedPosition>;

    public function PositionHistoryManager() {
        this.records_ = new Vector.<TimedPosition>();
        super();
    }

    public function _F_5(_arg1:int, _arg2:Number, _arg3:Number):void {
        if (this.lastClearTime_ < 0) {
            return;
        }
        var _local4:int = this._0E_8(_arg1);
        if ((((_local4 < 1)) || ((_local4 > 10)))) {
            return;
        }
        if (this.records_.length == 0) {
            this.records_.push(new TimedPosition(_arg1, _arg2, _arg3));
            return;
        }
        var _local5:TimedPosition = this.records_[(this.records_.length - 1)];
        var _local6:int = this._0E_8(_local5.time_);
        if (_local4 != _local6) {
            this.records_.push(new TimedPosition(_arg1, _arg2, _arg3));
            return;
        }
        var _local7:int = this._0F_a(_local4, _arg1);
        var _local8:int = this._0F_a(_local4, _local5.time_);
        if (_local7 < _local8) {
            _local5.time_ = _arg1;
            _local5.x_ = _arg2;
            _local5.y_ = _arg3;

        }
    }

    private function _0E_8(_arg1:int):int {
        return ((((_arg1 - this.lastClearTime_) + 50) / 100));
    }

    private function _0F_a(_arg1:int, _arg2:int):int {
        return (Math.abs(((_arg2 - this.lastClearTime_) - (_arg1 * 100))));
    }

    public function clear(_arg1:int):void {
        this.records_.length = 0;
        this.lastClearTime_ = _arg1;
    }

}
}//package com.company.assembleegameclient.game

