// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_Z_h._B_R_

package _Z_h{
    import _qN_._px;
    import _qN_.Account;

    public class _B_R_ extends _px {

        override public function execute():void{
            var _local1:Array = [{
                "identifier":offer.id_,
                "data":offer.data_
            }];
            var _local2:_m7 = (Account._get() as _m7);
            _local2._nq.mtx.purchaseItems(_local1, this._D_);
        }
        private function _D_(_arg1:Object):void{
            if (mediator)
            {
                mediator.complete();
            }
        }

    }
}//package _Z_h

