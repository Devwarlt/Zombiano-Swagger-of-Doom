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

//com.hurlant.util.der.Integer

package com.hurlant.util.der{
    import com.hurlant.math._03Q_;
    import flash.utils.ByteArray;

    public class Integer extends _03Q_ implements IAsn1Type {

        private var type:uint;
        private var len:uint;

        public function Integer(_arg1:uint, _arg2:uint, _arg3:ByteArray){
            this.type = _arg1;
            this.len = _arg2;
            super(_arg3);
        }
        public function getLength():uint{
            return (this.len);
        }
        public function getType():uint{
            return (this.type);
        }
        override public function toString(_arg1:Number=0):String{
            return ((((((((DER.indent + "Integer[") + this.type) + "][") + this.len) + "][") + super.toString(16)) + "]"));
        }
        public function toDER():ByteArray{
            return (null);
        }

    }
}//package com.hurlant.util.der

