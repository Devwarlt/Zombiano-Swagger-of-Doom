/**
 * Created by Fabian on 12.11.2014.
 */
package com.company.assembleegameclient.ui {
import _sp._aJ_;

import com.embeds.EmbeddedAssets_btnEmbed_;

import flash.display.Sprite;
import flash.events.MouseEvent;

public class xButton extends Sprite {

    private static var buttonSprite:Class = EmbeddedAssets_btnEmbed_;
    public var event:_aJ_ = new _aJ_();
    public var disabled:Boolean = false;

    public function xButton() {
        addChild(new buttonSprite());
        buttonMode = true;
        addEventListener(MouseEvent.CLICK, this.onButtonClick);
    }

    public function disable():void {
        this.disabled = true;
        removeEventListener(MouseEvent.CLICK, this.onButtonClick);
    }

    private function onButtonClick(_arg1:MouseEvent):void {
        if (!this.disabled) {
            this.event.dispatch();
            removeEventListener(MouseEvent.CLICK, this.onButtonClick);
        }
    }
}
}
