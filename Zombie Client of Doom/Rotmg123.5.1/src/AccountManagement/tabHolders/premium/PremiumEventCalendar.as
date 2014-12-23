/**
 * Created by Fabian on 19.12.2014.
 */
package AccountManagement.tabHolders.premium {
import AccountManagement.AccountManagementBody;
import AccountManagement.images.AccountManagementImages;
import AccountManagement.tabHolders.TabHolder;
import AccountManagement.ui.TabButton;

import _05R_.GTween;

import _0G_l._in;

import com.company.ui.SimpleText;

import flash.display.Sprite;
import flash.events.MouseEvent;

public class PremiumEventCalendar extends PremiumTabHolder {

    private var title:SimpleText;
    private var nextArrow:Sprite;
    private var prevArrow:Sprite;

    //private var currentHolders:Vector.<calendarEventHolder>;
    private var holderSpritePos:Number;
    private var holderSprite:Sprite;
    private var numberOfEvents:int;

    private var _info:Sprite;

    public function PremiumEventCalendar(parent:AccountManagementBody) {
        super(parent);
        //this.currentHolders = new Vector.<calendarEventHolder>();
        this.holderSprite = new Sprite();
    }

    public override function initialize(tab:TabButton):void {
        super.tab = tab;

        this.title = new SimpleText(18, 0xffffff);
        this.title.boldText(true);
        this.title.text = "PREMIUM CALENDAR";
        this.title.updateMetrics();
        this.title.x = 2;
        this.title.y = 2;
        addChild(this.title);

        graphics.beginFill(0x000000, 0.8);
        graphics.drawRect(0, 0, 800, this.title.height + 4);
        graphics.endFill();

        this.nextArrow = new Sprite();
        this.nextArrow.addChild(AccountManagementImages.nextArrow(1.0));
        this.nextArrow.y = this.height;
        this.nextArrow.x = 800 - this.nextArrow.width;
        this.nextArrow.graphics.beginFill(0x000000, 0.4);
        this.nextArrow.graphics.drawRect(0, 0, this.nextArrow.width, this.nextArrow.height);
        this.nextArrow.graphics.endFill();
        this.nextArrow.name = "next";
        this.nextArrow.addEventListener(MouseEvent.CLICK, this.onArrowClick);
        this.nextArrow.addEventListener(MouseEvent.ROLL_OVER, this.onArrowRollOver);
        this.nextArrow.addEventListener(MouseEvent.ROLL_OUT, this.onArrowRollOut);

        this.prevArrow = new Sprite();
        this.prevArrow.addChild(AccountManagementImages.prevArrow(1.0));
        this.prevArrow.y = this.height;
        this.prevArrow.x = this.prevArrow.width;
        this.prevArrow.graphics.beginFill(0x000000, 0.4);
        this.prevArrow.graphics.drawRect(0 - this.prevArrow.width, 0, this.prevArrow.width, this.prevArrow.height);
        this.prevArrow.graphics.endFill();
        this.prevArrow.name = "previous";
        this.prevArrow.addEventListener(MouseEvent.CLICK, this.onArrowClick);
        this.prevArrow.addEventListener(MouseEvent.ROLL_OVER, this.onArrowRollOver);
        this.prevArrow.addEventListener(MouseEvent.ROLL_OUT, this.onArrowRollOut);

        addChild(this.nextArrow);
        addChild(this.prevArrow);

        var nextW:Number = 40;
        var holder:calendarEventHolder;

        var holderMask:Sprite = new Sprite();
        holderMask.graphics.beginFill(0x000000, 0.0);
        holderMask.graphics.drawRect(0, 0, 720, 390);
        holderMask.graphics.endFill();
        holderMask.x = 40;
        holderMask.y = 28;
        addChild(holderMask);
        var month:int;
        var year:String;
        var center:Number;
        for (var i:int = 0; i < 24; i++) {
            month = i % 12;
            year = i > 11 ? "2015" : "2014";

            if(new Date().getFullYear() == Number(year) && new Date().getMonth() == month) {
                center = nextW - 360;
            }

            holder = new calendarEventHolder(getName(month), year, getEventsFromDate(month, year));
            holder.x = nextW;
            holder.y = 28;
            holderSprite.addChild(holder);
            //this.currentHolders.push(holder);
            nextW += calendarEventHolder.WIDTH;
        }
        numberOfEvents = i;
        holderSprite.mask = holderMask;
        addChild(holderSprite);

        this.holderSpritePos = holderSprite.x;

        moveToCurrentEventDate(center);

        //space between x 720;
        //space between y = 390;
    }

    private function getName(i:int):String {
        switch(i) {
            case 0: return "JAN";
            case 1: return "FEB";
            case 2: return "MAR";
            case 3: return "APR";
            case 4: return "MAY";
            case 5: return "JUN";
            case 6: return "JUL";
            case 7: return "AUG";
            case 8: return "SEP";
            case 9: return "OCT";
            case 10: return "NOV";
            default: return "DEC";
        }
    }

    private function getEventsFromDate(month:int, year:String):Vector.<PremiumEvent> {
        var ret:Vector.<PremiumEvent> = new Vector.<PremiumEvent>();

        var date:Date;
        var item:PremiumEvent;

        for each (var event:XML in bodyParent.managementParent.accountXml.PremiumNews.Item) {
            date = new Date(event.StartDate * 1000);

            if(date.getMonth() == month && date.getFullYear() == Number(year)) {
                item = new PremiumEvent();
                item.startDate = event.StartDate;
                item.endDate = event.EndDate;
                item.description = event.Description;
                item.icon = event.Icon;
                item.title = event.Title;

                item.startDateString = String(date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate());
                if(item.endDate != -1) {
                    date = new Date(item.endDate * 1000);
                    item.endDateString = String(date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate());
                }

                ret.push(item);
            }
        }
        trace(ret.length);
        return ret;
    }

    private function moveToCurrentEventDate(val:Number):void {
        if(isNaN(val)) {
            return;
        }
        var tmpPos:Number = val;
        while (((-tmpPos) + (numberOfEvents * calendarEventHolder.WIDTH)) < 720) {
            tmpPos -= calendarEventHolder.WIDTH;
        }
        while (-tmpPos > 0) {
            tmpPos += calendarEventHolder.WIDTH;
        }

        holderSpritePos = -tmpPos;
        holderSprite.x = holderSpritePos;

        var tween:GTween = new GTween(holderSprite, 0.2, {"x": holderSpritePos});
        tween.onComplete = animationCompleted;
    }

    private var completed:Boolean = true;
    private var queue:Vector.<Number> = new Vector.<Number>();

    private function animationCompleted(tween:GTween):void {
        if(queue.length > 0) {
            tween = new GTween(holderSprite, 0.2, {"x": Number(queue.shift())});
            tween.onComplete = animationCompleted;
        }
        else {
            completed = true;
        }
    }

    private function onArrowClick(event:MouseEvent):void {
        if((holderSpritePos + (numberOfEvents * calendarEventHolder.WIDTH) <= 720 && event.target.name == "next") ||
           (holderSpritePos >= 0 && event.target.name == "previous")) {
            return;
        }

        var oldPos:Number = holderSpritePos;

        switch(event.target.name){
            case "next":
                holderSpritePos -= calendarEventHolder.WIDTH;
                break;
            case "previous":
                holderSpritePos += calendarEventHolder.WIDTH;
                break;
        }

        if(oldPos != holderSpritePos) {
            if(completed) {
                var animation:GTween = new GTween(holderSprite, 0.2, {"x": holderSpritePos});
                animation.onComplete = animationCompleted;
                completed = false;
            }
            else {
                queue.push(holderSpritePos);
            }
        }
    }

    private function onArrowRollOver(event:MouseEvent):void {
        if(event.target.name == "previous") {
            event.target.graphics.clear();
            event.target.graphics.beginFill(0x000000, 0.8);
            event.target.graphics.drawRect(0 - event.target.width, 0, event.target.width, event.target.height);
            event.target.graphics.endFill();
        }
        else {
            event.target.graphics.clear();
            event.target.graphics.beginFill(0x000000, 0.8);
            event.target.graphics.drawRect(0, 0, event.target.width, event.target.height);
            event.target.graphics.endFill();
        }
    }

    private function onArrowRollOut(event:MouseEvent):void {
        if(event.target.name == "previous") {
            event.target.graphics.clear();
            event.target.graphics.beginFill(0x000000, 0.4);
            event.target.graphics.drawRect(0 - event.target.width, 0, event.target.width, event.target.height);
            event.target.graphics.endFill();
        }
        else {
            event.target.graphics.clear();
            event.target.graphics.beginFill(0x000000, 0.4);
            event.target.graphics.drawRect(0, 0, event.target.width, event.target.height);
            event.target.graphics.endFill();
        }
    }

    public function get info():Sprite {
        return _info;
    }

    public function set info(value:Sprite):void {
        if(value == null) {
            if(_info != null) {
                removeChild(_info);
            }
        }
        else {
            value.scaleX = value.scaleY = 0.0;
            addChild(value);
            var tween:GTween = new GTween(value, 0.15, { "scaleX": 1.0, "scaleY": 1.0 });
            tween._bR_ = onChange;
        }
        _info = value;
    }

    public function onChange(tween:GTween):void {
        if (_info != null) {
            _info.x = ((WIDTH / 2) - (_info.width / 2));
            _info.y = ((HEIGHT / 2) - (_info.height / 2));
        }
    }
}
}

