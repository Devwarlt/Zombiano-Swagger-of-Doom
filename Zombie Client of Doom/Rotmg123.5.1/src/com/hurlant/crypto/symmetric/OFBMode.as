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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// either expressed or implied, of the FreeBSD Project.// either expressed or implied, of the FreeBSD Project.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.hurlant.crypto.symmetric.OFBMode

package com.hurlant.crypto.symmetric {
import flash.utils.ByteArray;

public class OFBMode extends IVMode implements IMode {

    public function OFBMode(_arg1:ISymmetricKey, _arg2:IPad = null) {
        super(_arg1, null);
    }

    public function encrypt(_arg1:ByteArray):void {
        var _local2:ByteArray = getIV4e();
        this.core(_arg1, _local2);
    }

    public function decrypt(_arg1:ByteArray):void {
        var _local2:ByteArray = getIV4d();
        this.core(_arg1, _local2);
    }

    private function core(_arg1:ByteArray, _arg2:ByteArray):void {
        var _local6:uint;
        var _local7:uint;
        var _local3:uint = _arg1.length;
        var _local4:ByteArray = new ByteArray();
        var _local5:uint;
        while (_local5 < _arg1.length) {
            key.encrypt(_arg2);
            _local4.position = 0;
            _local4.writeBytes(_arg2);
            _local6 = ((((_local5 + blockSize)) < _local3) ? blockSize : (_local3 - _local5));
            _local7 = 0;
            while (_local7 < _local6) {
                _arg1[(_local5 + _local7)] = (_arg1[(_local5 + _local7)] ^ _arg2[_local7]);
                _local7++;
            }
            _arg2.position = 0;
            _arg2.writeBytes(_local4);
            _local5 = (_local5 + blockSize);
        }
    }

    public function toString():String {
        return ((key.toString() + "-ofb"));
    }

}
}//package com.hurlant.crypto.symmetric

