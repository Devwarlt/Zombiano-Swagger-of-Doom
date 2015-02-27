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

//com.hurlant.util.Hex

package com.hurlant.util {
import flash.utils.ByteArray;

public class Hex {

    public static function toArray(_arg1:String):ByteArray {
        _arg1 = _arg1.replace(/\s|:/gm, "");
        var _local2:ByteArray = new ByteArray();
        if (((_arg1.length & 1) == 1)) {
            _arg1 = ("0" + _arg1);
        }
        var _local3:uint;
        while (_local3 < _arg1.length) {
            _local2[(_local3 / 2)] = parseInt(_arg1.substr(_local3, 2), 16);
            _local3 = (_local3 + 2);
        }
        return (_local2);
    }

    public static function fromArray(_arg1:ByteArray, _arg2:Boolean = false):String {
        var _local3 = "";
        var _local4:uint;
        while (_local4 < _arg1.length) {
            _local3 = (_local3 + ("0" + _arg1[_local4].toString(16)).substr(-2, 2));
            if (_arg2) {
                if (_local4 < (_arg1.length - 1)) {
                    _local3 = (_local3 + ":");
                }
            }
            _local4++;
        }
        return (_local3);
    }

    public static function toString(_arg1:String):String {
        var _local2:ByteArray = toArray(_arg1);
        return (_local2.readUTFBytes(_local2.length));
    }

    public static function fromString(_arg1:String, _arg2:Boolean = false):String {
        var _local3:ByteArray = new ByteArray();
        _local3.writeUTFBytes(_arg1);
        return (fromArray(_local3, _arg2));
    }

}
}//package com.hurlant.util

