// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_01H_._6z

package _01H_{
    import _qN_._px;
    import _qN_.Account;
    import com.company.assembleegameclient.appengine.WebRequest;
    import com.company.assembleegameclient.parameters.Parameters;
    import _zo._8C_;
    import _zo._mS_;
    import _0L_C_._qM_;
    import flash.events.Event;

    public class _6z extends _px {

        private static const _1M_:String = "[ ERROR ] - Received a success response from the GAE server indicating the purchaseOffer request did complete without a problem.";
        private static const _0E_1:String = "[ INFO ] - Received a MicroTxnAuth response from the Steam GameOverlay. The response values are the following:\n\tAppID: ${appID}\n\tOrderID: ${orderID}\n\tIsAuthorized: ${isAuthorized}";
        private static const _A_Z_:String = "[ INFO ] - Received a successful response from the GAE server indicating the finalizePurchase request completed without a problem.";
        private static const _0A_O_:String = "[ ERROR ] - Received a failed response from the GAE server indicating the finalizePurchase request did not complete without a problem.";

        override public function execute():void{
            var _local1:_f7 = (Account._get() as _f7);
            var _local2:WebRequest = new WebRequest(Parameters._fK_(), "/steamworks", true, 2);
            _local2.addEventListener(_8C_.GENERIC_DATA, this._dW_);
            _local2.addEventListener(_mS_.TEXT_ERROR, this._sB_);
            _local2.sendRequest("purchaseOffer", {
                "steamid":_local1._Z_d.getSteamID(),
                "data":offer.data_
            });
        }
        private function _dW_(_arg1:_8C_):void{
            var _local2:_f7 = (Account._get() as _f7);
            _local2._Z_d.addEventListener("STEAM_MICRO_TXN_AUTH", this._P__);
        }
        private function _P__(_arg1:*):void{
            var _local2:_f7 = (Account._get() as _f7);
            var _local3:uint = uint(_arg1.appID);
            var _local4:String = String(_arg1.orderID);
            var _local5:Boolean = Boolean(_arg1.isAuthorized);
            var _local6:String = _0E_1;
            _local6 = _local6.replace("${appID}", _local3);
            _local6 = _local6.replace("${orderID}", _local4);
            _local6 = _local6.replace("${isAuthorized}", _local5);
            _local2._Z_d.removeEventListener("STEAM_MICRO_TXN_AUTH", this._P__);
            var _local7:WebRequest = new WebRequest(Parameters._fK_(), "/steamworks", true, 2);
            _local7.addEventListener(_8C_.GENERIC_DATA, this._dT_);
            _local7.addEventListener(_mS_.TEXT_ERROR, this._O_X_);
            _local7.sendRequest("finalizePurchase", {
                "appid":_local3,
                "orderid":_local4,
                "authorized":((_local5) ? 1 : 0)
            });
        }
        private function _dT_(_arg1:_8C_):void{
            this._D_(null);
        }
        private function _O_X_(_arg1:_mS_):void{
            var _local2:_f7 = (Account._get() as _f7);
            _local2._cd.addChild(new _qM_(("Error: " + _arg1.text_)));
            this._D_(null);
        }
        private function _sB_(_arg1:_mS_):void{
            var _local2:_f7 = (Account._get() as _f7);
            _local2._cd.addChild(new _qM_(("Error: " + _arg1.text_)));
            this._D_(null);
        }
        private function _D_(_arg1:Object):void{
            if (mediator)
            {
                mediator.dispatchEvent(new Event(Event.COMPLETE));
            }
        }

    }
}//package _01H_

