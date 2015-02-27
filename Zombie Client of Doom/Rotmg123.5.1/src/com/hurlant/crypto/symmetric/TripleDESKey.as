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

//com.hurlant.crypto.symmetric.TripleDESKey

package com.hurlant.crypto.symmetric {
import flash.utils.ByteArray;

import com.hurlant.util.Memory;

public class TripleDESKey extends DESKey {

    protected var encKey2:Array;
    protected var encKey3:Array;
    protected var decKey2:Array;
    protected var decKey3:Array;

    public function TripleDESKey(_arg1:ByteArray) {
        super(_arg1);
        this.encKey2 = generateWorkingKey(false, _arg1, 8);
        this.decKey2 = generateWorkingKey(true, _arg1, 8);
        if (_arg1.length > 16) {
            this.encKey3 = generateWorkingKey(true, _arg1, 16);
            this.decKey3 = generateWorkingKey(false, _arg1, 16);
        } else {
            this.encKey3 = encKey;
            this.decKey3 = decKey;
        }
    }

    override public function dispose():void {
        super.dispose();
        var _local1:uint;
        if (this.encKey2 != null) {
            _local1 = 0;
            while (_local1 < this.encKey2.length) {
                this.encKey2[_local1] = 0;
                _local1++;
            }
            this.encKey2 = null;
        }
        if (this.encKey3 != null) {
            _local1 = 0;
            while (_local1 < this.encKey3.length) {
                this.encKey3[_local1] = 0;
                _local1++;
            }
            this.encKey3 = null;
        }
        if (this.decKey2 != null) {
            _local1 = 0;
            while (_local1 < this.decKey2.length) {
                this.decKey2[_local1] = 0;
                _local1++;
            }
            this.decKey2 = null;
        }
        if (this.decKey3 != null) {
            _local1 = 0;
            while (_local1 < this.decKey3.length) {
                this.decKey3[_local1] = 0;
                _local1++;
            }
            this.decKey3 = null;
        }
        Memory.gc();
    }

    override public function encrypt(_arg1:ByteArray, _arg2:uint = 0):void {
        desFunc(encKey, _arg1, _arg2, _arg1, _arg2);
        desFunc(this.encKey2, _arg1, _arg2, _arg1, _arg2);
        desFunc(this.encKey3, _arg1, _arg2, _arg1, _arg2);
    }

    override public function decrypt(_arg1:ByteArray, _arg2:uint = 0):void {
        desFunc(this.decKey3, _arg1, _arg2, _arg1, _arg2);
        desFunc(this.decKey2, _arg1, _arg2, _arg1, _arg2);
        desFunc(decKey, _arg1, _arg2, _arg1, _arg2);
    }

    override public function toString():String {
        return ("3des");
    }

}
}//package com.hurlant.crypto.symmetric

