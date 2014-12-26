/**
 * Created by Fabian on 19.12.2014.
 */
package AccountManagement.tabHolders {
import AccountManagement.AccountManagementBody;
import AccountManagement.images.AccountManagementImages;
import AccountManagement.ui.TabButton;

import com.company.assembleegameclient.ui._0K_B_;
import com.company.assembleegameclient.util.TextureRedrawer;
import com.company.rotmg.graphics.ranks.premiumRank;

import flash.display.Bitmap;

import flash.display.BitmapData;
import flash.events.Event;
import flash.filters.GlowFilter;

public class OverviewHolder extends TabHolder {

    private var scrollBar:_0K_B_;
    private var logItems:Vector.<LogItemHolder>;
    private var itemsHeight:Number;

    public function OverviewHolder(parent:AccountManagementBody) {
        super(parent);
        this.logItems = new Vector.<LogItemHolder>();
    }

    public override function initialize(tab:TabButton):void {
        this.tab = tab;

        this.scrollBar = new _0K_B_(16, HEIGHT - 20);
        this.scrollBar.x = WIDTH - 20;
        this.scrollBar.y = 10;
        this.scrollBar.addEventListener(Event.CHANGE, this.onChange);
        addChild(this.scrollBar);

        var currentHeight:Number = 5;
        var logHolder:LogItemHolder;
        for each (var item:LogItem in parseItems(XML(bodyParent.managementParent.accountXml.News))) {
            logHolder = new LogItemHolder(resolveImage(item.icon), item.title, item.tagLine, item.link, item.dateTime);
            logHolder.x = 5;
            logHolder.y = currentHeight;
            logHolder.baseY = currentHeight;
            logHolder.addEventListener("switchTo", function(event:SwitchToEvent):void {
                bodyParent.managementParent.accountHeader.switchToTab(event.tabName);
            });
            addChild(logHolder);
            this.logItems.push(logHolder);
            currentHeight += LogItemHolder.HEIGHT + 5;
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
            case "bronzeFpcPack":
                bmp = new Bitmap(scaleDown(new AccountManagementImages.bronzeFpcPack().bitmapData));
                break;
            case "silverFpcPack":
                bmp = new Bitmap(scaleDown(new AccountManagementImages.silverFpcPack().bitmapData));
                break;
            case "goldFpcPack":
                bmp = new Bitmap(scaleDown(new AccountManagementImages.goldFpcPack().bitmapData));
                break;
            case "premiumFpcPack":
                bmp = new Bitmap(scaleDown(new AccountManagementImages.premiumFpcPack().bitmapData));
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

    public function LogItemHolder(_arg1:Bitmap, _arg2:String, _arg3:String, _arg4:String, _arg5:int){
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
        if(isNaN(value)) {
            return;
        }
        y = baseY + value;
    }

    protected function onMouseOver(_arg1:MouseEvent):void{
        this.title._gp(mouseOverColor);
        this.tagLine._gp(mouseOverColor);
        this.timeAgo._gp(mouseOverColor);
    }
    protected function onRollOut(_arg1:MouseEvent):void{
        this.title._gp(defaultColor);
        this.tagLine._gp(defaultColor);
        this.timeAgo._gp(defaultColor);
    }
    protected function onMouseDown(_arg1:MouseEvent):void{
        var _local2:Array = this.link.split(":", 2);
        switch (_local2[0])
        {
            case "switchTo":
                dispatchEvent(new SwitchToEvent("switchTo", _local2[1]));
                break;
            case "http":
            case "https":
                navigateToURL(new URLRequest(this.link), "_blank");
        }
    }
    private static function _06P_(_arg1:int):String{
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

    public var tabName:String;

    public function SwitchToEvent(eventType:String, tabName:String) {
        super(eventType);
        this.tabName = tabName;
    }
}

