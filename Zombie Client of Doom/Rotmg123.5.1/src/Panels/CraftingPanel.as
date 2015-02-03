/**
 * Created by Fabian on 11.11.2014.
 */
package Panels {
import Frames.CraftingFrame;

import com.company.assembleegameclient.objects.GameObject;
import com.company.util._H_V_;

import flash.events.KeyboardEvent;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.ui.FrameHolderNoDim;
import flash.events.MouseEvent;
import flash.events.Event;
import com.company.assembleegameclient.game.GameSprite;

public class CraftingPanel extends SimpleButtonPanel
{
    public static var terminalOpen:Boolean;

    public function CraftingPanel(param1:GameSprite, param2:GameObject) {
        super(param1,"Craft items","Open");
        this.obj_ = param2;
        this.addEventListener(Event.ADDED_TO_STAGE,this.onAdded);
        this.addEventListener(Event.REMOVED_FROM_STAGE,this.onRemove);
    }

    public var obj_:GameObject;

    protected function onKeyDown(param1:KeyboardEvent) : void {
        if(!terminalOpen) {
            if (param1.keyCode == Parameters.data_.interact) {
                stage.addChild(new FrameHolderNoDim(new CraftingFrame(gs_, this.obj_)));
            }
        }
    }

    override protected function onButtonClick(param1:MouseEvent) : void {
        if(!terminalOpen) {
            stage.addChild(new FrameHolderNoDim(new CraftingFrame(gs_, this.obj_)));
        }
    }

    protected function onAdded(param1:Event) : void {
        stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
        this.gs_.dispatchInteractiveObject("Press [" + _H_V_._in[Parameters.data_.interact] + "] to interact.");
    }

    protected function onRemove(param1:Event) : void {
        stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
    }
}
}
