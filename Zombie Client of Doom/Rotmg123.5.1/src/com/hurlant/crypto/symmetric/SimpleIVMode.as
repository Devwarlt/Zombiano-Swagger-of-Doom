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

//com.hurlant.crypto.symmetric.SimpleIVMode

package com.hurlant.crypto.symmetric{
    import com.hurlant.util.Memory;
    import flash.utils.ByteArray;

    public class SimpleIVMode implements IMode, ICipher {

        protected var mode:IVMode;
        protected var cipher:ICipher;

        public function SimpleIVMode(_arg1:IVMode){
            this.mode = _arg1;
            this.cipher = (_arg1 as ICipher);
        }
        public function getBlockSize():uint{
            return (this.mode.getBlockSize());
        }
        public function dispose():void{
            this.mode.dispose();
            this.mode = null;
            this.cipher = null;
            Memory.gc();
        }
        public function encrypt(_arg1:ByteArray):void{
            this.cipher.encrypt(_arg1);
            var _local2:ByteArray = new ByteArray();
            _local2.writeBytes(this.mode.IV);
            _local2.writeBytes(_arg1);
            _arg1.position = 0;
            _arg1.writeBytes(_local2);
        }
        public function decrypt(_arg1:ByteArray):void{
            var _local2:ByteArray = new ByteArray();
            _local2.writeBytes(_arg1, 0, this.getBlockSize());
            this.mode.IV = _local2;
            _local2 = new ByteArray();
            _local2.writeBytes(_arg1, this.getBlockSize());
            this.cipher.decrypt(_local2);
            _arg1.length = 0;
            _arg1.writeBytes(_local2);
        }
        public function toString():String{
            return (("simple-" + this.cipher.toString()));
        }

    }
}//package com.hurlant.crypto.symmetric

