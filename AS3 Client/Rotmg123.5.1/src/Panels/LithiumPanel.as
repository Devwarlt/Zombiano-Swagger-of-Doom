/**
 * Created by Fabian on 11.11.2014.
 */
package Panels {
import Frames.LithiumFrame;

import Panels.LithiumPanel;

import com.company.assembleegameclient.objects.GameObject;
import com.company.assembleegameclient.objects.LithiumObject;

import flash.events.KeyboardEvent;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.ui.FrameHolderNoDim;
import flash.events.MouseEvent;
import flash.events.Event;
import com.company.assembleegameclient.game.GameSprite;
import Frames.ReforgeFrame;

public class LithiumPanel extends SimpleButtonPanel
{
    public function LithiumPanel(param1:GameSprite, param2:GameObject) {
        super(param1,"Lithium Object","Sweq");
        this.obj_ = param2;
        this.addEventListener(Event.ADDED_TO_STAGE,this.onAdded);
        this.addEventListener(Event.REMOVED_FROM_STAGE,this.onRemove);
    }

    public var obj_:GameObject;

    protected function onKeyDown(param1:KeyboardEvent) : void {
        if(param1.keyCode == Parameters.data_.interact)
        {
            stage.addChild(new FrameHolderNoDim(new LithiumFrame(gs_, obj_)));
        }
    }

    override protected function onButtonClick(param1:MouseEvent) : void {
        stage.addChild(new FrameHolderNoDim(new ReforgeFrame(gs_,this.obj_)));
    }

    protected function onAdded(param1:Event) : void {
        stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
    }

    protected function onRemove(param1:Event) : void {
        stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
    }
}
}
