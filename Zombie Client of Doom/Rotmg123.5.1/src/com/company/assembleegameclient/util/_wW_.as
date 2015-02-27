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

//com.company.assembleegameclient.util._wW_

package com.company.assembleegameclient.util {
import flash.utils.Dictionary;


public class _wW_ {

    private static var _aI_:Dictionary = new Dictionary();

    public static function _B_1(_arg1:Class):Object {
        var _local2:Vector.<Object> = _aI_[_arg1];
        if (_local2 == null) {
            _local2 = new Vector.<Object>();
            _aI_[_arg1] = _local2;
        } else {
            if (_local2.length > 0) {
                return (_local2.pop());
            }
        }
        return (new (_arg1)());
    }

    public static function _7L_(_arg1:*, _arg2:Object):void {
        var _local3:Vector.<Object> = _aI_[_arg1];
        if (_local3 == null) {
            _local3 = new Vector.<Object>();
            _aI_[_arg1] = _local3;
        }
        _local3.push(_arg2);
    }

    public static function getObject(_arg1:*):Object {
        var _local2:Vector.<Object> = _aI_[_arg1];
        if (((!((_local2 == null))) && ((_local2.length > 0)))) {
            return (_local2.pop());
        }
        return (null);
    }

    public static function dump(_arg1:*):void {
        delete _aI_[_arg1];
    }

    public static function _ay(_arg1:Object):void {
        var _local2:Class = Object(_arg1).constructor;
        var _local3:Vector.<Object> = _aI_[_local2];
        if (_local3 == null) {
            _local3 = new Vector.<Object>();
            _aI_[_local2] = _local3;
        }
        _local3.push(_arg1);
    }

}
}//package com.company.assembleegameclient.util

