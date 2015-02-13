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

//com.hurlant.util.der.UTCTime

package com.hurlant.util.der{
    import flash.utils.ByteArray;

    public class UTCTime implements IAsn1Type {

        protected var type:uint;
        protected var len:uint;
        public var date:Date;

        public function UTCTime(_arg1:uint, _arg2:uint){
            this.type = _arg1;
            this.len = _arg2;
        }
        public function getLength():uint{
            return (this.len);
        }
        public function getType():uint{
            return (this.type);
        }
        public function setUTCTime(_arg1:String):void{
            var _local2:uint = parseInt(_arg1.substr(0, 2));
            if (_local2 < 50)
            {
                _local2 = (_local2 + 2000);
            } else
            {
                _local2 = (_local2 + 1900);
            }
            var _local3:uint = parseInt(_arg1.substr(2, 2));
            var _local4:uint = parseInt(_arg1.substr(4, 2));
            var _local5:uint = parseInt(_arg1.substr(6, 2));
            var _local6:uint = parseInt(_arg1.substr(8, 2));
            this.date = new Date(_local2, (_local3 - 1), _local4, _local5, _local6);
        }
        public function toString():String{
            return ((((((((DER.indent + "UTCTime[") + this.type) + "][") + this.len) + "][") + this.date) + "]"));
        }
        public function toDER():ByteArray{
            return (null);
        }

    }
}//package com.hurlant.util.der

