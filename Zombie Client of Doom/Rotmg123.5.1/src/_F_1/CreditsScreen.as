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

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_F_1._0H_h

package _F_1 {
import FireBite.Embeds.Images.FireBiteLogo;

import Sounds.LocalSounds;
import Sounds.Music;

import YouTube.YouTubePlayer;

import WebRequestEvents.WebRequestSuccessEvent;
import WebRequestEvents.WebRequestErrorEvent;

import com.company.assembleegameclient.appengine.WebRequest;

import com.company.assembleegameclient.parameters.Parameters;

import flash.display.Bitmap;

import flash.display.DisplayObject;
import flash.display.Shape;
import flash.display.Sprite;

import _sp.Signal;

import com.company.ui.SimpleText;
import com.company.rotmg.graphics.ScreenGraphic;

import flash.events.TimerEvent;
import flash.filters.DropShadowFilter;
import flash.events.MouseEvent;
import flash.filters.GlowFilter;
import flash.media.Sound;
import flash.media.SoundChannel;
import flash.media.SoundTransform;
import flash.net.navigateToURL;
import flash.net.URLRequest;
import flash.events.Event;
import flash.utils.Timer;
import flash.utils.getDefinitionByName;

public class CreditsScreen extends Sprite {
    FireBiteLogo;

    private static const _088:String = "http://www.wildshadow.com/";
    private static const _0L_O_:String = "http://www.kabam.com/";

    public var close:Signal;

    private var creditsXML:XML;
    private var _045:_H_o;
    private var displayScreen:Sprite;
    private var items:Vector.<DisplayObject>;
    private var totalHeight:Number;
    private var sound:SoundChannel;
    private var ytvid:YouTubePlayer;

    public function CreditsScreen() {
        this.close = new Signal();
        var webReq:WebRequest = new WebRequest(Parameters.getAccountServerIP(), "/credits", true);
        webReq.addEventListener(WebRequestSuccessEvent.GENERIC_DATA, this.setCredits);
        webReq.addEventListener(WebRequestErrorEvent.TEXT_ERROR, this.onError);
        webReq.sendRequest("getInfo", []);
    }

    private function exited(event:Event):void {
        if (this.sound != null) {
            this.sound.stop();
        }
        if (this.ytvid != null) {
            this.ytvid.stop();
        }
    }

    public function timerHandler(event:TimerEvent):void {
        var obj:DisplayObject;
        if (items[items.length - 1].y + items[items.length - 1].height < -2) {
            for each (obj in this.items) {
                obj.y += this.totalHeight;
            }
        }

        for each (obj in this.items) {
            obj.y -= 0.5;
        }

        if ((event.target as Timer).currentCount >= int.MAX_VALUE - 100) {
            (event.target as Timer).reset();
            (event.target as Timer).start();
        }
    }

    public function initialize():void {
        var h:int = 530;

        for each (var obj:DisplayObject in this.items) {
            if (obj is SimpleText) {
                obj.x = (400) - ((obj as SimpleText).textWidth / 2);
                obj.y = h;
                h += (obj as SimpleText).textHeight + 10;

                if ((obj as SimpleText).text == "|") {
                    (obj as SimpleText).text = "";
                }
            }
            else {
                obj.x = (400) - (obj.width / 2);
                obj.y = h;
                h += obj.height + 10;
            }

            this.displayScreen.addChild(obj);
        }

        this.totalHeight = h;

        this._045.x = ((800 / 2) - (this._045.width / 2));
        this._045.y = 524;

        var t = new Timer(0.5, int.MAX_VALUE);
        t.addEventListener(TimerEvent.TIMER, timerHandler);
        t.start();
    }

    protected function _W_w(_arg1:Event):void {
        navigateToURL(new URLRequest(_088), "_blank");
    }

    protected function _i0(_arg1:Event):void {
        navigateToURL(new URLRequest(_0L_O_), "_blank");
    }

    private function _ly(_arg1:Event):void {
        this.close.dispatch();
    }

    public function setCredits(_arg1:WebRequestSuccessEvent):void {
        this.creditsXML = XML(_arg1.data_);

        if (this.creditsXML.hasOwnProperty("@backgroundVideo")) {
            this.ytvid = new YouTubePlayer(this.creditsXML.@backgroundVideo, true);
            this.ytvid.repeat = true;
            addChild(this.ytvid);
        }
        else {
            Music.reload("");
            var sound:Sound = new Sound();
            if (this.creditsXML.@local) {
                sound.loadCompressedDataFromByteArray(LocalSounds.getSound(creditsXML.@music).data, LocalSounds.getSound(creditsXML.@music).data.length)
            }
            else {
                sound.load(new URLRequest("http://" + Parameters.musicUrl_ + "/sfx/music/" + creditsXML.@music + ".mp3"));
            }
            var soundTransform:SoundTransform = new SoundTransform(0.65);
            this.sound = sound.play(0, int.MAX_VALUE, soundTransform);
        }
        this.addEventListener(Event.REMOVED_FROM_STAGE, exited);
        this.items = new Vector.<DisplayObject>();

        this.displayScreen = new Sprite();
        var textMask:Shape = new Shape();
        textMask.graphics.beginFill(0);
        textMask.graphics.drawRect(0, 0, 800, 525);
        textMask.graphics.endFill();
        this.displayScreen.mask = textMask;
        addChild(textMask);
        addChild(this.displayScreen);

        for each (var xml:XML in creditsXML.DrawImage) {
            var cls:Class = getDefinitionByName("FireBite.Embeds.Images." + xml.@id) as Class;
            var bmp:Bitmap = new cls();
            this.items.push(bmp);
        }

        for each (var item:XML in creditsXML.DrawText) {
            var text:SimpleText = new SimpleText(int(item.@size), uint(item.@color), false, int(item.@width), int(item.@height));
            text.text = item.Text;
            text.boldText(item.hasOwnProperty("Bold"));
            text.multiline = item.hasOwnProperty("MultiLine");
            text.wordWrap = item.hasOwnProperty("WordWrap");
            var filters:Array = [];

            if (item.hasOwnProperty("DropShadowFilter")) {
                filters.push(new DropShadowFilter());
            }
            if (item.hasOwnProperty("GlowFilter")) {
                filters.push(new GlowFilter());
            }
            text.filters = filters;
            text.updateMetrics();

            this.items.push(text);
        }

        addChild(new ScreenGraphic());
        this._045 = new _H_o("close", 36, false);
        this._045.addEventListener(MouseEvent.CLICK, this._ly);
        addChild(this._045);
        initialize();
    }

    public function onError(_arg1:WebRequestErrorEvent):void {
        var webReq:WebRequest = new WebRequest(Parameters.getAccountServerIP(), "/credits", true);
        webReq.addEventListener(WebRequestSuccessEvent.GENERIC_DATA, this.setCredits);
        webReq.addEventListener(WebRequestErrorEvent.TEXT_ERROR, this.onError);
        webReq.sendRequest("getInfo", []);
    }
}
}//package _F_1

