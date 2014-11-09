// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_aD_._e3

package _aD_{
    import _sp._aJ_;
    import com.company.assembleegameclient.util.offer.Offer;
    import _qN_.Account;
    import _01H_._f7;
    import com.company.assembleegameclient.appengine._0B_u;
    import com.company.assembleegameclient.parameters.Parameters;
    import _zo._8C_;
    import _zo._mS_;
    import _0L_C_._qM_;
    import _01H_.*;

    public class _e3 implements _09h {

        private static const _1M_:String = "[ ERROR ] - Received a success response from the GAE server indicating the purchaseOffer request did complete without a problem.";
        private static const _0E_1:String = "[ INFO ] - Received a MicroTxnAuth response from the Steam GameOverlay. The response values are the following:\n\tAppID: ${appID}\n\tOrderID: ${orderID}\n\tIsAuthorized: ${isAuthorized}";
        private static const _A_Z_:String = "[ INFO ] - Received a successful response from the GAE server indicating the finalizePurchase request completed without a problem.";
        private static const _0A_O_:String = "[ ERROR ] - Received a failed response from the GAE server indicating the finalizePurchase request did not complete without a problem.";

        private var _0G_z:_aJ_;

        public function _U_Z_(_arg1:_sv):void{
            var _local2:Offer = _arg1.offer;
            var _local3:_f7 = (Account._get() as _f7);
            var _local4:_0B_u = new _0B_u(Parameters._fK_(), "/steamworks", true, 2);
            _local4.addEventListener(_8C_.GENERIC_DATA, this._dW_);
            _local4.addEventListener(_mS_.TEXT_ERROR, this._sB_);
            _local4.sendRequest("purchaseOffer", {
                "steamid":_local3._Z_d.getSteamID(),
                "data":_local2.data_
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
            var _local7:_0B_u = new _0B_u(Parameters._fK_(), "/steamworks", true, 2);
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
            this.complete.dispatch(true, "");
        }
        public function get complete():_aJ_{
            return ((this._0G_z = ((this._0G_z) || (new _aJ_()))));
        }

    }
}//package _aD_

