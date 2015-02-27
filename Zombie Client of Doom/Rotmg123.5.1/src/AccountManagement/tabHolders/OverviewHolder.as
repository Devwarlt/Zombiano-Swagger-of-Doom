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
 * Created by Fabian on 19.12.2014.
 */
package AccountManagement.tabHolders {
import AccountManagement.AccountManagementBody;
import AccountManagement.images.AccountManagementImages;
import AccountManagement.ui.TabButton;

import com.company.assembleegameclient.ui.ScrollBar;
import com.company.assembleegameclient.util.TextureRedrawer;
import com.company.rotmg.graphics.ranks.premiumRank;

import flash.display.Bitmap;

import flash.display.BitmapData;
import flash.events.Event;
import flash.filters.GlowFilter;

public class OverviewHolder extends TabHolder {

    private var scrollBar:ScrollBar;
    private var logItems:Vector.<LogItemHolder>;
    private var itemsHeight:Number;

    public function OverviewHolder(parent:AccountManagementBody) {
        super(parent);
        this.logItems = new Vector.<LogItemHolder>();
    }

    public override function initialize():void {
        this.scrollBar = new ScrollBar(16, HEIGHT - 20);
        this.scrollBar.x = WIDTH - 20;
        this.scrollBar.y = 10;
        this.scrollBar.addEventListener(Event.CHANGE, this.onChange);
        addChild(this.scrollBar);

        var currentHeight:Number = 5;
        var logHolder:LogItemHolder;
        if (XML(bodyParent.managementParent.accountXml).hasOwnProperty("News")) {
            for each (var item:LogItem in parseItems(XML(bodyParent.managementParent.accountXml.News))) {
                logHolder = new LogItemHolder(resolveImage(item.icon), item.title, item.tagLine, item.link, item.dateTime);
                logHolder.x = 5;
                logHolder.y = currentHeight;
                logHolder.baseY = currentHeight;
                logHolder.addEventListener(SwitchToEvent.SWITCH_TO, function (event:SwitchToEvent):void {
                    bodyParent.managementParent.accountHeader.switchToTab(event.tabName);
                });
                addChild(logHolder);
                this.logItems.push(logHolder);
                currentHeight += LogItemHolder.HEIGHT + 5;
            }
        }
        this.scrollBar._fA_(HEIGHT, this.itemsHeight = currentHeight);
    }

    private function onChange(event:Event):void {
        for each (var item:LogItemHolder in this.logItems) {
            item.setY(((-(this.scrollBar._Q_D_()) * (this.itemsHeight - HEIGHT))));
        }
    }

    private static function resolveImage(imageType:String):Bitmap {
        var bmp:Bitmap;

        switch (imageType) {
            case "premium":
                bmp = new Bitmap(scaleDown(new premiumRank().bitmapData));
                bmp.filters = [new GlowFilter(0xFFD700)];
                break;
            case "bronzeFirePack":
                bmp = new Bitmap(scaleDown(new AccountManagementImages.bronzeFirePack().bitmapData));
                break;
            case "silverFirePack":
                bmp = new Bitmap(scaleDown(new AccountManagementImages.silverFirePack().bitmapData));
                break;
            case "goldFirePack":
                bmp = new Bitmap(scaleDown(new AccountManagementImages.goldFirePack().bitmapData));
                break;
            case "premiumFirePack":
                bmp = new Bitmap(scaleDown(new AccountManagementImages.premiumFirePack().bitmapData));
                break;
            default:
                bmp = new Bitmap(scaleDown(new AccountManagementImages.defaultSpeechBubble().bitmapData));
                break;
        }

        return bmp;
    }

    private static function scaleDown(data:BitmapData):BitmapData {
        return TextureRedrawer.resize(data, null, 8, false, 100, 100, 5);
    }

    private static function parseItems(xml:XML):Vector.<LogItem> {
        var items:Array = [];
        var item:LogItem;
        for each (var i:XML in xml.Item) {
            item = new LogItem();
            item.title = i.Title;
            item.tagLine = i.TagLine;
            item.link = i.Link;
            item.icon = i.Icon;
            item.dateTime = i.Date;
            items.push(item);
        }
        items.sortOn("dateTime", Array.NUMERIC);
        return Vector.<LogItem>(items.reverse());
    }
}
}

