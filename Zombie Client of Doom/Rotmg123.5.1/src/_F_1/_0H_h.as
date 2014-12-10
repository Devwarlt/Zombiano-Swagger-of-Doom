// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_F_1._0H_h

package _F_1{
import Sounds.Music;

import _zo._8C_;
import _zo._mS_;

import com.company.assembleegameclient.appengine.WebRequest;

import com.company.assembleegameclient.parameters.Parameters;

import flash.display.DisplayObject;
import flash.display.Shape;
import flash.display.Sprite;
import _sp._aJ_;
import com.company.ui.SimpleText;
import com.company.rotmg.graphics.StackedLogoR;
import com.company.rotmg.graphics.KabamLogo;
import _02t._R_f;
import com.company.rotmg.graphics.ScreenGraphic;

import flash.events.TimerEvent;
import flash.filters.DropShadowFilter;
import flash.events.MouseEvent;
import flash.filters.GlowFilter;
import flash.net.navigateToURL;
import flash.net.URLRequest;
import flash.events.Event;
import flash.utils.Timer;

public class _0H_h extends Sprite {

    private static const _088:String = "http://www.wildshadow.com/";
    private static const _0L_O_:String = "http://www.kabam.com/";

    public var close:_aJ_;

    private var _045:_H_o;
    private var displayScreen:Sprite;
    private var items:Vector.<DisplayObject>;
    private var totalHeight;

    public function _0H_h() {
        Music.reload("credits", true);
        this.close = new _aJ_();
        this.items = new Vector.<DisplayObject>();
        addChild(new _R_f());
        addChild(new ScreenGraphic());

        this.displayScreen = new Sprite();
        var textMask = new Shape();
        textMask.graphics.beginFill(0);
        textMask.graphics.drawRect(0, 0, 800, 525);
        textMask.graphics.endFill();
        this.displayScreen.mask = textMask;
        addChild(textMask);
        addChild(this.displayScreen);

        for each (var item:XML in creditsXML.DrawText) {
            var text:SimpleText = new SimpleText(int(item.@size), uint(item.@color), false, int(item.@width), int(item.@height));
            text.text = item.Text;
            text.boldText(item.hasOwnProperty("Bold"));
            text.multiline = item.hasOwnProperty("MultiLine");
            text.wordWrap = item.hasOwnProperty("WordWrap");
            var filters:Array = [];

            if(item.hasOwnProperty("DropShadowFilter")) {
                filters.push(new DropShadowFilter());
            }
            if(item.hasOwnProperty("GlowFilter")){
                filters.push(new GlowFilter());
            }
            text.filters = filters;
            text.updateMetrics();

            items.push(text);
        }

        this._045 = new _H_o("close", 36, false);
        this._045.addEventListener(MouseEvent.CLICK, this._ly);
        addChild(this._045);
    }
    public function timerHandler(event:TimerEvent):void {
        if(items[items.length - 1].y + items[items.length - 1].height < -2) {
            for each (var obj:DisplayObject in this.items) {
                obj.y += this.totalHeight;
            }
        }

        for each (var obj:DisplayObject in this.items) {
            obj.y -= 0.5;
        }

        if((event.target as Timer).currentCount >= int.MAX_VALUE - 100) {
            (event.target as Timer).reset();
            (event.target as Timer).start();
        }
    }
    public function initialize():void {
        var h:int = 530;

        for each (var obj:DisplayObject in this.items) {
            if(obj is SimpleText) {
                obj.x = (400) - ((obj as SimpleText).textWidth / 2);
                obj.y = h;
                h += (obj as SimpleText).textHeight + 10;

                if((obj as SimpleText).text == "|") {
                    (obj as SimpleText).text = "";
                }
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

    public static function setCredits(_arg1:_8C_):void {
        creditsXML = XML(_arg1.data_);
    }

    public static function onError(_arg1:_mS_):void {
        var webReq = new WebRequest(Parameters._fK_(), "/credits", true);
        webReq.addEventListener(_8C_.GENERIC_DATA, _0H_h.setCredits);
        webReq.addEventListener(_mS_.TEXT_ERROR, _0H_h.onError);
        webReq.sendRequest("getInfo", []);
    }

    private static var creditsXML:XML;
}
}//package _F_1

