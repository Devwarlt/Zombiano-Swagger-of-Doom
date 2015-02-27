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

//com.company.util._kp

package com.company.util {

import flash.display.BitmapData;


public class _kp {

    public var _W_u:Vector.<BitmapData>;

    public function _kp() {
        this._W_u = new Vector.<BitmapData>();
    }

    public function add(_arg1:BitmapData):void {
        this._W_u.push(_arg1);
    }

    public function random():BitmapData {
        return (this._W_u[int((Math.random() * this._W_u.length))]);
    }

    public function addFromBitmapData(_arg1:BitmapData, _arg2:int, _arg3:int):void {
        var _local7:int;
        var _local4:int = (_arg1.width / _arg2);
        var _local5:int = (_arg1.height / _arg3);
        var _local6:int;
        while (_local6 < _local5) {
            _local7 = 0;
            while (_local7 < _local4) {
                this._W_u.push(BitmapUtil._Y_d(_arg1, (_local7 * _arg2), (_local6 * _arg3), _arg2, _arg3));
                _local7++;
            }
            _local6++;
        }
    }

}
}//package com.company.util

