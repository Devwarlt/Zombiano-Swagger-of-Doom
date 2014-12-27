/**
 * Created by Fabian on 27.12.2014.
 */
package Frames {

import com.company.assembleegameclient.appengine._0K_R_;
import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.assembleegameclient.ui._0K_B_;

import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

public class GiftViewFrame extends Frame {
    private var gs:GameSprite;
    private var charList:_0K_R_;
    private var scrollBar:_0K_B_;

    private var giftHolder:Sprite;
    private var totalHeight:Number;
    private var holders:Vector.<itemHolder>;
    private var selectedHolder:itemHolder;

    public function GiftViewFrame(gameSprite:GameSprite, charList:_0K_R_) {
        super("Select Gifts", "Give", "Close", 450);

        this.gs = gameSprite;
        this.charList = charList;
        this.holders = new Vector.<itemHolder>();
        this.giftHolder = new Sprite();
        this.giftHolder.x = 20;
        this.giftHolder.y = 40;
        this.scrollBar = new _0K_B_(16, 300);
        this._0E_n(300);

        var holderMask:Shape = new Shape();
        holderMask.x = this.giftHolder.x;
        holderMask.y = this.giftHolder.y;
        holderMask.graphics.beginFill(0, 0);
        holderMask.graphics.drawRect(0, 0, 405, 300);
        holderMask.graphics.endFill();
        giftHolder.mask = holderMask;
        addChild(holderMask);

        var nextWidth:int = 0;
        var nextHeight:int = 0;
        var holder:itemHolder;

        for each (var itemId:int in charList.gifts) {
            holder = new itemHolder(ObjectLibrary.Items[itemId]);
            holder.x = ((nextWidth % 4) * itemHolder.WIDTH);
            holder.y = (nextHeight * itemHolder.HEIGHT);
            giftHolder.addChild(holder);
            holders.push(holder);
            holder.addEventListener(MouseEvent.CLICK, this.onHolderClick);
            nextWidth++;
            if((nextWidth % 4) == 0) {
                nextHeight++;
            }
        }

        this.totalHeight = giftHolder.height;
        scrollBar._fA_(300, this.totalHeight);
        scrollBar.x = this.w_ - 20;
        scrollBar.y = 40;
        scrollBar.addEventListener(Event.CHANGE, this.onScroll);
        addChild(scrollBar);
        addChild(giftHolder);

        this.Button1.addEventListener(MouseEvent.CLICK, this.onGiveClick);
        this.Button2.addEventListener(MouseEvent.CLICK, this.onCloseClick);
    }

    override public function onAddedToStage(_arg1:Event):void {
        super.onAddedToStage(_arg1);
        this.Button1.y += 10;
        this.Button2.y += 10;
    }

    //holder region height: 300

    private function onGiveClick(event:MouseEvent):void {
        if(this.selectedHolder != null && charList.gifts.indexOf(this.selectedHolder.itemId) != -1) {
            gs.packetManager.getGift(this.selectedHolder.itemId);
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
        holder.selected = true;
        selectedHolder = holder;
    }

    private function onCloseClick(event:MouseEvent):void {
        dispatchEvent(new Event(Event.COMPLETE));
    }

    private function onScroll(event:Event):void {
        this.giftHolder.y = 40 + ((-(this.scrollBar._Q_D_()) * (this.totalHeight - 300)));
    }
}
}

import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.util.GraphicHelper;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.MouseEvent;

class itemHolder extends Sprite {

    public static const WIDTH:int = 100;
    public static const HEIGHT:int = 50;

    public var itemId:int = -1;

    private var mouseOver:Boolean;
    private var icon:Bitmap;

    private var _selected:Boolean;

    public function itemHolder(itemXml:XML) {
        itemId = itemXml.@type;
        icon = new Bitmap(ObjectLibrary.getRedrawnTextureFromType(itemXml.@type, itemXml.hasOwnProperty("ScaleValue") ?
            (itemXml.ScaleValue * 10 / 2) + 80 : 80, false, false, itemXml.hasOwnProperty("ScaleValue") ? itemXml.ScaleValue : 5));
        icon.x = ((WIDTH / 2) - (icon.width / 2));
        icon.y = ((HEIGHT / 2) - (icon.height / 2) - 5);
        addChild(icon);

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
