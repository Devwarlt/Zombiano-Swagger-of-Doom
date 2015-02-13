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

//com.company.assembleegameclient.util._zR_

package com.company.assembleegameclient.util{

    import flash.net.URLVariables;
    import _qN_.Account;
    import com.company.assembleegameclient.parameters.Parameters;
    import com.company.assembleegameclient.util.offer.Offer;


    public class _zR_ {

        public static const _X__:Vector.<_zR_> = new <_zR_>[/*new (_zR_)("Google Checkout", "co", ""), */new _zR_("PayPal", "ps", "P3")/*, new (_zR_)("Credit Cards, etc.", "ps", "CH")*/];

        public var label_:String;
        public var _q:String;
        public var _iV_:String;

        public function _zR_(_arg1:String, _arg2:String, _arg3:String){
            this.label_ = _arg1;
            this._q = _arg2;
            this._iV_ = _arg3;
        }
        public static function _8N_(_arg1:String):_zR_{
            var _local2:_zR_;
            for each (_local2 in _X__)
            {
                if (_local2.label_ == _arg1)
                {
                    return (_local2);
                }
            }
            return (null);
        }

        public function _T_R_(_arg1:String, _arg2:String, _arg3:Offer):String{
            var _local4:URLVariables = new URLVariables();
            _local4["tok"] = _arg1;
            _local4["exp"] = _arg2;
            _local4["guid"] = Account._get().guid();
            _local4["provider"] = this._q;
            switch (this._q)
            {
                /*case "co":
                    _local4["jwt"] = _arg3.jwt_;
                    break;*/
                case "ps":
                    _local4["jwt"] = _arg3.jwt_;
                    _local4["price"] = _arg3.price_.toString();
                    _local4["paymentid"] = this._iV_;
                    break;
            }
            return (((("http://" + Parameters.getAccountServerIP()) + "/credits/add?") + _local4.toString()));
        }

    }
}//package com.company.assembleegameclient.util

