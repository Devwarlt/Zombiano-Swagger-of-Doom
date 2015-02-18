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
 * Created by Fabian on 24.01.2015.
 */
package Achievements {
import _05R_.GTween;

import com.company.assembleegameclient.game.GameSprite;
import com.company.ui.SimpleText;

import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.display.GradientType;
import flash.display.Sprite;
import flash.errors.IllegalOperationError;
import flash.events.Event;
import flash.events.TimerEvent;
import flash.geom.Matrix;
import flash.utils.Timer;
import flash.utils.getTimer;

public class Achievement extends Sprite {

    [Embed(source="1422120678_Medal.png")]
    protected static var acIcon:Class;

    protected static const WIDTH:int = 350;
    protected static const HEIGHT:int = 100;

    public static var CurrentAchievements:Vector.<Achievement> = new Vector.<Achievement>();
    public static var currentAchievement:Achievement;

    protected var gs_:GameSprite;
    protected var oldTime:int = -1;

    private var title:String;
    private var desc:String;

    function Achievement(gameSprite:GameSprite, title:String, desc:String) {
        this.gs_ = gameSprite;
        this.title = title;
        this.desc = desc;
        this.addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        this.y = -(HEIGHT + 1);
        this.x = 1; //x: 1 because the border is 2 so 2 / 2 is 1;

        if(this.gs_.map_.stage != null) {
            if (currentAchievement == null) {
                currentAchievement = this;
                this.gs_.map_.stage.addChild(this);
                init();
            }
            else {
                CurrentAchievements.push(this);
            }
        }
        else {
            CurrentAchievements = new Vector.<Achievement>();
            currentAchievement = null;
        }
    }

    protected function init():void {
        var ic:Bitmap = new acIcon();
        ic.x = 2;
        ic.y = (HEIGHT / 2) - (ic.height / 2);
        addChild(ic);

        var text:SimpleText = new SimpleText(20, 0xffffff);
        text.boldText(true);
        text.text = title;
        text.x = 100;
        text.y = 2;
        text.updateMetrics();
        addChild(text);

        var descText:SimpleText = new SimpleText(16, 0xffffff, false, 250);
        descText.multiline = true;
        descText.wordWrap = true;
        descText.text = desc;
        descText.x = 100;
        descText.y = 2 + text.height;
        descText.updateMetrics();
        addChild(descText);

        fadeIn();
    }

    protected function fadeIn():void {
        new GTween(this, 0.5, { "y": 1 }); //Y: 1 because the border is 2 so 2 / 2 is 1;
        var timer:Timer = new Timer(5 * 1000, 1);
        timer.addEventListener(TimerEvent.TIMER_COMPLETE, this.fadeOut);
        timer.start();
    }

    private function fadeOut(event:TimerEvent):void {
        var gTween:GTween = new GTween(this, 0.5, { "y": -(HEIGHT - 1) });
        gTween.onComplete = function(tween:GTween):void {
            parent.removeChild(tween.target as DisplayObject);
        }
    }

    protected function onAddedToStage(event:Event):void {
        this.addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
        this.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    protected function onEnterFrame(event:Event):void {
        var time:int;
        if ((time = ((getTimer() / 10) % 360)) != oldTime) {
            graphics.clear();

            graphics.beginFill(0x000000, 1.0);
            graphics.drawRect(0, 0, 350, 100);
            graphics.endFill();

            var gradientMatrix:Matrix = new Matrix();
            gradientMatrix.createGradientBox(350, 100, (Math.PI / 180) * time, 0, 0);
            graphics.lineStyle(2);
            graphics.lineGradientStyle(GradientType.LINEAR, [0xFF0000, 0x00FF00, 0x0000FF], [1.0, 1.0, 1.0], [0, 127, 255], gradientMatrix);
            graphics.drawRect(0, 0, 350, 100);
            graphics.endFill();
        }
    }

    protected function onRemovedFromStage(event:Event):void {
        if(this.gs_.map_.stage != null) {
            var nextAchievement:Achievement;
            if ((nextAchievement = CurrentAchievements.shift()) != null) {
                currentAchievement = nextAchievement;
                this.gs_.map_.stage.addChild(nextAchievement);
                nextAchievement.init();
            }
            else {
                currentAchievement = null;
            }
        }
        else {
            CurrentAchievements = new Vector.<Achievement>();
            currentAchievement = null;
        }
    }
}
}
