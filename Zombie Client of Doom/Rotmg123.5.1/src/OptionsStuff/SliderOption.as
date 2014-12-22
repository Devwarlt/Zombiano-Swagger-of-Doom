/**
 * Created by Fabian on 14.12.2014.
 */
package OptionsStuff {

import com.company.assembleegameclient.parameters.Parameters;

import flash.events.Event;

public class SliderOption extends _0_i {

    public function SliderOption(_arg1:String, _arg4:String, _arg5:String, _arg6:Function) {
        super(_arg1, _arg4, _arg5);
        this.callback_ = _arg6;
        this.slider = new SliderBase(0);
        this.slider.setValue(Parameters.data_[_W_Y_] * 100);
        this.slider.addEventListener(Event.CHANGE, this._bR_);
        addChild(this.slider);
    }
    private var callback_:Function;
    private var slider:SliderBase;

    override public function refresh():void {
        this.slider.setValue(Parameters.data_[_W_Y_] * 100);
    }

    private function _bR_(_arg1:Event):void {
        Parameters.data_[_W_Y_] = this.slider.value * 0.01;
        Parameters.save();
        if (this.callback_ != null) {
            this.callback_();
        }
    }
}
}//package OptionsStuff

