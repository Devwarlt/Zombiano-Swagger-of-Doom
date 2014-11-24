/**
 * Created by Fabian on 24.11.2014.
 */
package Frames {

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.GameObject;
import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.assembleegameclient.ui.Inventory;
import com.company.assembleegameclient.ui.Slot;
import com.company.ui.SimpleText;

import flash.events.Event;
import flash.events.MouseEvent;
import flash.filters.GlowFilter;

public class LearnCraftingRecipeFrame extends Frame {

    public static var thisCraftingRecipeFrame:LearnCraftingRecipeFrame;

    private var _slot1:Inventory;
    private var _gs:GameSprite;
    private var _obj:GameObject;
    private var _text:SimpleText;
    private var currentItem_:int = -1;
    private var slotId_:int = 0;

    private var validGlow:GlowFilter = new GlowFilter(0x00FF08);
    private var invalidGlow:GlowFilter = new GlowFilter();

    private var _playerInvSprite:_playerInventory;

    public function LearnCraftingRecipeFrame(_arg1:GameSprite, _arg2:GameObject) {
        super("Learn Recipe", "Learn", "Cancel", "/learnCraftingRecipe", 200);
        this._gs = _arg1;
        this._obj = _arg2;

        thisCraftingRecipeFrame = this;

        this._0E_n(100);

        this._slot1 = new Inventory(this._gs, this._obj, "Recipe Book", new <int>[Slot.any_], 1, false);
        this._slot1.x = (this.w_ / 2) - (this._slot1.width / 2) - 10;
        this._slot1.y = (this.h_ / 2) - (this._slot1.height / 2) + 25;
        this._slot1.addEventListener(MouseEvent.CLICK, this.onSlotClicked);

        this._text = new SimpleText(16, 0xFFFFFF, false, this.w_, this.h_);
        this._text.multiline = true;
        this._text.boldText(true);
        this._text.text = "Click on the slot\nto select an item.";

        this._text.x = ((this.w_ / 2) - (this._text.textWidth / 2));
        this._text.y = 35;

        this.Button1.x = 10;
        this.Button1.clickAble(false);
        this.Button1.addEventListener(MouseEvent.CLICK, this.learnRecipe);
        this.Button2.addEventListener(MouseEvent.CLICK, this.onClose);

        this.addChild(this._slot1);
        this.addChild(this._text);
    }

    public override function onAddedToStage(param1:Event):void{
        super.onAddedToStage(param1);
        this.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    private function cleanup():void{
        this.removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    private function onEnterFrame(e:Event){
        this._slot1.draw(new <int>[this.currentItem_]);
    }

    public function onClose(param1:MouseEvent):void{
        if(this._playerInvSprite != null){
            stage.removeChild(this._playerInvSprite);
        }
        thisCraftingRecipeFrame = null;
        dispatchEvent(new Event(Event.COMPLETE));
        cleanup();
    }

    private function learnRecipe(param1:MouseEvent):void{
        this._gs.packetManager.learnCraftingRecipe(this.currentItem_, this.slotId_, int(ObjectLibrary.Items[this.currentItem_].Recipe.attribute("id")));
    }

    private function onSlotClicked(param1:MouseEvent):void{
        stage.addChild(this._playerInvSprite = new _playerInventory(this._gs, this._obj, this));
    }

    public function updateSlot(itemId:int, slotId:int):void{
        this.currentItem_ = itemId;
        this.slotId_ = slotId;

        if(itemId == -1 || itemId == 0){
            this.updateText("Click on the slot\nto select an item.");
            this._slot1.filters = [];
        }
        else {
            var _local1:XML = ObjectLibrary.Items[itemId];
            if (_local1.hasOwnProperty("Recipe")) {
                this.updateText("Click craft if you want\nto learn how too craft:\n" + _local1.Recipe);
                this._slot1.filters = [validGlow];
                this.Button1.clickAble(true);
            }
            else {
                this.updateText("This is not a valid\ncrafting book.");
                this._slot1.filters = [invalidGlow];
                this.Button1.clickAble(false);
            }
        }
        this._playerInvSprite = null;
    }

    public function updateText(_arg1:String, error:Boolean = false):void{
        this._text.textColor = error ? 0xFF0000 : 0xFFFFFF;
        this._text.text = _arg1;
        this._text.x = ((this.w_ / 2) - (this._text.textWidth / 2));
        this._text.y = 35;
    }
}
}

import Frames.LearnCraftingRecipeFrame;
import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.GameObject;
import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.assembleegameclient.ui.Inventory;
import com.company.assembleegameclient.ui.Slot;
import com.company.assembleegameclient.ui._E_6;
import com.company.util.GraphicHelper;

import flash.display.CapsStyle;
import flash.display.GraphicsPath;
import flash.display.GraphicsSolidFill;
import flash.display.GraphicsStroke;
import flash.display.IGraphicsData;
import flash.display.JointStyle;
import flash.display.LineScaleMode;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
import flash.filters.GlowFilter;

class _playerInventory extends Sprite {

    private var _slot0:Inventory;
    private var _slot1:Inventory;
    private var _slot2:Inventory;
    private var _slot3:Inventory;
    private var _slot4:Inventory;
    private var _slot5:Inventory;
    private var _slot6:Inventory;
    private var _slot7:Inventory;

    private var graphicsData_:Vector.<IGraphicsData>;

    protected var w_:int = 220;
    protected var h_:int = 120;
    private var background_:GraphicsSolidFill;
    private var outlineFill_:GraphicsSolidFill;
    private var stroke_:GraphicsStroke;
    private var path1_:GraphicsPath;
    private var path2_:GraphicsPath;
    private var gs_:GameSprite;
    private var obj_:GameObject;
    private var learnFrame_:LearnCraftingRecipeFrame;

    private var validGlow:GlowFilter = new GlowFilter(0x00FF08);
    private var invalidGlow:GlowFilter = new GlowFilter();

    public function _playerInventory(_arg1:GameSprite, _arg2:GameObject, _arg3:LearnCraftingRecipeFrame){
        this.gs_ = _arg1;
        this.obj_ = _arg2;
        this.learnFrame_ = _arg3;

        this.background_ = new GraphicsSolidFill(0x6B472E, 1);
        this.outlineFill_ = new GraphicsSolidFill(0xFFFFFF, 1);
        this.stroke_ = new GraphicsStroke(1, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3, this.outlineFill_);
        this.path1_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
        this.path2_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
        this.graphicsData_ = new <IGraphicsData>[background_, path2_, GraphicHelper.END_FILL, path1_, GraphicHelper.END_FILL, stroke_, path2_, GraphicHelper._H_B_];
        this.addEventListener(MouseEvent.CLICK, this.close);
        super();
        filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);

        this._slot0 = new Inventory(this.gs_, this.obj_, "Inventory", new <int>[Slot.any_], 1, false, 0);
        this._slot1 = new Inventory(this.gs_, this.obj_, "Inventory", new <int>[Slot.any_], 1, false, 1);
        this._slot2 = new Inventory(this.gs_, this.obj_, "Inventory", new <int>[Slot.any_], 1, false, 2);
        this._slot3 = new Inventory(this.gs_, this.obj_, "Inventory", new <int>[Slot.any_], 1, false, 3);
        this._slot4 = new Inventory(this.gs_, this.obj_, "Inventory", new <int>[Slot.any_], 1, false, 4);
        this._slot5 = new Inventory(this.gs_, this.obj_, "Inventory", new <int>[Slot.any_], 1, false, 5);
        this._slot6 = new Inventory(this.gs_, this.obj_, "Inventory", new <int>[Slot.any_], 1, false, 6);
        this._slot7 = new Inventory(this.gs_, this.obj_, "Inventory", new <int>[Slot.any_], 1, false, 7);

        this._slot0.addEventListener(MouseEvent.CLICK, this.onSlotClick);
        this._slot1.addEventListener(MouseEvent.CLICK, this.onSlotClick);
        this._slot2.addEventListener(MouseEvent.CLICK, this.onSlotClick);
        this._slot3.addEventListener(MouseEvent.CLICK, this.onSlotClick);
        this._slot4.addEventListener(MouseEvent.CLICK, this.onSlotClick);
        this._slot5.addEventListener(MouseEvent.CLICK, this.onSlotClick);
        this._slot6.addEventListener(MouseEvent.CLICK, this.onSlotClick);
        this._slot7.addEventListener(MouseEvent.CLICK, this.onSlotClick);

        this._slot0.x = 10;     this._slot1.x = 60;     this._slot2.x = 110;     this._slot3.x = 160;
        this._slot0.y = 10;     this._slot1.y = 10;     this._slot2.y = 10;     this._slot3.y = 10;

        this._slot4.x = 10;     this._slot5.x = 60;     this._slot6.x = 110;     this._slot7.x = 160;
        this._slot4.y = 60;     this._slot5.y = 60;     this._slot6.y = 60;     this._slot7.y = 60;

        this.addChild(this._slot0);
        this.addChild(this._slot1);
        this.addChild(this._slot2);
        this.addChild(this._slot3);
        this.addChild(this._slot4);
        this.addChild(this._slot5);
        this.addChild(this._slot6);
        this.addChild(this._slot7);
    }
    public function onAddedToStage(_arg1:Event):void{
        this.draw();
        this.x = ((800 / 2) - ((this.w_ - 6) / 2));
        this.y = ((600 / 2) - (this.height / 2));
        this.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    private function close(param1:Event):void{
        dispatchEvent(new Event(Event.COMPLETE));
    }

    private function onSlotClick(param1:Event):void{
        this.learnFrame_.updateSlot((param1.currentTarget as Inventory).slots_[0].objectType_, (param1.currentTarget as Inventory).slots_[0].id_ + 4);
        dispatchEvent(new Event(Event.COMPLETE));
        parent.removeChild(this);
    }

    private function onEnterFrame(_arg1:Event):void {

        this._slot0.draw(new <int>[this.gs_.map_.player_.equipment_[4]]);
        this._slot1.draw(new <int>[this.gs_.map_.player_.equipment_[5]]);
        this._slot2.draw(new <int>[this.gs_.map_.player_.equipment_[6]]);
        this._slot3.draw(new <int>[this.gs_.map_.player_.equipment_[7]]);
        this._slot4.draw(new <int>[this.gs_.map_.player_.equipment_[8]]);
        this._slot5.draw(new <int>[this.gs_.map_.player_.equipment_[9]]);
        this._slot6.draw(new <int>[this.gs_.map_.player_.equipment_[10]]);
        this._slot7.draw(new <int>[this.gs_.map_.player_.equipment_[11]]);

        if(this._slot0.slots_[0]._X_B_ != null) {
            if (!ObjectLibrary.Items[this._slot0.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                this._slot0.slots_[0]._X_B_.filters = _E_6._P_r;
                this._slot0.filters = [invalidGlow];
            }
            else {
                this._slot0.filters = [validGlow];
            }
        }
        if(this._slot1.slots_[0]._X_B_ != null) {
            if (!ObjectLibrary.Items[this._slot1.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                this._slot1.slots_[0]._X_B_.filters = _E_6._P_r;
                this._slot1.filters = [invalidGlow];
            }
            else {
                this._slot1.filters = [validGlow];
            }
        }
        if(this._slot2.slots_[0]._X_B_ != null) {
            if (!ObjectLibrary.Items[this._slot2.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                this._slot2.slots_[0]._X_B_.filters = _E_6._P_r;
                this._slot2.filters = [invalidGlow];
            }
            else {
                this._slot2.filters = [validGlow];
            }
        }
        if(this._slot3.slots_[0]._X_B_ != null) {
            if (!ObjectLibrary.Items[this._slot3.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                this._slot3.slots_[0]._X_B_.filters = _E_6._P_r;
                this._slot3.filters = [invalidGlow];
            }
            else {
                this._slot3.filters = [validGlow];
            }
        }
        if(this._slot4.slots_[0]._X_B_ != null) {
            if (!ObjectLibrary.Items[this._slot4.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                this._slot4.slots_[0]._X_B_.filters = _E_6._P_r;
                this._slot4.filters = [invalidGlow];
            }
            else {
                this._slot4.filters = [validGlow];
            }
        }
        if(this._slot5.slots_[0]._X_B_ != null) {
            if (!ObjectLibrary.Items[this._slot5.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                this._slot5.slots_[0]._X_B_.filters = _E_6._P_r;
                this._slot5.filters = [invalidGlow];
            }
            else {
                this._slot5.filters = [validGlow];
            }
        }
        if(this._slot6.slots_[0]._X_B_ != null) {
            if (!ObjectLibrary.Items[this._slot6.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                this._slot6.slots_[0]._X_B_.filters = _E_6._P_r;
                this._slot6.filters = [invalidGlow];
            }
            else {
                this._slot6.filters = [validGlow];
            }
        }
        if(this._slot7.slots_[0]._X_B_ != null) {
            if (!ObjectLibrary.Items[this._slot7.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                this._slot7.slots_[0]._X_B_.filters = _E_6._P_r;
                this._slot7.filters = [invalidGlow];
            }
            else {
                this._slot7.filters = [validGlow];
            }
        }
    }

    private function onRemovedFromStage(_arg1:Event):void{
        this.removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }
    public function draw():void{
        this.graphics.clear();
        GraphicHelper._0L_6(this.path1_);
        GraphicHelper.drawUI(-6, -6, this.w_, (20 + 12), 4, [1, 1, 0, 0], this.path1_);
        GraphicHelper._0L_6(this.path2_);
        GraphicHelper.drawUI(-6, -6, this.w_, this.h_, 4, [1, 1, 1, 1], this.path2_);
        this.graphics.drawGraphicsData(this.graphicsData_);
    }
}
