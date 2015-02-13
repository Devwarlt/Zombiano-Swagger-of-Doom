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

//com.company.assembleegameclient.net.messages.data.Item

package com.company.assembleegameclient.net.messages.data{
    import flash.utils.IDataInput;

    public class Item {

        public var item_:int;
        public var _01T_:int;
        public var _var:Boolean;
        public var included_:Boolean;

        public function parseFromInput(_arg1:IDataInput):void{
            this.item_ = _arg1.readInt();
            this._01T_ = _arg1.readInt();
            this._var = _arg1.readBoolean();
            this.included_ = _arg1.readBoolean();
        }
        public function toString():String{
            return (((((((("item: " + this.item_) + " slotType: ") + this._01T_) + " tradeable: ") + this._var) + " included:") + this.included_));
        }

    }
}//package com.company.assembleegameclient.net.messages.data

