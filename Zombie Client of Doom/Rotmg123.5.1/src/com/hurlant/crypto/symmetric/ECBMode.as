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

//com.hurlant.crypto.symmetric.ECBMode

package com.hurlant.crypto.symmetric {
import flash.utils.ByteArray;

import com.hurlant.util.Memory;

public class ECBMode implements IMode, ICipher {

    private var key:ISymmetricKey;
    private var padding:IPad;

    public function ECBMode(_arg1:ISymmetricKey, _arg2:IPad = null) {
        this.key = _arg1;
        if (_arg2 == null) {
            _arg2 = new PKCS5(_arg1.getBlockSize());
        } else {
            _arg2.setBlockSize(_arg1.getBlockSize());
        }
        this.padding = _arg2;
    }

    public function getBlockSize():uint {
        return (this.key.getBlockSize());
    }

    public function encrypt(_arg1:ByteArray):void {
        this.padding.pad(_arg1);
        _arg1.position = 0;
        var _local2:uint = this.key.getBlockSize();
        var _local3:ByteArray = new ByteArray();
        var _local4:ByteArray = new ByteArray();
        var _local5:uint;
        while (_local5 < _arg1.length) {
            _local3.length = 0;
            _arg1.readBytes(_local3, 0, _local2);
            this.key.encrypt(_local3);
            _local4.writeBytes(_local3);
            _local5 = (_local5 + _local2);
        }
        _arg1.length = 0;
        _arg1.writeBytes(_local4);
    }

    public function decrypt(_arg1:ByteArray):void {
        _arg1.position = 0;
        var _local2:uint = this.key.getBlockSize();
        if ((_arg1.length % _local2) != 0) {
            throw (new Error(("ECB mode cipher length must be a multiple of blocksize " + _local2)));
        }
        var _local3:ByteArray = new ByteArray();
        var _local4:ByteArray = new ByteArray();
        var _local5:uint;
        while (_local5 < _arg1.length) {
            _local3.length = 0;
            _arg1.readBytes(_local3, 0, _local2);
            this.key.decrypt(_local3);
            _local4.writeBytes(_local3);
            _local5 = (_local5 + _local2);
        }
        this.padding.unpad(_local4);
        _arg1.length = 0;
        _arg1.writeBytes(_local4);
    }

    public function dispose():void {
        this.key.dispose();
        this.key = null;
        this.padding = null;
        Memory.gc();
    }

    public function toString():String {
        return ((this.key.toString() + "-ecb"));
    }

}
}//package com.hurlant.crypto.symmetric

