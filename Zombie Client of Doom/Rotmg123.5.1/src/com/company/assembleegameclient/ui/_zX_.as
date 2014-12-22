// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.ui._zX_

package com.company.assembleegameclient.ui {
import Sounds.Music;
import Sounds._Q_P_;

import com.company.assembleegameclient.parameters.Parameters;
import com.company.util.AssetLibrary;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.filters.GlowFilter;

public class _zX_ extends Sprite {

    public function _zX_() {
        this.bitmap_ = new Bitmap();
        super();
        addChild(this.bitmap_);
        this.bitmap_.scaleX = 1;
        this.bitmap_.scaleY = 1;
        this._P_P_();
        addEventListener(MouseEvent.CLICK, this._iK_);
        filters = [new GlowFilter(0, 1, 4, 4, 2, 1)];
    }
    private var bitmap_:Bitmap;

    private function _P_P_():void {
        this.bitmap_.bitmapData = ((((Parameters.data_.playMusic) || (Parameters.data_.playSFX))) ? AssetLibrary._xK_("lofiInterfaceBig", 3) : AssetLibrary._xK_("lofiInterfaceBig", 4));
    }

    private function _iK_(_arg1:MouseEvent):void {
        var _local2 = !(((Parameters.data_.playMusic) || (Parameters.data_.playSFX)));
        Music._continue(_local2);
        _Q_P_._2c(_local2);
        Parameters.data_.playPewPew = _local2;
        Parameters.save();
        this._P_P_();
    }

}
}//package com.company.assembleegameclient.ui

