/**
 * Created by Fabian on 23.11.2014.
 */
package Panels {
import Frames.CraftingRecipeFrame;

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.GameObject;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.ui.FrameHolder;

import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;

public class CraftingRecipePanel extends SimpleButtonPanel {
    public function CraftingRecipePanel(param1:GameSprite, param2:GameObject) {
        super(param1, "Crafting Recipes", "Show");
        this.obj_ = param2;
        this.addEventListener(Event.ADDED_TO_STAGE, this.onAdded);
        this.addEventListener(Event.REMOVED_FROM_STAGE, this.onRemove);
    }

    public var obj_:GameObject;

    protected function onKeyDown(param1:KeyboardEvent):void {
        if (param1.keyCode == Parameters.data_.interact) {
            if(!CraftingRecipeFrame.opened_) {
                stage.addChild(new CraftingRecipeFrame(this.gs_, this.obj_));
            }
        }
    }

    override protected function onButtonClick(param1:MouseEvent):void {
        if(!CraftingRecipeFrame.opened_) {
            stage.addChild(new CraftingRecipeFrame(this.gs_, this.obj_));
        }
    }

    protected function onAdded(param1:Event):void {
        stage.addEventListener(KeyboardEvent.KEY_DOWN, this.onKeyDown);
    }

    protected function onRemove(param1:Event):void {
        stage.removeEventListener(KeyboardEvent.KEY_DOWN, this.onKeyDown);
    }
}
}