import AccountManagement.images.AccountManagementImages;
import AccountManagement.tabHolders.premium.PremiumEventCalendar;
import AccountManagement.ui.FancyTextButton;

import _05R_.GTween;

import com.company.ui.SimpleText;
import com.company.util.GraphicHelper;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.GradientType;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.geom.Matrix;

class calendarEventHolder extends Sprite {
    public static const WIDTH:int = 80;
    public static const HEIGHT:int = 390;

    private var monthText:SimpleText;
    private var yearText:SimpleText;

    public function calendarEventHolder(month:String, year:String, events:Vector.<PremiumEvent>) {
        this.graphics.beginFill(0x000000, 1.0);
        this.graphics.drawRect(0, 0, WIDTH, HEIGHT);
        this.graphics.endFill();

        this.yearText = new SimpleText(16, 0xffffff);
        this.yearText.boldText(true);
        this.yearText.text = year;
        this.yearText.y = 2;
        this.yearText.x = ((WIDTH / 2) - (this.yearText.textWidth / 2));
        addChild(this.yearText);

        var color:uint = 0x9E6700;

        if (new Date().getMonth() == getIntForMonth(month) && new Date().getFullYear() == int(year)) {
            color = 0xDDFF00;
        }

        var gradientMatrix:Matrix = new Matrix();
        gradientMatrix.createGradientBox(WIDTH, 50, (Math.PI / 180) * 90, 0, 0);
        graphics.beginGradientFill(GradientType.LINEAR, [color, 0x000000], [0.5, 0.0], [0, 200], gradientMatrix);
        this.graphics.drawRect(0, 0, WIDTH, 50);
        this.graphics.endFill();

        this.monthText = new SimpleText(16, 0xffffff);
        this.monthText.boldText(true);
        this.monthText.text = month;
        this.monthText.y = 27;
        this.monthText.x = ((WIDTH / 2) - (this.monthText.textWidth / 2));
        addChild(this.monthText);

        this.graphics.lineStyle(1, 0xffffff);
        this.graphics.moveTo(0, 25);
        this.graphics.lineTo(WIDTH - 1, 25);
        this.graphics.moveTo(0, 50);
        this.graphics.lineTo(WIDTH - 1, 50);
        this.graphics.moveTo(0, 0);
        this.graphics.lineTo(WIDTH - 1, 0);
        this.graphics.moveTo(WIDTH - 1, 0);
        this.graphics.lineTo(WIDTH - 1, HEIGHT - 1);
        //this.graphics.moveTo(WIDTH, HEIGHT);
        //this.graphics.lineTo(0, HEIGHT);
        this.graphics.moveTo(0, HEIGHT - 1);
        this.graphics.lineTo(0, 0);
        this.graphics.lineStyle();

        var nextH:Number = 50;

        var ev:calendarEvent;

        for (var i:int = 0; i < 4; i++) {
            ev = new calendarEvent(events.length -1 >= i ? events[i] : null);
            ev.y = nextH;
            addChild(ev);
            nextH += calendarEvent.HEIGHT;
        }
    }

