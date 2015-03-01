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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// either expressed or implied, of the FreeBSD Project.// either expressed or implied, of the FreeBSD Project.

/**
 * Created by Fabian on 04.01.2015.
 */
package com.company.assembleegameclient.game.menu {
import AccountManagement.ui.FancyTextButton;

import Language.LanguageManager;

import OptionsStuff.Options;

import _05R_.GTween;

import com.company.assembleegameclient.game.GameSprite;
import com.company.ui.SimpleText;
import com.company.util.Keys;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.system.fscommand;
import flash.text.TextFieldAutoSize;

public class PauseMenu extends Sprite {

    [Embed(source="PauseMenuBackground.png")]
    public static var backgroundImage:Class;

    public static const BUTTON_WIDTH:int = 200;

    private var gs:GameSprite;
    private var storage:Object =
    {
        "nextButtonHeight": 100,
        "completed": false,
        "addButtons": new Vector.<FancyTextButton>(),
        "removeButtons": new Vector.<FancyTextButton>(),
        "buttons": new Vector.<FancyTextButton>()
    };

    public function PauseMenu(gs:GameSprite) {
        this.gs = gs;
        this.name = "PauseMenu";
        addChild(new backgroundImage());

        var title:SimpleText = new SimpleText(46, 0xffffff, false, 470, 0);
        title.y = 10;
        title.boldText(true);
        title.htmlText = '<p align="center">' + LanguageManager.manager.getValue("game.Paused") + '</p>';
        title.autoSize = TextFieldAutoSize.CENTER;
        addChild(title);

        this.addButton("Resume", MouseEvent.CLICK, function (event:MouseEvent):void {
            if (storage["completed"]) {
                var tween:GTween = new GTween(storage["removeButtons"].shift(), 0.2, {"x": -(BUTTON_WIDTH + 2 )});
                tween.onComplete = fadeNext;
            }
        });
        this.addButton("Options", MouseEvent.CLICK, function (event:MouseEvent):void {
            for each (var i:FancyTextButton in storage["buttons"]) {
                i.enabled(false);
            }
            var options:Options = new Options(gs);
            options.x = 800 - Options.WIDTH;
            options.y = 600 - Options.HEIGHT;
            options.addEventListener(Event.REMOVED_FROM_STAGE, function (e:Event):void {
                for each (var i:FancyTextButton in storage["buttons"]) {
                    i.enabled(true);
                }
            });
            addChild(options);
        });
        this.addButton("Back to Home", MouseEvent.CLICK, function (event:MouseEvent):void {
            gs.dispatchEvent(new Event(Event.COMPLETE));
        });
        this.addButton("Quit", MouseEvent.CLICK, function (event:MouseEvent):void {
            fscommand("quit");
        });

        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }

    private function addButton(text:String, eventType:String = null, listener:Function = null):void {
        var btn:FancyTextButton = new FancyTextButton(26, text, BUTTON_WIDTH);
        btn.boldText(true);
        btn.x = -BUTTON_WIDTH;
        btn.y = storage["nextButtonHeight"];
        if (eventType && listener) btn.addEventListener(eventType, listener);
        addChild(btn);
        this.storage["addButtons"].push(btn);
        this.storage["buttons"].push(btn);
        this.storage["nextButtonHeight"] += 50;
    }

    private function onAddedToStage(event:Event):void {
        stage.addEventListener(KeyboardEvent.KEY_DOWN, this.onKeyDown);
        var btn:FancyTextButton = this.storage["addButtons"].shift();
        var tween:GTween = new GTween(btn, 0.2, {"x": 20});
        this.storage["removeButtons"].push(btn);
        tween.onComplete = fadeNext;
    }

    private function fadeNext(tween:GTween):void {
        if (this.storage["addButtons"].length != 0) {
            var btn:FancyTextButton = this.storage["addButtons"].shift();
            tween = new GTween(btn, 0.2, {"x": 20});
            if (this.storage["addButtons"].length != 0)
                tween.onComplete = fadeNext;
            else
                this.storage["completed"] = true;
            this.storage["removeButtons"].push(btn);
        }
        else if (this.storage["removeButtons"].length != 0) {
            tween = new GTween(this.storage["removeButtons"].shift(), 0.2, {"x": -(BUTTON_WIDTH + 2 )});
            tween.onComplete = fadeNext;
        }
        else {
            dispatchEvent(new Event(Event.COMPLETE));
        }
    }

    private function onKeyDown(event:KeyboardEvent):void {
        switch (event.keyCode) {
            case Keys.J:
                if (this.storage["completed"]) {
                    var tween:GTween = new GTween(this.storage["removeButtons"].shift(), 0.2, {"x": -(BUTTON_WIDTH + 2 )});
                    tween.onComplete = fadeNext;
                    this.storage["completed"] = false;
                }
                break;
        }
    }

    private function onRemovedFromStage(event:Event):void {
        stage.removeEventListener(KeyboardEvent.KEY_DOWN, this.onKeyDown);
        removeEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        removeEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }
}
}
