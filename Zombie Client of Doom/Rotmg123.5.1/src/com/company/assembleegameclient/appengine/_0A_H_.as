// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.appengine._0A_H_

package com.company.assembleegameclient.appengine {
import com.company.assembleegameclient.util.RankUtils;

public class _0A_H_ {

    public function _0A_H_(_arg1:XML) {
        this._0L_u = _arg1;
    }
    public var _0L_u:XML;

    public function _bI_():int {
        return (this._0L_u.BestLevel);
    }

    public function _0D_E_():int {
        return (this._0L_u.BestFame);
    }

    public function _lr():int {
        return (RankUtils._lr(int(this._0L_u.BestFame)));
    }

}
}//package com.company.assembleegameclient.appengine

