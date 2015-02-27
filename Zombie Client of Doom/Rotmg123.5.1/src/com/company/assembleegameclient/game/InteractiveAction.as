// Copyright (c) 2015, FireBite/Aceticsoft Studios Inc.
// All rights reserved.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
// ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

/**
 * Created by Fabian on 31.12.2014. #Rip Last file 2k14
 */
package com.company.assembleegameclient.game {
import com.company.ui.SimpleText;

import flash.display.Sprite;
import flash.events.TimerEvent;
import flash.filters.DropShadowFilter;
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
        if (!obj || !obj.text) return;

        if (timer.currentCount > int.MAX_VALUE - 100) {
            timer.reset();
            timer.start();
        }

        if (frame <= 0.9 && !grow) grow = true;
        else if (frame >= 1.0 && grow) grow = false;

        frame = frame + (grow ? 0.002 : -0.002);
        obj.text.scaleX = obj.text.scaleY = frame;

        obj.text.x = (600 / 2) - (obj.width / 2);
    }

    public function isEqualTo(text:String):Boolean {
        if (!this.text) return false;
        return this.text.text == text;
    }
}
}
