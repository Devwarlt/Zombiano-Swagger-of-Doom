/**
 * Created by Fabian on 27.12.2014.
 */
package Frames {

import _0L_C_.DialogBox;

import com.company.assembleegameclient.appengine._0K_R_;
import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.assembleegameclient.ui.ScrollBar;
import com.company.ui.SimpleText;

import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

public class GiftViewFrame extends Frame {
    private var gs:GameSprite;
    private var charList:_0K_R_;
    private var scrollBar:ScrollBar;

    private var giftHolder:Sprite;
    private var totalHeight:Number;
    private var holders:Vector.<itemHolder>;
    private var selectedHolder:itemHolder;
    private var holderMask:Shape;

    private var curPos:Number;

    public function GiftViewFrame(gameSprite:GameSprite, charList:_0K_R_) {
        super("Select Gifts", "Give", "Close", 450);

        this.gs = gameSprite;
        this.charList = charList;
        this.redraw();
        this._0E_n(300);
        this.Button1.addEventListener(MouseEvent.CLICK, this.onGiveClick);
        this.Button2.addEventListener(MouseEvent.CLICK, this.onCloseClick);
    }

    private function redraw():void {
        this.holders = new Vector.<itemHolder>();
        this.giftHolder = new Sprite();
        this.giftHolder.x = 20;
        this.giftHolder.y = 40;
        this.scrollBar = new ScrollBar(16, 300);

        this.holderMask = new Shape();
        this.holderMask.x = this.giftHolder.x;
        this.holderMask.y = this.giftHolder.y;
        this.holderMask.graphics.beginFill(0, 0);
        this.holderMask.graphics.drawRect(0, 0, 405, 300);
        this.holderMask.graphics.endFill();
        this.giftHolder.mask = this.holderMask;
        addChild(holderMask);

        var nextWidth:int = 0;
        var nextHeight:int = 4;
        var holder:itemHolder;

        var items:Vector.<item> = getItems();

        var lastStart:String = "A";
        var text:SimpleText = new SimpleText(26, 0xffffff);
        text.boldText(true);
        text.text = lastStart;
        text.y = 0;
        giftHolder.addChild(text);

        for each (var i:item in items) {

            if(i.name.substring(0, 1) != lastStart) {
                while ((nextWidth % 4) != 0) {
                    nextWidth++;
                    nextHeight++;
                }
                nextHeight += 4;
                text = new SimpleText(26, 0xffffff);
                text.boldText(true);
                text.text = lastStart = i.name.substring(0, 1).toUpperCase();
                text.y = giftHolder.height;
                giftHolder.addChild(text);
            }

            holder = new itemHolder(this.gs, ObjectLibrary.Items[i.id]);
            holder.x = ((nextWidth % 4) * itemHolder.WIDTH);
            holder.y = (Math.floor(nextHeight / 4) * itemHolder.HEIGHT);
            giftHolder.addChild(holder);
            holders.push(holder);
            holder.addEventListener(Event.COMPLETE, this.onDelete);
            holder.addEventListener(MouseEvent.CLICK, this.onHolderClick);
            nextWidth++;
            nextHeight++;
        }

        this.totalHeight = giftHolder.height;
        scrollBar._fA_(300, this.totalHeight);
        scrollBar.x = this.w_ - 20;
        scrollBar.y = 40;
        scrollBar.addEventListener(Event.CHANGE, this.onScroll);
        addChild(scrollBar);
        addChild(giftHolder);
    }

    private function getItems():Vector.<item> {
        var ret:Vector.<item> = new Vector.<item>();

        for each (var itemId:int in charList.gifts) {
            ret.push(new item(ObjectLibrary.Items[itemId]));
        }

        var reA:RegExp = /[^a-zA-Z]/g;
        var reN:RegExp = /[^0-9]/g;
        function sortAlphaNum(a:item, b:item):int {
            var aA:String = a.name.replace(reA, "");
            var bA:String = b.name.replace(reA, "");
            if(aA === bA) {
                var aN:int = parseInt(a.name.replace(reN, ""), 10);
                var bN:int = parseInt(b.name.replace(reN, ""), 10);
                return aN === bN ? 0 : aN > bN ? 1 : -1;
            }
            return aA > bA ? 1 : -1;
        }

        ret = ret.sort(sortAlphaNum);

        return ret;
    }

    override public function onAddedToStage(_arg1:Event):void {
        super.onAddedToStage(_arg1);
        this.Button1.y += 10;
        this.Button2.y += 10;
    }

    //holder region height: 300

    private function onGiveClick(event:MouseEvent):void {
        if(this.selectedHolder != null && charList.gifts.indexOf(this.selectedHolder.itemId) != -1) {
            gs.packetManager.getGift(this.selectedHolder.itemId, false);
            charList.gifts.splice(charList.gifts.indexOf(this.selectedHolder.itemId), 1);
            dispatchEvent(new Event(Event.COMPLETE));
        }
    }

    private function onHolderClick(event:MouseEvent):void {
        var holder:itemHolder = selectedHolder;
        if(holder != null) {
            holder.selected = false;
        }
        holder = (event.target as itemHolder);
        if(holder != null) {
            holder.selected = true;
        }
        selectedHolder = holder;
    }

    private function onCloseClick(event:MouseEvent):void {
        dispatchEvent(new Event(Event.COMPLETE));
    }

    private function onScroll(event:Event):void {
        var val:Number = ((-(this.scrollBar._Q_D_()) * (this.totalHeight - 300)));
        if(isNaN(val)) return;
        this.giftHolder.y = 40 + ((-(this.scrollBar._Q_D_()) * (this.totalHeight - 300)));
    }

    private function onDelete(e:Event):void {
        e.stopImmediatePropagation();
        var dialogBox:DialogBox = new DialogBox("Are you sure you want to delete this item?", "Confirm", "Delete", "Cancel");
        dialogBox.addEventListener(DialogBox.BUTTON1_EVENT, function(event:Event):void {
            gs.stage.removeChild(dialogBox);
            curPos = scrollBar._Q_D_();
            charList.gifts.splice(charList.gifts.indexOf(e.target.itemId), 1);
            removeChild(giftHolder);
            removeChild(scrollBar);
            removeChild(holderMask);
            redraw();

            scrollBar._0D__(curPos);
        });
        dialogBox.addEventListener(DialogBox.BUTTON2_EVENT, function(event:Event):void {
            gs.stage.removeChild(dialogBox);
        });
        gs.stage.addChild(dialogBox);
    }
}
}

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.assembleegameclient.ui.xButton;
import com.company.util.GraphicHelper;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

