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

//com.hurlant.crypto.hash.MAC

package com.hurlant.crypto.hash{
    import flash.utils.ByteArray;

    public class MAC implements IHMAC {

        private var hash:IHash;
        private var bits:uint;
        private var pad_1:ByteArray;
        private var pad_2:ByteArray;
        private var innerHash:ByteArray;
        private var outerHash:ByteArray;
        private var outerKey:ByteArray;
        private var innerKey:ByteArray;

        public function MAC(_arg1:IHash, _arg2:uint=0){
            var _local3:int;
            var _local4:int;
            super();
            this.hash = _arg1;
            this.bits = _arg2;
            this.innerHash = new ByteArray();
            this.outerHash = new ByteArray();
            this.innerKey = new ByteArray();
            this.outerKey = new ByteArray();
            if (_arg1 != null)
            {
                _local3 = _arg1.getPadSize();
                this.pad_1 = new ByteArray();
                this.pad_2 = new ByteArray();
                _local4 = 0;
                while (_local4 < _local3)
                {
                    this.pad_1.writeByte(54);
                    this.pad_2.writeByte(92);
                    _local4++;
                }
            }
        }
        public function setPadSize(_arg1:int):void{
        }
        public function getHashSize():uint{
            if (this.bits != 0)
            {
                return ((this.bits / 8));
            }
            return (this.hash.getHashSize());
        }
        public function compute(_arg1:ByteArray, _arg2:ByteArray):ByteArray{
            var _local3:int;
            var _local4:int;
            if (this.pad_1 == null)
            {
                _local3 = this.hash.getPadSize();
                this.pad_1 = new ByteArray();
                this.pad_2 = new ByteArray();
                _local4 = 0;
                while (_local4 < _local3)
                {
                    this.pad_1.writeByte(54);
                    this.pad_2.writeByte(92);
                    _local4++;
                }
            }
            this.innerKey.length = 0;
            this.outerKey.length = 0;
            this.innerKey.writeBytes(_arg1);
            this.innerKey.writeBytes(this.pad_1);
            this.innerKey.writeBytes(_arg2);
            this.innerHash = this.hash.hash(this.innerKey);
            this.outerKey.writeBytes(_arg1);
            this.outerKey.writeBytes(this.pad_2);
            this.outerKey.writeBytes(this.innerHash);
            this.outerHash = this.hash.hash(this.outerKey);
            if ((((this.bits > 0)) && ((this.bits < (8 * this.outerHash.length)))))
            {
                this.outerHash.length = (this.bits / 8);
            }
            return (this.outerHash);
        }
        public function dispose():void{
            this.hash = null;
            this.bits = 0;
        }
        public function toString():String{
            return ((("mac-" + (((this.bits > 0)) ? (this.bits + "-") : "")) + this.hash.toString()));
        }

    }
}//package com.hurlant.crypto.hash

