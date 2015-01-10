/**
 * Created by Fabian on 31.12.2014. #Rip Last file 2k14
 */
package com.company.assembleegameclient.game {
import com.company.ui.SimpleText;

import flash.display.Sprite;
import flash.events.TimerEvent;
import flash.filters.DropShadowFilter;
import flash.sampler.getSavedThis;
import flash.text.TextFieldAutoSize;
import flash.utils.Timer;

public class InteractiveAction extends Sprite {

    private var text:SimpleText;
    private static var timer:Timer;
    private static var frame:Number = 1.0;
    private static var grow:Boolean = false;
    private static var obj:InteractiveAction;

    public function InteractiveAction(text:String) {
        if (text == null || text == "") return;
        obj = this;
        this.text = new SimpleText(26, 0xffffff, false, 600);
        this.text.boldText(true);
        this.text.htmlText = '<p align="center">' + text + "</p>";
        this.text.wordWrap = true;
        this.text.multiline = true;
        this.text.autoSize = TextFieldAutoSize.CENTER;
        this.text.filters = [new DropShadowFilter(0, 0, 0, 1.0, 2.0, 2.0, 5.0)];
        addChild(this.text);

        if (!timer) {
            timer = new Timer(0.5, int.MAX_VALUE);
            timer.addEventListener(TimerEvent.TIMER, onTick);
            timer.start();
        }
    }

    private static function onTick(event:TimerEvent):void {
        if(!obj || !obj.text) return;

        if (timer.currentCount > int.MAX_VALUE - 100) {
            timer.reset();
            timer.start();
        }

        if(frame <= 0.9 && !grow) grow = true;
        else if(frame >= 1.0 && grow) grow = false;

        frame = frame + (grow ? 0.002 : -0.002);
        obj.text.scaleX = obj.text.scaleY = frame;

        obj.text.x = (600 / 2) - (obj.width / 2);
    }

    public function isEqualTo(text:String):Boolean {
        if(!this.text) return false;
        return this.text.text == text;
    }
}
}
