﻿// Copyright (c) 2015, FireBite/Aceticsoft Studios Inc.
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

//com.hurlant.util.der.Sequence

package com.hurlant.util.der{
    import flash.utils.ByteArray;

    public dynamic class Sequence extends Array implements IAsn1Type {

        protected var type:uint;
        protected var len:uint;

        public function Sequence(_arg1:uint=48, _arg2:uint=0){
            this.type = _arg1;
            this.len = _arg2;
        }
        public function getLength():uint{
            return (this.len);
        }
        public function getType():uint{
            return (this.type);
        }
        public function toDER():ByteArray{
            var _local3:IAsn1Type;
            var _local1:ByteArray = new ByteArray();
            var _local2:int;
            while (_local2 < length)
            {
                _local3 = this[_local2];
                if (_local3 == null)
                {
                    _local1.writeByte(5);
                    _local1.writeByte(0);
                } else
                {
                    _local1.writeBytes(_local3.toDER());
                }
                _local2++;
            }
            return (DER.wrapDER(this.type, _local1));
        }
        public function toString():String{
            var _local4:Boolean;
            var _local5:String;
            var _local1:String = DER.indent;
            DER.indent = (DER.indent + "    ");
            var _local2 = "";
            var _local3:int;
            while (_local3 < length)
            {
                if (this[_local3] != null)
                {
                    _local4 = false;
                    for (_local5 in this)
                    {
                        if (((!((_local3.toString() == _local5))) && ((this[_local3] == this[_local5]))))
                        {
                            _local2 = (_local2 + (((_local5 + ": ") + this[_local3]) + "\n"));
                            _local4 = true;
                            break;
                        }
                    }
                    if (!_local4)
                    {
                        _local2 = (_local2 + (this[_local3] + "\n"));
                    }
                }
                _local3++;
            }
            DER.indent = _local1;
            return ((((((((((DER.indent + "Sequence[") + this.type) + "][") + this.len) + "][\n") + _local2) + "\n") + _local1) + "]"));
        }
        public function findAttributeValue(_arg1:String):IAsn1Type{
            var _local2:*;
            var _local3:*;
            var _local4:*;
            var _local5:ObjectIdentifier;
            for each (_local2 in this)
            {
                if ((_local2 is Set))
                {
                    _local3 = _local2[0];
                    if ((_local3 is Sequence))
                    {
                        _local4 = _local3[0];
                        if ((_local4 is ObjectIdentifier))
                        {
                            _local5 = (_local4 as ObjectIdentifier);
                            if (_local5.toString() == _arg1)
                            {
                                return ((_local3[1] as IAsn1Type));
                            }
                        }
                    }
                }
            }
            return (null);
        }

    }
}//package com.hurlant.util.der

