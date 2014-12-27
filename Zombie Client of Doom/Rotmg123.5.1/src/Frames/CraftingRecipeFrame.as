/**
 * Created by Fabian on 23.11.2014.
 */
package Frames {

import AccountManagement.ui.FancyTextButton;

import FPC.Embeds.Images.craftingRecipeBookEmbed_;

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.CraftingTerminal;
import com.company.assembleegameclient.objects.GameObject;
import com.company.assembleegameclient.ui.Inventory;
import com.company.assembleegameclient.ui.Slot;
import com.company.assembleegameclient.ui.boxButton;
import com.company.assembleegameclient.ui.xButton;
import com.company.ui.SimpleText;
import com.company.util._H_V_;

import flash.display.DisplayObject;
import flash.display.Shape;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
import flash.filters.GlowFilter;

public class CraftingRecipeFrame extends Sprite {

    private var gs_:GameSprite;
    private var obj_:GameObject;

    private var dimScreen:Shape;
    private var backgroundBook:DisplayObject;

    private var frameTitle:SimpleText;
    private var site1Text:SimpleText;
    private var site2Text:SimpleText;
    private var bookTitle1:SimpleText;
    private var bookTitle2:SimpleText;

    private var nextButton:FancyTextButton;
    private var prevButton:FancyTextButton;
    private var closeButton:xButton;

    private var slot1_:Inventory;
    private var slot2_:Inventory;
    private var slot3_:Inventory;
    private var slot4_:Inventory;
    private var slot5_:Inventory;
    private var slot6_:Inventory;
    private var slot7_:Inventory;
    private var slot8_:Inventory;
    private var slot9_:Inventory;
    private var output_:Inventory;

    private var siteNumber:int = 0;
    private var site1:int = 1;
    private var site2:int = 2;

    private var _xCenterRight:Number;
    private var _xCenterLeft:Number;
    private var _yCenterLeft:Number;

    private var activeGlowFilter:GlowFilter;
    private var restrictedGlowFilter:GlowFilter;

    public function CraftingRecipeFrame(_gs:GameSprite, _obj:GameObject) {
        this.gs_ = _gs;
        this.obj_ = _obj;

        this.activeGlowFilter = new GlowFilter(0x00FF08);
        this.restrictedGlowFilter = new GlowFilter();

        this.dimScreen = new Shape();
        this.dimScreen.graphics.clear();
        this.dimScreen.graphics.beginFill(0, 0.8);
        this.dimScreen.graphics.drawRect(0, 0, 800, 600);
        this.dimScreen.graphics.endFill();

        this.slot1_ = new Inventory(_gs, _obj, "Input", new <int>[Slot.any_], 1, false, 0);
        this.slot2_ = new Inventory(_gs, _obj, "Input", new <int>[Slot.any_], 1, false, 1);
        this.slot3_ = new Inventory(_gs, _obj, "Input", new <int>[Slot.any_], 1, false, 2);
        this.slot4_ = new Inventory(_gs, _obj, "Input", new <int>[Slot.any_], 1, false, 3);
        this.slot5_ = new Inventory(_gs, _obj, "Input", new <int>[Slot.any_], 1, false, 4);
        this.slot6_ = new Inventory(_gs, _obj, "Input", new <int>[Slot.any_], 1, false, 5);
        this.slot7_ = new Inventory(_gs, _obj, "Input", new <int>[Slot.any_], 1, false, 6);
        this.slot8_ = new Inventory(_gs, _obj, "Input", new <int>[Slot.any_], 1, false, 7);
        this.slot9_ = new Inventory(_gs, _obj, "Input", new <int>[Slot.any_], 1, false, 8);
        this.output_ = new Inventory(_gs, _obj, "Output", new <int>[-10], 1, false, 9);

        this.slot1_.filters = [new GlowFilter(0x000000, 1.0, 10, 10)];
        this.slot2_.filters = [new GlowFilter(0x000000, 1.0, 10, 10)];
        this.slot3_.filters = [new GlowFilter(0x000000, 1.0, 10, 10)];
        this.slot4_.filters = [new GlowFilter(0x000000, 1.0, 10, 10)];
        this.slot5_.filters = [new GlowFilter(0x000000, 1.0, 10, 10)];
        this.slot6_.filters = [new GlowFilter(0x000000, 1.0, 10, 10)];
        this.slot7_.filters = [new GlowFilter(0x000000, 1.0, 10, 10)];
        this.slot8_.filters = [new GlowFilter(0x000000, 1.0, 10, 10)];
        this.slot9_.filters = [new GlowFilter(0x000000, 1.0, 10, 10)];
        this.output_.filters = [new GlowFilter(0x000000, 1.0, 10, 10)];

        _xCenterLeft = (800 / 2) - ((40 + 10) * 3);
        _xCenterRight = (800 / 2) + ((40) * 3);
        _yCenterLeft = (600 / 2) - (40 / 2);

        this.backgroundBook = new craftingRecipeBookEmbed_();
        this.backgroundBook.x = ((800 - this.backgroundBook.width) / 2);
        this.backgroundBook.y = ((600 - this.backgroundBook.height) / 2);
        this.backgroundBook.filters = [new GlowFilter(0x00000, 1.0, 10, 10), new GlowFilter(0x00000, 1.0, 20, 20, 3, 1, true)];//0x00FF08

        this.frameTitle = new SimpleText(46, 0xFFFFFF);
        this.frameTitle.text = "Crafting Recipes";
        this.frameTitle.boldText(true);
        this.frameTitle.width = this.frameTitle.textWidth + 10;
        this.frameTitle.x = ((800 / 2) - this.frameTitle.textWidth / 2);
        this.frameTitle.y = 25;
        this.frameTitle.filters = [new DropShadowFilter()];

        this.site1Text = new SimpleText(32, 0x000000);
        this.site1Text.text = String(site1);
        this.site1Text.boldText(true);
        this.site1Text.x = (_xCenterLeft - (this.site1Text.textWidth / 2)) + (this.slot4_.width / 2);
        this.site1Text.y = 425;

        this.site2Text = new SimpleText(32, 0x000000);
        this.site2Text.text = String(site2);
        this.site2Text.boldText(true);
        this.site2Text.x = (_xCenterRight - (this.site2Text.textWidth / 2));
        this.site2Text.y = 425;

        this.nextButton = new FancyTextButton(20, "Next");
        this.nextButton.x = _xCenterRight + this.site2Text.textWidth + 20;
        this.nextButton.y = 430;
        this.nextButton.addEventListener(MouseEvent.CLICK, this.onNextClicked);

        this.prevButton = new FancyTextButton(20, "Previous");
        this.prevButton.x = _xCenterLeft - this.prevButton.width - 10;
        this.prevButton.y = 430;
        this.prevButton.addEventListener(MouseEvent.CLICK, this.onPrevClicked);

        this.closeButton = new xButton();
        this.closeButton.x = 795 - this.closeButton.width;
        this.closeButton.y = 5;
        this.closeButton.addEventListener(MouseEvent.CLICK, this.onClose);

        this.bookTitle1 = new SimpleText(32, 0x000000, false, 200, 200);
        this.bookTitle1.text = "Input";
        this.bookTitle1.boldText(true);
        this.bookTitle1.x = (_xCenterLeft - (this.bookTitle1.textWidth / 2)) + (this.slot4_.width / 2);
        this.bookTitle1.y = 125;

        this.bookTitle2 = new SimpleText(32, 0x000000, false, 200, 200);
        this.bookTitle2.text = "Output";
        this.bookTitle2.boldText(true);
        this.bookTitle2.x = (_xCenterRight - (this.bookTitle2.textWidth / 2));
        this.bookTitle2.y = 125;

        this.slot1_.x = (_xCenterLeft - 50);    this.slot2_.x = (_xCenterLeft);         this.slot3_.x = (_xCenterLeft + 50);
        this.slot1_.y = (_yCenterLeft - 50);    this.slot2_.y = (_yCenterLeft - 50);    this.slot3_.y = (_yCenterLeft - 50);

        this.slot4_.x = (_xCenterLeft - 50);    this.slot5_.x = (_xCenterLeft);         this.slot6_.x = (_xCenterLeft + 50);    this.output_.x = (_xCenterRight - (this.output_.width / 2));
        this.slot4_.y = (_yCenterLeft);         this.slot5_.y = (_yCenterLeft);         this.slot6_.y = (_yCenterLeft);         this.output_.y = (_yCenterLeft);

        this.slot7_.x = (_xCenterLeft - 50);    this.slot8_.x = (_xCenterLeft);         this.slot9_.x = (_xCenterLeft + 50);
        this.slot7_.y = (_yCenterLeft + 50);    this.slot8_.y = (_yCenterLeft + 50);    this.slot9_.y = (_yCenterLeft + 50);

        this.addChild(this.dimScreen);
        this.addChild(this.backgroundBook);
        this.addChild(this.frameTitle);
        this.addChild(this.site1Text);
        this.addChild(this.site2Text);
        this.addChild(this.nextButton);
        this.addChild(this.prevButton);
        this.addChild(this.bookTitle1);
        this.addChild(this.bookTitle2);

        this.addChild(this.slot1_);
        this.addChild(this.slot2_);
        this.addChild(this.slot3_);

        this.addChild(this.slot4_);
        this.addChild(this.slot5_);
        this.addChild(this.slot6_);

        this.addChild(this.slot7_);
        this.addChild(this.slot8_);
        this.addChild(this.slot9_);

        this.addChild(this.output_);
        this.addChild(this.closeButton);

        this.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        this.addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        this.addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }

    public function onAddedToStage(param1:Event):void {
        stage.addEventListener(KeyboardEvent.KEY_DOWN, this.onKeyDown)
    }

    public function onRemovedFromStage(param1:Event):void {
        stage.removeEventListener(KeyboardEvent.KEY_DOWN, this.onKeyDown)
    }

    public function onKeyDown(param1:KeyboardEvent):void{
        if(param1.keyCode == _H_V_.RIGHT) {
            if(this.nextButton.mouseEnabled) {
                this.onNextClicked(new MouseEvent(MouseEvent.CLICK));
            }
        }
        if(param1.keyCode == _H_V_.LEFT) {
            if(this.prevButton.mouseEnabled) {
                this.onPrevClicked(new MouseEvent(MouseEvent.CLICK));
            }
        }
    }

    public function onEnterFrame(param1:Event):void {
        if(siteNumber < CraftingTerminal.recipes.length) {
            var inputItems:Array = CraftingTerminal.recipes[siteNumber].split(';')[0].split(',');
            var outputItem:int = CraftingTerminal.recipes[siteNumber].split(";")[1];

            this.slot1_.draw(new <int>[inputItems[0] == 0 ? -1 : inputItems[0]]);
            this.slot2_.draw(new <int>[inputItems[1] == 0 ? -1 : inputItems[1]]);
            this.slot3_.draw(new <int>[inputItems[2] == 0 ? -1 : inputItems[2]]);
            this.slot4_.draw(new <int>[inputItems[3] == 0 ? -1 : inputItems[3]]);
            this.slot5_.draw(new <int>[inputItems[4] == 0 ? -1 : inputItems[4]]);
            this.slot6_.draw(new <int>[inputItems[5] == 0 ? -1 : inputItems[5]]);
            this.slot7_.draw(new <int>[inputItems[6] == 0 ? -1 : inputItems[6]]);
            this.slot8_.draw(new <int>[inputItems[7] == 0 ? -1 : inputItems[7]]);
            this.slot9_.draw(new <int>[inputItems[8] == 0 ? -1 : inputItems[8]]);
            this.output_.draw(new <int>[outputItem == 0 ? -1 : outputItem]);
        }

        nextButton.enabled(siteNumber + 1 < CraftingTerminal.recipes.length);
        prevButton.enabled(siteNumber > 0);

        //nextButton.filters = [nextButton.mouseEnabled ? activeGlowFilter : restrictedGlowFilter];
        //prevButton.filters = [prevButton.mouseEnabled ? activeGlowFilter : restrictedGlowFilter];
    }

    public function onClose(param1:MouseEvent) : void {
        dispatchEvent(new Event(Event.COMPLETE));
        this.removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        parent.removeChild(this);
    }

    public function onPrevClicked(param1:MouseEvent):void {
        if(siteNumber > 0) siteNumber--;
        updateSiteText(false);
    }

    public function onNextClicked(param1:MouseEvent):void {
        if(siteNumber + 1 < CraftingTerminal.recipes.length) siteNumber++;
        updateSiteText(true);
    }

    public function updateSiteText(add:Boolean):void{
        if(add) {
            site1 += 2;
            site2 += 2;
        }
        else {
            site1 -= 2;
            site2 -= 2;
        }

        this.site1Text.text = String(site1);
        this.site2Text.text = String(site2);

        this.site1Text.x = (_xCenterLeft - (this.site1Text.textWidth / 2)) + (40 / 2);
        this.site1Text.y = 425;
        this.site2Text.x = (_xCenterRight - (this.site2Text.textWidth / 2));
        this.site2Text.y = 425;
    }
}
}
