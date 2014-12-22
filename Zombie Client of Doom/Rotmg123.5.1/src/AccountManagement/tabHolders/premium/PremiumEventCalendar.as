/**
 * Created by Fabian on 19.12.2014.
 */
package AccountManagement.tabHolders.premium {
import AccountManagement.AccountManagementBody;
import AccountManagement.images.AccountManagementImages;
import AccountManagement.ui.TabButton;

import _05R_.GTween;

import com.company.ui.SimpleText;

import flash.display.Sprite;
import flash.events.MouseEvent;

public class PremiumEventCalendar extends PremiumTabHolder {

    public function PremiumEventCalendar(parent:AccountManagementBody) {
        super(parent);
        //this.currentHolders = new Vector.<calendarEventHolder>();
        this.holderSprite = new Sprite();
    }
    private var title:SimpleText;
    private var nextArrow:Sprite;

    //private var currentHolders:Vector.<calendarEventHolder>;
    private var prevArrow:Sprite;
    private var holderSpritePos:Number;
    private var holderSprite:Sprite;
    private var numberOfEvents:int;
    private var completed:Boolean = true;
    private var queue:Vector.<Number> = new Vector.<Number>();

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

        for (var i:int = 0; i < 36; i++) {
            holder = new calendarEventHolder(getName(i % 12), i > 11 ? i > 24 ? "2017" : "2016" : "2015");
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

        //space between x 720;
        //space between x = 390;
    }

    private function getName(i:int):String {
        switch (i) {
            case 0:
                return "JAN";
            case 1:
                return "FEB";
            case 2:
                return "MAR";
            case 3:
                return "APR";
            case 4:
                return "MAY";
            case 5:
                return "JUN";
            case 6:
                return "JUL";
            case 7:
                return "AUG";
            case 8:
                return "SEP";
            case 9:
                return "OCT";
            case 10:
                return "NOV";
            default:
                return "DEC";
        }
    }

    private function animationCompleted(tween:GTween):void {
        if (queue.length > 0) {
            tween = new GTween(holderSprite, 0.2, {"x": Number(queue.shift())});
            tween.onComplete = animationCompleted;
        }
        else {
            completed = true;
        }
    }

    private function onArrowClick(event:MouseEvent):void {
        if ((holderSpritePos + (numberOfEvents * calendarEventHolder.WIDTH) <= 720 && event.target.name == "next") ||
                (holderSpritePos >= 0 && event.target.name == "previous")) {
            return;
        }

        var oldPos:Number = holderSpritePos;

        switch (event.target.name) {
            case "next":
                holderSpritePos -= calendarEventHolder.WIDTH;
                break;
            case "previous":
                holderSpritePos += calendarEventHolder.WIDTH;
                break;
        }

        if (oldPos != holderSpritePos) {
            if (completed) {
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
        if (event.target.name == "previous") {
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
        if (event.target.name == "previous") {
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
}
}

import com.company.ui.SimpleText;

import flash.display.Sprite;

class calendarEventHolder extends Sprite {
    public static const WIDTH:int = 80;
    public static const HEIGHT:int = 390;

    //private var icon:Bitmap;

    private var monthText:SimpleText;
    private var yearText:SimpleText;

    public function calendarEventHolder(month:String, year:String) {
        //this.icon = icon;

        this.graphics.beginFill(0x000000, 1.0);
        this.graphics.drawRect(0, 0, WIDTH, HEIGHT);
        this.graphics.endFill();

        this.yearText = new SimpleText(16, 0xffffff);
        this.yearText.boldText(true);
        this.yearText.text = year;
        this.yearText.y = 2;
        this.yearText.x = ((WIDTH / 2) - (this.yearText.textWidth / 2));
        addChild(this.yearText);

        this.graphics.beginFill(0x493D00, 0.5);
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
            ev = new calendarEvent();
            ev.y = nextH;
            addChild(ev);
            nextH += calendarEvent.HEIGHT;
        }
    }
}

class calendarEvent extends Sprite {

    public static const WIDTH:int = 80;
    public static const HEIGHT:int = 85;

    public function calendarEvent() {
        this.graphics.lineStyle(0, 0xffffff);
        this.graphics.lineTo(WIDTH - 1, 0);
        this.graphics.moveTo(0, HEIGHT - 1);
        this.graphics.lineTo(WIDTH, HEIGHT - 1);
        this.graphics.lineStyle();
    }
}