    private function getIntForMonth(i:String):int {
        switch(i) {
            case "JAN": return 0;
            case "FEB": return 1;
            case "MAR": return 2;
            case "APR": return 3;
            case "MAY": return 4;
            case "JUN": return 5;
            case "JUL": return 6;
            case "AUG": return 7;
            case "SEP": return 8;
            case "OCT": return 9;
            case "NOV": return 10;
            default: return 11;
        }
    }
}

class calendarEvent extends Sprite {

    public static const WIDTH:int = 80;
    public static const HEIGHT:int = 85;

    private var image:Bitmap;
    private var event:PremiumEvent;

    public function calendarEvent(event:PremiumEvent) {
        this.event = event;
        this.graphics.beginFill(0x000000, 0.0);
        this.graphics.drawRect(0, 0, WIDTH, HEIGHT);
        this.graphics.endFill();
        this.graphics.lineStyle(0, 0xffffff);
        this.graphics.lineTo(WIDTH - 1, 0);
        this.graphics.moveTo(0, HEIGHT - 1);
        this.graphics.lineTo(WIDTH, HEIGHT - 1);
        this.graphics.lineStyle();

        if(event != null) {
            image = new Bitmap(getImage(true));
            image.x = ((WIDTH / 2) - (image.width / 2));
            image.y = ((HEIGHT / 2) - (image.height / 2));
            addChild(image);
            this.addEventListener(MouseEvent.CLICK, onClick);
        }
    }

