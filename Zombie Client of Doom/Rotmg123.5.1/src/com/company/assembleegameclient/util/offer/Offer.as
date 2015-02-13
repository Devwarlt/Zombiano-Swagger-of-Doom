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

//com.company.assembleegameclient.util.offer.Offer

package com.company.assembleegameclient.util.offer{
    public class Offer {

        public var id_:String;
        public var price_:Number;
        public var realmGold_:int;
        public var jwt_:String;
        public var data_:String;
        public var currency_:String;
        public var tagline:String;
        public var bonus:int;

        public function Offer(_arg1:String, _arg2:Number, _arg3:int, _arg4:String, _arg5:String, _arg6:String=null):void{
            this.id_ = _arg1;
            this.price_ = _arg2;
            this.realmGold_ = _arg3;
            this.jwt_ = _arg4;
            this.data_ = _arg5;
            this.currency_ = (((_arg6)!=null) ? _arg6 : "USD");
        }
    }
}//package com.company.assembleegameclient.util.offer

