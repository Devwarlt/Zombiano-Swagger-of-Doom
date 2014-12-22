/**
 * Created by Fabian on 23.11.2014.
 */
package Panels {
import Frames.CraftingRecipeFrame;
import Frames.LearnCraftingRecipeFrame;

import _0L_C_.DialogBox;

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.GameObject;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.ui.FrameHolder;

import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;

public class CraftingRecipePanel extends DoubleButtonPanel {
    public function CraftingRecipePanel(param1:GameSprite, param2:GameObject) {
        super(param1, "Crafting Recipes", "Show", "Learn");
        this.obj_ = param2;
    }

    public var obj_:GameObject;

    override protected function onButton1Click(param1:MouseEvent):void {
        stage.addChild(new CraftingRecipeFrame(this.gs_, this.obj_));
    }

    override protected function onButton2Click(param1:MouseEvent):void {
        stage.addChild(new FrameHolder(new LearnCraftingRecipeFrame(this.gs_, this.obj_)));
    }
}
}
