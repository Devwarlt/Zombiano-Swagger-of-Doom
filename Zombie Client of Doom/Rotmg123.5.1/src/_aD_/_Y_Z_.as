// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_aD_._Y_Z_

package _aD_{
    import _sp._aJ_;
    import com.company.assembleegameclient.util.offer.Offer;
    import _qN_.Account;
    import _Z_h._m7;
    import _Z_h.*;

    public class _Y_Z_ implements _09h {

        private var _0G_z:_aJ_;

        public function _U_Z_(_arg1:_sv):void{
            var _local2:Offer = _arg1.offer;
            var _local3:Array = [{
                "identifier":_local2.id_,
                "data":_local2.data_
            }];
            var _local4:_m7 = (Account._get() as _m7);
            _local4._nq.mtx.purchaseItems(_local3, this._D_);
        }
        private function _D_(_arg1:Object):void{
            this.complete.dispatch();
        }
        public function get complete():_aJ_{
            return ((this._0G_z = ((this._0G_z) || (new _aJ_()))));
        }

    }
}//package _aD_

