// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0M_m._0E_v

package _0M_m{
    import com.company.assembleegameclient.util.offer.Offers;
    import _sp._aJ_;
    import com.company.assembleegameclient.util.offer.Offer;
    import com.company.assembleegameclient.appengine._02k;
    import WebRequestEvents.WebRequestSuccessEvent;
    import _qN_.Account;
    import _01H_._f7;
    import _Z_h._m7;
    import _0B_2._1T_;
    import _00g.WebAccount;

    public class _0E_v implements _j5 {

        private static const _Q_3:int = 2600;

        private var _0J_E_:Offers;
        private var _U_k:_aJ_;
        private var _Z_r:Offer;

        public function _002():void{
            _02k._U_t(this._E_A_(), this._y6);
        }
        public function _U_t():Offers{
            return (this._0J_E_);
        }
        public function get _Z_8():_aJ_{
            return ((this._U_k = ((this._U_k) || (new _aJ_()))));
        }
        private function _y6(_arg1:WebRequestSuccessEvent):void{
            this._0J_E_ = new Offers(XML(_arg1.data_));
            this._Z_8.dispatch();
        }
        private function _E_A_():String{
            switch (Account._get().gameNetwork())
            {
                case _f7._000:
                    return ("/steamworks");
                case _m7._000:
                    return ("/kongregate");
                case _1T_._000:
                case WebAccount.GAME_NETWORK:
                default:
                    return ("/credits");
            }
        }

    }
}//package _0M_m

