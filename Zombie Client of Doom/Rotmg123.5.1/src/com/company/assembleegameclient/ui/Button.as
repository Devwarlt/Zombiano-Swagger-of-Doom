/**
 * Created by Fabian on 12.11.2014.
 */
package com.company.assembleegameclient.ui {
import _sp._aJ_;

import com.embeds.EmbeddedAssets_btnEmbed_;

import flash.display.Sprite;
import flash.events.MouseEvent;

public class Button extends Sprite {

    public static var _str2539:Class = EmbeddedAssets_btnEmbed_;

    public const event:_aJ_ = new _aJ_();

    public var disabled:Boolean = false;

    public function _str152() {
        addChild(new _str2539());
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