class item {

    public var name:String;
    public var id:int;

    public function item(item:XML) {
        name = item.hasOwnProperty("DisplayId") ? item.DisplayId : item.@id;
        id = item.@type;
    }
}

class itemHolder extends Sprite {

    public static const WIDTH:int = 100;
    public static const HEIGHT:int = 50;

    public var itemId:int = -1;

    private var mouseOver:Boolean;
    private var icon:Bitmap;
    private var closeX:xButton;

    private var _selected:Boolean;
    private var gs:GameSprite;

    public function itemHolder(gs:GameSprite, itemXml:XML) {
        itemId = itemXml.@type;
        this.gs = gs;
        icon = new Bitmap(ObjectLibrary.getRedrawnTextureFromType(itemXml.@type, itemXml.hasOwnProperty("ScaleValue") ?
            (itemXml.ScaleValue * 10 / 2) + 80 : 80, false, false, itemXml.hasOwnProperty("ScaleValue") ? itemXml.ScaleValue : 5));
        icon.x = ((WIDTH / 2) - (icon.width / 2));
        icon.y = ((HEIGHT / 2) - (icon.height / 2) - 5);
        addChild(icon);
        this.closeX = new xButton();
        this.closeX.event.add(deleteGift);
        this.closeX.x = WIDTH - (this.closeX.width + 2);
        this.closeX.y = 2;
        addChild(this.closeX);

        this.addEventListener(MouseEvent.ROLL_OVER, function(event:MouseEvent):void {
            mouseOver = true;
            draw();
        });
        this.addEventListener(MouseEvent.ROLL_OUT, function(event:MouseEvent):void {
            mouseOver = false;
            draw();
        });

        draw();
    }

    private function deleteGift():void {
        this.gs.packetManager.getGift(this.itemId, true);
        dispatchEvent(new Event(Event.COMPLETE));
    }

    private function draw():void {
        this.graphics.clear();
        this.graphics.beginFill(this.selected || mouseOver ? 0x363636 : 0x000000, 1.0);
        this.graphics.drawRect(0, 0, WIDTH, HEIGHT);
        this.graphics.endFill();

        GraphicHelper.createBorder(this, 1, this.selected ? 0xE5C100 : 0xffffff);
    }

    public override function get height():Number {
        return HEIGHT - 1;
    }

    public override function get width():Number {
        return WIDTH - 1;
    }

    public function get selected():Boolean {
        return _selected;
    }

    public function set selected(value:Boolean):void {
        _selected = value;
        draw();
    }
}
