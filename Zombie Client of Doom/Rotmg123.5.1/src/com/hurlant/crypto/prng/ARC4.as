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

//com.hurlant.crypto.prng.ARC4

package com.hurlant.crypto.prng {
import com.hurlant.crypto.symmetric.IStreamCipher;

import flash.utils.ByteArray;

import com.hurlant.util.Memory;

public class ARC4 implements IPRNG, IStreamCipher {

    private const psize:uint = 0x0100;

    private var i:int = 0;
    private var j:int = 0;
    private var S:ByteArray;

    public function ARC4(_arg1:ByteArray = null) {
        this.S = new ByteArray();
        if (_arg1) {
            this.init(_arg1);
        }
    }

    public function getPoolSize():uint {
        return (this.psize);
    }

    public function init(_arg1:ByteArray):void {
        var _local2:int;
        var _local3:int;
        var _local4:int;
        _local2 = 0;
        while (_local2 < 0x0100) {
            this.S[_local2] = _local2;
            _local2++;
        }
        _local3 = 0;
        _local2 = 0;
        while (_local2 < 0x0100) {
            _local3 = (((_local3 + this.S[_local2]) + _arg1[(_local2 % _arg1.length)]) & 0xFF);
            _local4 = this.S[_local2];
            this.S[_local2] = this.S[_local3];
            this.S[_local3] = _local4;
            _local2++;
        }
        this.i = 0;
        this.j = 0;
    }

    public function next():uint {
        var _local1:int;
        this.i = ((this.i + 1) & 0xFF);
        this.j = ((this.j + this.S[this.i]) & 0xFF);
        _local1 = this.S[this.i];
        this.S[this.i] = this.S[this.j];
        this.S[this.j] = _local1;
        return (this.S[((_local1 + this.S[this.i]) & 0xFF)]);
    }

    public function getBlockSize():uint {
        return (1);
    }

    public function encrypt(_arg1:ByteArray):void {
        var _local2:uint;
        while (_local2 < _arg1.length) {
            var _local3 = _local2++;
            _arg1[_local3] = (_arg1[_local3] ^ this.next());
        }
    }

    public function decrypt(_arg1:ByteArray):void {
        this.encrypt(_arg1);
    }

    public function dispose():void {
        var _local1:uint;
        if (this.S != null) {
            _local1 = 0;
            while (_local1 < this.S.length) {
                this.S[_local1] = (Math.random() * 0x0100);
                _local1++;
            }
            this.S.length = 0;
            this.S = null;
        }
        this.i = 0;
        this.j = 0;
        Memory.gc();
    }

    public function toString():String {
        return ("rc4");
    }

}
}//package com.hurlant.crypto.prng