    private function onClick(event:MouseEvent):void {
        if((parent.parent.parent as PremiumEventCalendar).info == null) {
            (parent.parent.parent as PremiumEventCalendar).info = getInfo();
        }
    }

    private function getImage(thumb:Boolean = false):BitmapData {
        switch(event.icon) {
            case "fpcPack": return thumb ? new AccountManagementImages.pack_01_thumb().bitmapData : new AccountManagementImages.pack_01_detail().bitmapData;
            case "premiumEvent": return thumb ? new AccountManagementImages.event_01_thumb().bitmapData : new AccountManagementImages.event_01_detail().bitmapData;
            default: return null;
        }
    }

    private function getInfo():Sprite {
        var width:Number = 600;
        var height:Number = 400;
        var sprite:Sprite = new Sprite();
        var title:SimpleText = new SimpleText(18, 0x000000);
        var eventTitle:SimpleText = new SimpleText(20, 0xffffff, false, 40, 570);
        var date:SimpleText = new SimpleText(18, 0x9E9E9E, false, 40, 570);
        var eventDesc:SimpleText = new SimpleText(16, 0xffffff, false, 60, 570);
        var closeBtn:FancyTextButton = new FancyTextButton(20, "CLOSE");
        var image:Bitmap = new Bitmap(getImage());

        sprite.graphics.beginFill(0x000000, 1.0);
        sprite.graphics.drawRect(0, 0, width, height);
        sprite.graphics.endFill();

        sprite.graphics.beginFill(0xffffff, 1.0);
        sprite.graphics.drawRect(0, 0, width, 25);
        sprite.graphics.endFill();

        GraphicHelper.createBorder(sprite, 1, 0xffffff);

        title.boldText(true);
        title.text = "PREMIUM";
        title.updateMetrics();
        title.x = ((width / 2) - (title.width / 2));

        closeBtn.x = ((width / 2) - (closeBtn.width / 2));
        closeBtn.y = height - closeBtn.height - 10;
        closeBtn.addEventListener(MouseEvent.CLICK, function(event:MouseEvent):void {
            var tween:GTween = new GTween(event.target.parent, 0.15, { "scaleX": 0.0, "scaleY": 0.0 });
            tween._bR_ = (parent.parent.parent as PremiumEventCalendar).onChange;
            tween.onComplete = function(tw:GTween):void {
                (parent.parent.parent as PremiumEventCalendar).info = null;
            };
        });

        image.x = ((width / 2) - (image.width / 2));
        image.y = 25;

        eventTitle.x = 15;
        eventTitle.y = image.height + 35;
        eventTitle.boldText(true);
        eventTitle.multiline = true;

        date.text = this.event.startDateString + (this.event.endDateString != null ? " - " + this.event.endDateString : "");
        date.x = 15;
        date.y = image.height + 55;
        date.boldText(true);
        date.multiline = true;

        eventDesc.x = 15;
        eventDesc.y = image.height + 85;
        eventDesc.multiline = true;
        eventDesc.wordWrap = true;

        eventTitle.text = this.event.title.toUpperCase();
        eventDesc.text = this.event.description;

        sprite.addChild(title);
        sprite.addChild(image);
        sprite.addChild(date);
        sprite.addChild(eventTitle);
        sprite.addChild(eventDesc);
        sprite.addChild(closeBtn);

        return sprite;
    }
}

class PremiumEvent {
    public var icon:String;
    public var title:String;
    public var description:String;
    public var startDate:int;
    public var endDate:int;

    public var startDateString:String;
    public var endDateString:String;
}