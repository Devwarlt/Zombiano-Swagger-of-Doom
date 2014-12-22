// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.hurlant.util.der.ByteString

package com.hurlant.util.der {
import com.hurlant.util.Hex;

import flash.utils.ByteArray;

public class ByteString extends ByteArray implements IAsn1Type {

    public function ByteString(_arg1:uint = 4, _arg2:uint = 0) {
        this.type = _arg1;
        this.len = _arg2;
    }
    private var type:uint;
    private var len:uint;

    override public function toString():String {
        return ((((((((DER.indent + "ByteString[") + this.type) + "][") + this.len) + "][") + Hex.fromArray(this)) + "]"));
    }

    public function getLength():uint {
        return (this.len);
    }

    public function getType():uint {
        return (this.type);
    }

    public function toDER():ByteArray {
        return (DER.wrapDER(this.type, this));
    }

}
}//package com.hurlant.util.der

