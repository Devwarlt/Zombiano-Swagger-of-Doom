/**
 * Created by Fabian on 16.11.2014.
 */
package Frames {
import Panels.CraftingPanel;

import _0L_C_.DialogBox;

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.CraftingTerminal;
import com.company.assembleegameclient.objects.GameObject;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.ui.Inventory;
import com.company.assembleegameclient.ui.Slot;
import com.company.assembleegameclient.ui._return;

import flash.events.Event;
import flash.events.MouseEvent;
import flash.utils.Dictionary;

public class CraftingFrame extends Frame
    {
        private var gs_:GameSprite;
        private var obj_:GameObject;

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
        private var craftArrow_:_return;

        public static var items:Dictionary;
        public static var playerItems:Dictionary;

        public static var thisCraftingFrame:CraftingFrame;

        public function CraftingFrame(_gs:GameSprite, _obj:GameObject) {
            super("Craft Items", "Cancel", "Craft", "/craftItems", 275);
            CraftingPanel.terminalOpen = true;
            thisCraftingFrame = this;
            items = new Dictionary();
            playerItems = new Dictionary();
            _obj.equipment_ = _gs.map_.player_.equipment_;
            this.gs_ = _gs;
            this.obj_ = _obj;
            this._0E_n(150);

            this.slot1_ = new Inventory(_gs, _obj, "Crafting", new <int>[Slot.any_], 1, false, 0);
            this.slot2_ = new Inventory(_gs, _obj, "Crafting", new <int>[Slot.any_], 1, false, 1);
            this.slot3_ = new Inventory(_gs, _obj, "Crafting", new <int>[Slot.any_], 1, false, 2);
            this.slot4_ = new Inventory(_gs, _obj, "Crafting", new <int>[Slot.any_], 1, false, 3);
            this.slot5_ = new Inventory(_gs, _obj, "Crafting", new <int>[Slot.any_], 1, false, 4);
            this.slot6_ = new Inventory(_gs, _obj, "Crafting", new <int>[Slot.any_], 1, false, 5);
            this.slot7_ = new Inventory(_gs, _obj, "Crafting", new <int>[Slot.any_], 1, false, 6);
            this.slot8_ = new Inventory(_gs, _obj, "Crafting", new <int>[Slot.any_], 1, false, 7);
            this.slot9_ = new Inventory(_gs, _obj, "Crafting", new <int>[Slot.any_], 1, false, 8);
            this.output_ = new Inventory(_gs, _obj, "Output", new <int>[-10], 1, false, 9);

            this.slot1_.x = 25;     this.slot2_.x = 75;     this.slot3_.x = 125;
            this.slot1_.y = 50;     this.slot2_.y = 50;     this.slot3_.y = 50;

            this.slot4_.x = 25;     this.slot5_.x = 75;     this.slot6_.x = 125;    this.output_.x = 200;
            this.slot4_.y = 100;    this.slot5_.y = 100;    this.slot6_.y = 100;    this.output_.y = 100;

            this.slot7_.x = 25;     this.slot8_.x = 75;     this.slot9_.x = 125;
            this.slot7_.y = 150;    this.slot8_.y = 150;    this.slot9_.y = 150;

            craftArrow_ = new _return((this.output_.x - this.slot6_.x) - this.slot6_.width, 0x310800);
            craftArrow_.x = (this.slot6_.x + this.slot6_.width) - 9;
            craftArrow_.y = this.slot6_.y + (this.slot6_.height / 2);

            this.addChild(craftArrow_);

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

            Button1.addEventListener(MouseEvent.CLICK, this.onClose);
            Button2.addEventListener(MouseEvent.CLICK, this.onCraft);
            Button1.x = 10;
        }
        public override function onAddedToStage(param1:Event):void {
            super.onAddedToStage(param1);
            this.x = (600 / 2) - ((this.w_ - 6) / 2);
            this.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        }
        private function cleanup():void {
            this.removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        }
        private function onEnterFrame(param1:Event){
            this.slot1_.draw(new <int>[items[0] == 0 ? -1 : items[0]]);
            this.slot2_.draw(new <int>[items[1] == 0 ? -1 : items[1]]);
            this.slot3_.draw(new <int>[items[2] == 0 ? -1 : items[2]]);
            this.slot4_.draw(new <int>[items[3] == 0 ? -1 : items[3]]);
            this.slot5_.draw(new <int>[items[4] == 0 ? -1 : items[4]]);
            this.slot6_.draw(new <int>[items[5] == 0 ? -1 : items[5]]);
            this.slot7_.draw(new <int>[items[6] == 0 ? -1 : items[6]]);
            this.slot8_.draw(new <int>[items[7] == 0 ? -1 : items[7]]);
            this.slot9_.draw(new <int>[items[8] == 0 ? -1 : items[8]]);
            this.output_.draw(new <int>[CraftingTerminal.craftingRecipe(getCraftingString())]);
        }
        public function onClose(param1:MouseEvent) : void {
            this.removeChild(craftArrow_);

            this.removeChild(this.slot1_);
            this.removeChild(this.slot2_);
            this.removeChild(this.slot3_);

            this.removeChild(this.slot4_);
            this.removeChild(this.slot5_);
            this.removeChild(this.slot6_);

            this.removeChild(this.slot7_);
            this.removeChild(this.slot8_);
            this.removeChild(this.slot9_);

            this.removeChild(this.output_);

            dispatchEvent(new Event(Event.COMPLETE));
            cleanup();
            CraftingPanel.terminalOpen = false;
        }
        private function onCraft(param1:MouseEvent) : void {
            if(Parameters.data_.confirmCraftingBox) {
                var dialog = new DialogBox('Are you sure you want to craft your items?', "Confirm Crafting", "Lemme craft", "Cancel", null);
                dialog.addEventListener(DialogBox.BUTTON1_EVENT, this.craft);
                dialog.addEventListener(DialogBox.BUTTON2_EVENT, this.closeBox);
                this.parent.addChild(dialog);
            }
            else{
                craft(new Event("CraftItems"));
            }
        }

        public function closeBox(param1:Event):void {
            this.parent.removeChild((param1.currentTarget as DialogBox));
        }

        public function craft(param1:Event):void {
            this.gs_.packetManager.craftItems(this.obj_.objectId_, getCraftingString());
        }

        public static function getCraftingString():String {
            var itemString = "";
            var i = 0;
            while(i < 9) {
                if(items[i] == undefined) items[i] = 0;
                if(i < 8) {
                    itemString += items[i].toString().replace("-1", "0") + ",";
                }
                else {
                    itemString += items[i].toString().replace("-1", "0");
                }
                i++;
            }
            return itemString;
        }

        public static function updateInv(_arg1:int, _arg2:int, _arg3:int):void {
            items[_arg1] = _arg2;
            playerItems[_arg1] = _arg3;
        }

        public static function clear():void {
            items = new Dictionary();
            playerItems = new Dictionary();
        }
    }
}