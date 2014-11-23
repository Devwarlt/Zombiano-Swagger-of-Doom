/**
 * Created by Fabian on 22.11.2014.
 */
package Panels {
import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.Container;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.ui.Inventory;
import com.company.assembleegameclient.ui.Slot;

import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;

public class OpenChestPanel extends SimpleButtonPanel {

    private static const slots:Vector.<int> = new <int>[Slot.any_, Slot.any_, Slot.any_, Slot.any_, Slot.any_, Slot.any_, Slot.any_, Slot.any_];

    public var inventory:Inventory;
    private var opened:Boolean;

    public function OpenChestPanel(_arg1:GameSprite, _arg2:Container){
        super(_arg1, "Open chest", "Open");

        this.addEventListener(Event.ADDED_TO_STAGE,this.onAdded);
        this.addEventListener(Event.REMOVED_FROM_STAGE,this.onRemove);

        this.inventory = new Inventory(gs_, _arg2, _arg2._include(), slots, 8, false);
        this.inventory.x = 8;
    }
    protected function onKeyDown(param1:KeyboardEvent):void{
        if(param1.keyCode == Parameters.data_.interact){
            if(!opened) {
                opened = true;
                addChild(this.inventory);
                super.removeChild(super.button);
                super.removeChild(super.text);
            }
        }
    }
    protected override function onButtonClick(param1:MouseEvent):void{
        if(!opened) {
            opened = true;
            addChild(this.inventory);
            super.removeChild(super.button);
            super.removeChild(super.text);
        }
    }

    protected function onAdded(param1:Event):void{
        stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
    }

    protected function onRemove(param1:Event):void{
        stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
    }

    override public function draw():void{
        if(opened){
            this.inventory.draw(this.inventory.gameObject_.equipment_);
        }
    }
}
}
