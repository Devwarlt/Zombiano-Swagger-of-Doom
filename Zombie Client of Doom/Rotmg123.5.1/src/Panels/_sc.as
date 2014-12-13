// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//Panels._sc

package Panels{

import Sounds.LocalSoundEffects;
import Sounds.LocalSounds;

import com.company.assembleegameclient.ui.Slot;
import com.company.assembleegameclient.ui.Inventory;
import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.Container;

import flash.events.Event;


public class _sc extends Panel {

    private static const _hP_:Vector.<int> = new <int>[Slot.any_, Slot.any_, Slot.any_, Slot.any_, Slot.any_, Slot.any_, Slot.any_, Slot.any_];

    public var inventory:Inventory;

    public function _sc(_arg1:GameSprite, _arg2:Container) {
        super(_arg1);
        LocalSoundEffects.play(LocalSounds.openChest);
        this.inventory = new Inventory(gs_, _arg2, _arg2._include(), _hP_, 8, false);
        this.inventory.x = 8;
        addChild(this.inventory);
        this.addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
    }

    override public function draw():void {
        this.inventory.draw(this.inventory.gameObject_.equipment_);
    }

    private function onRemovedFromStage(event:Event):void {
        LocalSoundEffects.play(LocalSounds.closeChest);
    }
}
}//package Panels

