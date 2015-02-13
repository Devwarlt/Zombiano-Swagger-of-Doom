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

//com.company.assembleegameclient.net.messages.data._0_3

package com.company.assembleegameclient.net.messages.data{
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;

    public class SlotObject {

        public var objectId_:int;
        public var slotId_:int;
        public var objectType_:int;

        public function parseFromInput(_arg1:IDataInput):void{
            this.objectId_ = _arg1.readInt();
            this.slotId_ = _arg1.readUnsignedByte();
            this.objectType_ = _arg1.readShort();
        }
        public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeInt(this.objectId_);
            _arg1.writeByte(this.slotId_);
            _arg1.writeShort(this.objectType_);
        }
        public function toString():String{
            return (((((("objectId_: " + this.objectId_) + " slotId_: ") + this.slotId_) + " objectType_: ") + this.objectType_));
        }

    }
}//package com.company.assembleegameclient.net.messages.data

