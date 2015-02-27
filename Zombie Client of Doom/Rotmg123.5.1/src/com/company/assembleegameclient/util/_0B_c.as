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

//com.company.assembleegameclient.util._0B_c

package com.company.assembleegameclient.util {
import flash.utils.Dictionary;

import flash.display.BitmapData;


public class _0B_c {

    private static var _0H_k:Dictionary = new Dictionary();

    public static function _J_v(_arg1:String, _arg2:int):_lJ_ {
        var _local3:Vector.<_lJ_> = _0H_k[_arg1];
        if ((((_local3 == null)) || ((_arg2 >= _local3.length)))) {
            return (null);
        }
        return (_local3[_arg2]);
    }

    public static function add(_arg1:String, _arg2:BitmapData, _arg3:BitmapData, _arg4:int, _arg5:int, _arg6:int, _arg7:int, _arg8:int):void {
        var _local11:_J_H_;
        var _local9:Vector.<_lJ_> = new Vector.<_lJ_>();
        var _local10:_x2 = new _x2();
        _local10.addFromBitmapData(_arg2, _arg3, _arg6, _arg7);
        for each (_local11 in _local10._W_u) {
            _local9.push(new _lJ_(_local11, _arg4, _arg5, _arg8));
        }
        _0H_k[_arg1] = _local9;
    }

}
}//package com.company.assembleegameclient.util