import com.company.ui.SimpleText;

import flash.display.Bitmap;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
import flash.net.URLRequest;
import flash.net.navigateToURL;

class LogItem {
    public var title:String;
    public var icon:String;
    public var dateTime:int;
    public var link:String;
    public var tagLine:String;
}

class LogItemHolder extends Sprite {

    public static const WIDTH:int = 430;
    public static const HEIGHT:int = 60;
    public static const defaultColor:uint = 0xB3B3B3;
    public static const mouseOverColor:uint = 0xFFC800;

    public var icon:Bitmap;
    public var title:SimpleText;
    public var tagLine:SimpleText;
    public var timeAgo:SimpleText;
    public var link:String;
    public var baseY:Number;

    public function LogItemHolder(_arg1:Bitmap, _arg2:String, _arg3:String, _arg4:String, _arg5:int) {
        super();
        this.graphics.beginFill(0x000000, 0.5);
        this.graphics.drawRect(0, 0, WIDTH + 4, HEIGHT);
        this.graphics.endFill();
        this.link = _arg4;
        buttonMode = true;
        useHandCursor = true;
        tabEnabled = false;
        this.icon = _arg1;
        this.icon.x = 12;
        this.icon.y = (((HEIGHT / 2) - (_arg1.height / 2)) - 5);
        addChild(this.icon);
        this.title = new SimpleText(18, defaultColor, false, 0, 0, "Myriad Pro");
        this.title.text = _arg2;
        this.title.updateMetrics();
        this.title.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this.title.x = 73;
        addChild(this.title);
        this.tagLine = new SimpleText(14, defaultColor, false, 0, 0, "Myriad Pro");
        this.tagLine.text = _arg3;
        this.tagLine.updateMetrics();
        this.tagLine.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this.tagLine.x = 73;
        this.tagLine.y = 30;
        addChild(this.tagLine);
        this.timeAgo = new SimpleText(16, defaultColor, false, 0, 0, "Myriad Pro");
        this.timeAgo.text = _06P_(_arg5);
        this.timeAgo.updateMetrics();
        this.timeAgo.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this.timeAgo.x = (WIDTH - this.timeAgo.width);
        addChild(this.timeAgo);
        addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
        addEventListener(MouseEvent.MOUSE_DOWN, this.onMouseDown);
    }

    public function setY(value:Number):void {
        if (isNaN(value)) {
            return;
        }
        y = baseY + value;
    }

    protected function onMouseOver(_arg1:MouseEvent):void {
        this.title.setColor(mouseOverColor);
        this.tagLine.setColor(mouseOverColor);
        this.timeAgo.setColor(mouseOverColor);
    }

    protected function onRollOut(_arg1:MouseEvent):void {
        this.title.setColor(defaultColor);
        this.tagLine.setColor(defaultColor);
        this.timeAgo.setColor(defaultColor);
    }

    protected function onMouseDown(_arg1:MouseEvent):void {
        var _local2:Array = this.link.split(":", 2);
        switch (_local2[0]) {
            case "switchTo":
                dispatchEvent(new SwitchToEvent(_local2[1]));
                break;
            case "http":
            case "https":
                navigateToURL(new URLRequest(this.link), "_blank");
        }
    }

    private static function _06P_(_arg1:int):String {
        var curTime:Number = (new Date().time / 1000);
        var diff:int = (curTime - _arg1);
        if (diff <= 0) {
            return "now";
        }
        if (diff < 60) {
            return (diff + " sec(s) ago");
        }
        if (diff < (60 * 60)) {
            return (int((diff / 60)) + " min(s) ago");
        }
        if (diff < ((60 * 60) * 24)) {
            return (int((diff / (60 * 60))) + " hour(s) ago");
        }
        return (int((diff / ((60 * 60) * 24))) + " day(s) ago");
    }
}

class SwitchToEvent extends Event {

    public static const SWITCH_TO:String = "switchTo";

    public var tabName:String;

    public function SwitchToEvent(tabName:String) {
        super(SWITCH_TO);
        this.tabName = tabName;
    }
}


