// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0G_l._r4

package _0G_l {
import _0L_C_.DialogBox;

public class _r4 extends DialogBox {

    public function _r4(_arg1:String, _arg2:String) {
        super(((('Are you sure you want to delete "' + _arg1) + '"?  ') + "This can not be undone."), "Delete Picture", "Cancel", "Delete", "/deletePicture");
        this.id_ = _arg2;
    }
    public var id_:String;
}
}//package _0G_l

