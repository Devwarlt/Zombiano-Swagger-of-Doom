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

//com.hurlant.crypto.hash.SHABase

package com.hurlant.crypto.hash{
    import flash.utils.Endian;
    import flash.utils.ByteArray;

    public class SHABase implements IHash {

        public var pad_size:int = 40;

        public function getInputSize():uint{
            return (64);
        }
        public function getHashSize():uint{
            return (0);
        }
        public function getPadSize():int{
            return (this.pad_size);
        }
        public function hash(_arg1:ByteArray):ByteArray{
            var _local2:uint = _arg1.length;
            var _local3:String = _arg1.endian;
            _arg1.endian = Endian.BIG_ENDIAN;
            var _local4:uint = (_local2 * 8);
            while ((_arg1.length % 4) != 0)
            {
                _arg1[_arg1.length] = 0;
            }
            _arg1.position = 0;
            var _local5:Array = [];
            var _local6:uint;
            while (_local6 < _arg1.length)
            {
                _local5.push(_arg1.readUnsignedInt());
                _local6 = (_local6 + 4);
            }
            var _local7:Array = this.core(_local5, _local4);
            var _local8:ByteArray = new ByteArray();
            var _local9:uint = (this.getHashSize() / 4);
            _local6 = 0;
            while (_local6 < _local9)
            {
                _local8.writeUnsignedInt(_local7[_local6]);
                _local6++;
            }
            _arg1.length = _local2;
            _arg1.endian = _local3;
            return (_local8);
        }
        protected function core(_arg1:Array, _arg2:uint):Array{
            return (null);
        }
        public function toString():String{
            return ("sha");
        }

    }
}//package com.hurlant.crypto.hash

