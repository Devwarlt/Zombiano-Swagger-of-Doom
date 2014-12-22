// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//OptionsStuff.SwitchOption

package OptionsStuff {
import com.company.assembleegameclient.parameters.Parameters;

import flash.events.Event;

public class SwitchOption extends _0_i {

    public function SwitchOption(_arg1:String, _arg2:Vector.<String>, _arg3:Array, _arg4:String, _arg5:String, _arg6:Function) {
        super(_arg1, _arg4, _arg5);
        this.callback_ = _arg6;
        this._O_T_ = new _pw(_arg2, _arg3, Parameters.data_[_W_Y_]);
        this._O_T_.addEventListener(Event.CHANGE, this._bR_);
        addChild(this._O_T_);
    }
    private var callback_:Function;
    private var _O_T_:_pw;

    override public function refresh():void {
        this._O_T_.setValue(Parameters.data_[_W_Y_]);
    }

    private function _bR_(_arg1:Event):void {
        Parameters.data_[_W_Y_] = this._O_T_.value();
        Parameters.save();
        if (this.callback_ != null) {
            this.callback_();
        }
    }

}
}//package OptionsStuff

