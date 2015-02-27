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

//com.company.assembleegameclient.util._x2

package com.company.assembleegameclient.util {

import com.company.util._kp;

import flash.display.BitmapData;


public class _x2 {

    public var _W_u:Vector.<_J_H_>;

    public function _x2() {
        this._W_u = new Vector.<_J_H_>();
        super();
    }

    public function addFromBitmapData(_arg1:BitmapData, _arg2:BitmapData, _arg3:int, _arg4:int):void {
        var _local5:_kp = new _kp();
        _local5.addFromBitmapData(_arg1, _arg3, _arg4);
        var _local6:_kp;
        if (_arg2 != null) {
            _local6 = new _kp();
            _local6.addFromBitmapData(_arg2, _arg3, _arg4);
        }
        var _local7:int;
        while (_local7 < _local5._W_u.length) {
            this._W_u.push(new _J_H_(_local5._W_u[_local7], (((_local6 == null)) ? null : _local6._W_u[_local7])));
            _local7++;
        }
    }

    public function _28(_arg1:_J_H_, _arg2:int, _arg3:int):void {
        this.addFromBitmapData(_arg1.image_, _arg1.mask_, _arg2, _arg3);
    }

}
}//package com.company.assembleegameclient.util

