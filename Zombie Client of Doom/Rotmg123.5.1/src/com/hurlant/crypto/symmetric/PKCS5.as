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

//com.hurlant.crypto.symmetric.PKCS5

package com.hurlant.crypto.symmetric {
import flash.utils.ByteArray;

public class PKCS5 implements IPad {

    private var blockSize:uint;

    public function PKCS5(_arg1:uint = 0) {
        this.blockSize = _arg1;
    }

    public function pad(_arg1:ByteArray):void {
        var _local2:uint = (this.blockSize - (_arg1.length % this.blockSize));
        var _local3:uint;
        while (_local3 < _local2) {
            _arg1[_arg1.length] = _local2;
            _local3++;
        }
    }

    public function unpad(_arg1:ByteArray):void {
        var _local4:uint;
        var _local2:uint = (_arg1.length % this.blockSize);
        if (_local2 != 0) {
            throw (new Error("PKCS#5::unpad: ByteArray.length isn't a multiple of the blockSize"));
        }
        _local2 = _arg1[(_arg1.length - 1)];
        while (_local2 > 0) {
            _local4 = _arg1[(_arg1.length - 1)];
            _arg1.length--;
            if (_local2 != _local4) {
                throw (new Error((((("PKCS#5:unpad: Invalid padding value. expected [" + _local2) + "], found [") + _local4) + "]")));
            }
            _local2--;
        }
    }

    public function setBlockSize(_arg1:uint):void {
        this.blockSize = _arg1;
    }

}
}//package com.hurlant.crypto.symmetric

