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
 * Created by Fabian on 24.11.2014.
 */
package Frames {

import Crafting.LearnCraftingResultEvent;

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
        super("Learn Recipe", "Learn", "Cancel", 200);
        this.w_ = 200;
        this._gs = _arg1;
        this._obj = _arg2;

        this._0E_n(100);

        this._slot1 = new Inventory(this._gs, this._obj, "Recipe Book", new <int>[Slot.any_], 1, false);
        this._slot1.x = (this.w_ / 2) - (this._slot1.width / 2) - 10;
        this._slot1.y = (this.h_ / 2) - (this._slot1.height / 2) + 25;
        this._slot1.addEventListener(MouseEvent.CLICK, this.onSlotClicked);

        this._text = new SimpleText(16, 0xFFFFFF, false, 150, 50);
        this._text.multiline = true;
        this._text.boldText(true);
        this._text.text = "Click on the slot\nto select an item.";
        this._text.updateMetrics();

        this._text.x = ((this.w_ / 2) - (this._text.textWidth / 2));
        this._text.y = 35;

        this.Button1.x = 10;
        this.Button1.clickAble(false);
        this.Button1.addEventListener(MouseEvent.CLICK, this.learnRecipe);
        this.Button2.addEventListener(MouseEvent.CLICK, this.onClose);

        this.addChild(this._slot1);
        this.addChild(this._text);
    }

    public override function onAddedToStage(param1:Event):void {
        super.onAddedToStage(param1);
        this.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    private function cleanup():void {
        this.removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    private function onEnterFrame(e:Event):void {
        this._slot1.draw(new <int>[this.currentItem_]);
    }

    private function onClose(param1:MouseEvent):void {
        if (this._playerInvSprite != null) {
            stage.removeChild(this._playerInvSprite);
        }
        dispatchEvent(new Event(Event.COMPLETE));
        cleanup();
    }

    private function learnRecipe(param1:MouseEvent):void {
        this._gs.addEventListener(LearnCraftingResultEvent.LEARN_CRAFTING_RESULT, this.onLearnResult);
        this._gs.packetManager.learnCraftingRecipe(this.currentItem_, this.slotId_, int(ObjectLibrary.Items[this.currentItem_].Recipe.attribute("id")));
    }

    private function onSlotClicked(param1:MouseEvent):void {
        stage.addChild(this._playerInvSprite = new _playerInventory(this._gs, this._obj, this));
    }

    public function updateSlot(itemId:int, slotId:int):void {
        this.currentItem_ = itemId;
        this.slotId_ = slotId;

        if (itemId == -1 || itemId == 0) {
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

    private function updateText(_arg1:String, error:Boolean = false):void {
        this._text.textColor = error ? 0xFF0000 : 0xFFFFFF;
        this._text.text = _arg1;
        this._text.x = ((this.w_ / 2) - (this._text.textWidth / 2));
        this._text.y = 35;
        this._text.updateMetrics();
    }

    private function onLearnResult(event:LearnCraftingResultEvent):void {
        this._gs.removeEventListener(LearnCraftingResultEvent.LEARN_CRAFTING_RESULT, this.onLearnResult);
        if (event.success) {
            onClose(new MouseEvent(MouseEvent.CLICK));
        }
        else {
            updateText(event.result, true);
        }
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

    private var _slot8:Inventory;
    private var _slot9:Inventory;
    private var _slot10:Inventory;
    private var _slot11:Inventory;
    private var _slot12:Inventory;
    private var _slot13:Inventory;
    private var _slot14:Inventory;
    private var _slot15:Inventory;

    private var _slot16:Inventory;
    private var _slot17:Inventory;
    private var _slot18:Inventory;
    private var _slot19:Inventory;
    private var _slot20:Inventory;
    private var _slot21:Inventory;
    private var _slot22:Inventory;
    private var _slot23:Inventory;

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

    public function _playerInventory(_arg1:GameSprite, _arg2:GameObject, _arg3:LearnCraftingRecipeFrame) {
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

        this._slot0.x = 10;
        this._slot1.x = 60;
        this._slot2.x = 110;
        this._slot3.x = 160;
        this._slot0.y = 10;
        this._slot1.y = 10;
        this._slot2.y = 10;
        this._slot3.y = 10;

        this._slot4.x = 10;
        this._slot5.x = 60;
        this._slot6.x = 110;
        this._slot7.x = 160;
        this._slot4.y = 60;
        this._slot5.y = 60;
        this._slot6.y = 60;
        this._slot7.y = 60;

        this.addChild(this._slot0);
        this.addChild(this._slot1);
        this.addChild(this._slot2);
        this.addChild(this._slot3);
        this.addChild(this._slot4);
        this.addChild(this._slot5);
        this.addChild(this._slot6);
        this.addChild(this._slot7);

        if (gs_.map_.player_.backpack1 != null) {

            this._slot8 = new Inventory(this.gs_, this.obj_, "Backpack", new <int>[Slot.any_], 1, false, 8);
            this._slot9 = new Inventory(this.gs_, this.obj_, "Backpack", new <int>[Slot.any_], 1, false, 9);
            this._slot10 = new Inventory(this.gs_, this.obj_, "Backpack", new <int>[Slot.any_], 1, false, 10);
            this._slot11 = new Inventory(this.gs_, this.obj_, "Backpack", new <int>[Slot.any_], 1, false, 11);
            this._slot12 = new Inventory(this.gs_, this.obj_, "Backpack", new <int>[Slot.any_], 1, false, 12);
            this._slot13 = new Inventory(this.gs_, this.obj_, "Backpack", new <int>[Slot.any_], 1, false, 13);
            this._slot14 = new Inventory(this.gs_, this.obj_, "Backpack", new <int>[Slot.any_], 1, false, 14);
            this._slot15 = new Inventory(this.gs_, this.obj_, "Backpack", new <int>[Slot.any_], 1, false, 15);

            this._slot8.addEventListener(MouseEvent.CLICK, this.onSlotClick);
            this._slot9.addEventListener(MouseEvent.CLICK, this.onSlotClick);
            this._slot10.addEventListener(MouseEvent.CLICK, this.onSlotClick);
            this._slot11.addEventListener(MouseEvent.CLICK, this.onSlotClick);
            this._slot12.addEventListener(MouseEvent.CLICK, this.onSlotClick);
            this._slot13.addEventListener(MouseEvent.CLICK, this.onSlotClick);
            this._slot14.addEventListener(MouseEvent.CLICK, this.onSlotClick);
            this._slot15.addEventListener(MouseEvent.CLICK, this.onSlotClick);

            this._slot8.x = 10;
            this._slot9.x = 60;
            this._slot10.x = 110;
            this._slot11.x = 160;
            this._slot8.y = this.h_ + 10;
            this._slot9.y = this.h_ + 10;
            this._slot10.y = this.h_ + 10;
            this._slot11.y = this.h_ + 10;

            this._slot12.x = 10;
            this._slot13.x = 60;
            this._slot14.x = 110;
            this._slot15.x = 160;
            this._slot12.y = this.h_ + 60;
            this._slot13.y = this.h_ + 60;
            this._slot14.y = this.h_ + 60;
            this._slot15.y = this.h_ + 60;

            this.addChild(this._slot8);
            this.addChild(this._slot9);
            this.addChild(this._slot10);
            this.addChild(this._slot11);
            this.addChild(this._slot12);
            this.addChild(this._slot13);
            this.addChild(this._slot14);
            this.addChild(this._slot15);

            this.h_ += 120;
        }

        if (gs_.map_.player_.backpack2 != null) {

            this._slot16 = new Inventory(this.gs_, this.obj_, "Backpack", new <int>[Slot.any_], 1, false, 16);
            this._slot17 = new Inventory(this.gs_, this.obj_, "Backpack", new <int>[Slot.any_], 1, false, 17);
            this._slot18 = new Inventory(this.gs_, this.obj_, "Backpack", new <int>[Slot.any_], 1, false, 18);
            this._slot19 = new Inventory(this.gs_, this.obj_, "Backpack", new <int>[Slot.any_], 1, false, 19);
            this._slot20 = new Inventory(this.gs_, this.obj_, "Backpack", new <int>[Slot.any_], 1, false, 20);
            this._slot21 = new Inventory(this.gs_, this.obj_, "Backpack", new <int>[Slot.any_], 1, false, 21);
            this._slot22 = new Inventory(this.gs_, this.obj_, "Backpack", new <int>[Slot.any_], 1, false, 22);
            this._slot23 = new Inventory(this.gs_, this.obj_, "Backpack", new <int>[Slot.any_], 1, false, 23);

            this._slot16.addEventListener(MouseEvent.CLICK, this.onSlotClick);
            this._slot17.addEventListener(MouseEvent.CLICK, this.onSlotClick);
            this._slot18.addEventListener(MouseEvent.CLICK, this.onSlotClick);
            this._slot19.addEventListener(MouseEvent.CLICK, this.onSlotClick);
            this._slot20.addEventListener(MouseEvent.CLICK, this.onSlotClick);
            this._slot21.addEventListener(MouseEvent.CLICK, this.onSlotClick);
            this._slot22.addEventListener(MouseEvent.CLICK, this.onSlotClick);
            this._slot23.addEventListener(MouseEvent.CLICK, this.onSlotClick);

            this._slot16.x = 10;
            this._slot17.x = 60;
            this._slot18.x = 110;
            this._slot19.x = 160;
            this._slot16.y = this.h_ + 10;
            this._slot17.y = this.h_ + 10;
            this._slot18.y = this.h_ + 10;
            this._slot19.y = this.h_ + 10;

            this._slot20.x = 10;
            this._slot21.x = 60;
            this._slot22.x = 110;
            this._slot23.x = 160;
            this._slot20.y = this.h_ + 60;
            this._slot21.y = this.h_ + 60;
            this._slot22.y = this.h_ + 60;
            this._slot23.y = this.h_ + 60;

            this.addChild(this._slot16);
            this.addChild(this._slot17);
            this.addChild(this._slot18);
            this.addChild(this._slot19);
            this.addChild(this._slot20);
            this.addChild(this._slot21);
            this.addChild(this._slot22);
            this.addChild(this._slot23);

            this.h_ += 120;
        }
    }

    public function onAddedToStage(_arg1:Event):void {
        this.draw();
        this.x = ((800 / 2) - ((this.w_ - 6) / 2));
        this.y = ((600 / 2) - (this.height / 2));
        this.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    private function close(param1:Event):void {
        dispatchEvent(new Event(Event.COMPLETE));
    }

    private function onSlotClick(param1:Event):void {
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

        if (this.gs_.map_.player_.backpack1 != null) {
            this._slot8.draw(new <int>[this.gs_.map_.player_.backpack1[0]]);
            this._slot9.draw(new <int>[this.gs_.map_.player_.backpack1[1]]);
            this._slot10.draw(new <int>[this.gs_.map_.player_.backpack1[2]]);
            this._slot11.draw(new <int>[this.gs_.map_.player_.backpack1[3]]);
            this._slot12.draw(new <int>[this.gs_.map_.player_.backpack1[4]]);
            this._slot13.draw(new <int>[this.gs_.map_.player_.backpack1[5]]);
            this._slot14.draw(new <int>[this.gs_.map_.player_.backpack1[6]]);
            this._slot15.draw(new <int>[this.gs_.map_.player_.backpack1[7]]);
        }

        if (this.gs_.map_.player_.backpack2 != null) {
            this._slot16.draw(new <int>[this.gs_.map_.player_.backpack2[0]]);
            this._slot17.draw(new <int>[this.gs_.map_.player_.backpack2[1]]);
            this._slot18.draw(new <int>[this.gs_.map_.player_.backpack2[2]]);
            this._slot19.draw(new <int>[this.gs_.map_.player_.backpack2[3]]);
            this._slot20.draw(new <int>[this.gs_.map_.player_.backpack2[4]]);
            this._slot21.draw(new <int>[this.gs_.map_.player_.backpack2[5]]);
            this._slot22.draw(new <int>[this.gs_.map_.player_.backpack2[6]]);
            this._slot23.draw(new <int>[this.gs_.map_.player_.backpack2[7]]);
        }

        if (this._slot0.slots_[0]._X_B_ != null) {
            if (!ObjectLibrary.Items[this._slot0.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                this._slot0.slots_[0]._X_B_.filters = _E_6._P_r;
                this._slot0.filters = [invalidGlow];
            }
            else {
                this._slot0.filters = [validGlow];
            }
        }
        if (this._slot1.slots_[0]._X_B_ != null) {
            if (!ObjectLibrary.Items[this._slot1.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                this._slot1.slots_[0]._X_B_.filters = _E_6._P_r;
                this._slot1.filters = [invalidGlow];
            }
            else {
                this._slot1.filters = [validGlow];
            }
        }
        if (this._slot2.slots_[0]._X_B_ != null) {
            if (!ObjectLibrary.Items[this._slot2.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                this._slot2.slots_[0]._X_B_.filters = _E_6._P_r;
                this._slot2.filters = [invalidGlow];
            }
            else {
                this._slot2.filters = [validGlow];
            }
        }
        if (this._slot3.slots_[0]._X_B_ != null) {
            if (!ObjectLibrary.Items[this._slot3.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                this._slot3.slots_[0]._X_B_.filters = _E_6._P_r;
                this._slot3.filters = [invalidGlow];
            }
            else {
                this._slot3.filters = [validGlow];
            }
        }
        if (this._slot4.slots_[0]._X_B_ != null) {
            if (!ObjectLibrary.Items[this._slot4.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                this._slot4.slots_[0]._X_B_.filters = _E_6._P_r;
                this._slot4.filters = [invalidGlow];
            }
            else {
                this._slot4.filters = [validGlow];
            }
        }
        if (this._slot5.slots_[0]._X_B_ != null) {
            if (!ObjectLibrary.Items[this._slot5.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                this._slot5.slots_[0]._X_B_.filters = _E_6._P_r;
                this._slot5.filters = [invalidGlow];
            }
            else {
                this._slot5.filters = [validGlow];
            }
        }
        if (this._slot6.slots_[0]._X_B_ != null) {
            if (!ObjectLibrary.Items[this._slot6.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                this._slot6.slots_[0]._X_B_.filters = _E_6._P_r;
                this._slot6.filters = [invalidGlow];
            }
            else {
                this._slot6.filters = [validGlow];
            }
        }
        if (this._slot7.slots_[0]._X_B_ != null) {
            if (!ObjectLibrary.Items[this._slot7.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                this._slot7.slots_[0]._X_B_.filters = _E_6._P_r;
                this._slot7.filters = [invalidGlow];
            }
            else {
                this._slot7.filters = [validGlow];
            }
        }
        if (this.gs_.map_.player_.backpack1 != null) {
            if (this._slot8.slots_[0]._X_B_ != null) {
                if (!ObjectLibrary.Items[this._slot8.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                    this._slot8.slots_[0]._X_B_.filters = _E_6._P_r;
                    this._slot8.filters = [invalidGlow];
                }
                else {
                    this._slot8.filters = [validGlow];
                }
            }
            if (this._slot9.slots_[0]._X_B_ != null) {
                if (!ObjectLibrary.Items[this._slot9.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                    this._slot9.slots_[0]._X_B_.filters = _E_6._P_r;
                    this._slot9.filters = [invalidGlow];
                }
                else {
                    this._slot9.filters = [validGlow];
                }
            }
            if (this._slot10.slots_[0]._X_B_ != null) {
                if (!ObjectLibrary.Items[this._slot10.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                    this._slot10.slots_[0]._X_B_.filters = _E_6._P_r;
                    this._slot10.filters = [invalidGlow];
                }
                else {
                    this._slot10.filters = [validGlow];
                }
            }
            if (this._slot11.slots_[0]._X_B_ != null) {
                if (!ObjectLibrary.Items[this._slot11.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                    this._slot11.slots_[0]._X_B_.filters = _E_6._P_r;
                    this._slot11.filters = [invalidGlow];
                }
                else {
                    this._slot11.filters = [validGlow];
                }
            }
            if (this._slot12.slots_[0]._X_B_ != null) {
                if (!ObjectLibrary.Items[this._slot12.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                    this._slot12.slots_[0]._X_B_.filters = _E_6._P_r;
                    this._slot12.filters = [invalidGlow];
                }
                else {
                    this._slot12.filters = [validGlow];
                }
            }
            if (this._slot13.slots_[0]._X_B_ != null) {
                if (!ObjectLibrary.Items[this._slot13.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                    this._slot13.slots_[0]._X_B_.filters = _E_6._P_r;
                    this._slot13.filters = [invalidGlow];
                }
                else {
                    this._slot13.filters = [validGlow];
                }
            }
            if (this._slot14.slots_[0]._X_B_ != null) {
                if (!ObjectLibrary.Items[this._slot14.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                    this._slot14.slots_[0]._X_B_.filters = _E_6._P_r;
                    this._slot14.filters = [invalidGlow];
                }
                else {
                    this._slot14.filters = [validGlow];
                }
            }
            if (this._slot15.slots_[0]._X_B_ != null) {
                if (!ObjectLibrary.Items[this._slot15.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                    this._slot15.slots_[0]._X_B_.filters = _E_6._P_r;
                    this._slot15.filters = [invalidGlow];
                }
                else {
                    this._slot15.filters = [validGlow];
                }
            }
        }
        if (this.gs_.map_.player_.backpack2 != null) {
            if (this._slot16.slots_[0]._X_B_ != null) {
                if (!ObjectLibrary.Items[this._slot16.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                    this._slot16.slots_[0]._X_B_.filters = _E_6._P_r;
                    this._slot16.filters = [invalidGlow];
                }
                else {
                    this._slot16.filters = [validGlow];
                }
            }
            if (this._slot17.slots_[0]._X_B_ != null) {
                if (!ObjectLibrary.Items[this._slot17.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                    this._slot17.slots_[0]._X_B_.filters = _E_6._P_r;
                    this._slot17.filters = [invalidGlow];
                }
                else {
                    this._slot17.filters = [validGlow];
                }
            }
            if (this._slot18.slots_[0]._X_B_ != null) {
                if (!ObjectLibrary.Items[this._slot18.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                    this._slot18.slots_[0]._X_B_.filters = _E_6._P_r;
                    this._slot18.filters = [invalidGlow];
                }
                else {
                    this._slot18.filters = [validGlow];
                }
            }
            if (this._slot19.slots_[0]._X_B_ != null) {
                if (!ObjectLibrary.Items[this._slot19.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                    this._slot19.slots_[0]._X_B_.filters = _E_6._P_r;
                    this._slot19.filters = [invalidGlow];
                }
                else {
                    this._slot19.filters = [validGlow];
                }
            }
            if (this._slot20.slots_[0]._X_B_ != null) {
                if (!ObjectLibrary.Items[this._slot20.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                    this._slot20.slots_[0]._X_B_.filters = _E_6._P_r;
                    this._slot20.filters = [invalidGlow];
                }
                else {
                    this._slot20.filters = [validGlow];
                }
            }
            if (this._slot21.slots_[0]._X_B_ != null) {
                if (!ObjectLibrary.Items[this._slot21.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                    this._slot21.slots_[0]._X_B_.filters = _E_6._P_r;
                    this._slot21.filters = [invalidGlow];
                }
                else {
                    this._slot21.filters = [validGlow];
                }
            }
            if (this._slot22.slots_[0]._X_B_ != null) {
                if (!ObjectLibrary.Items[this._slot22.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                    this._slot22.slots_[0]._X_B_.filters = _E_6._P_r;
                    this._slot22.filters = [invalidGlow];
                }
                else {
                    this._slot22.filters = [validGlow];
                }
            }
            if (this._slot23.slots_[0]._X_B_ != null) {
                if (!ObjectLibrary.Items[this._slot23.slots_[0].objectType_].hasOwnProperty("Recipe")) {
                    this._slot23.slots_[0]._X_B_.filters = _E_6._P_r;
                    this._slot23.filters = [invalidGlow];
                }
                else {
                    this._slot23.filters = [validGlow];
                }
            }
        }
    }

    private function onRemovedFromStage(_arg1:Event):void {
        this.removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    public function draw():void {
        this.graphics.clear();
        GraphicHelper._0L_6(this.path1_);
        GraphicHelper.drawUI(-6, -6, this.w_, (20 + 12), 4, [1, 1, 0, 0], this.path1_);
        GraphicHelper._0L_6(this.path2_);
        GraphicHelper.drawUI(-6, -6, this.w_, this.h_, 4, [1, 1, 1, 1], this.path2_);
        this.graphics.drawGraphicsData(this.graphicsData_);
    }
}
