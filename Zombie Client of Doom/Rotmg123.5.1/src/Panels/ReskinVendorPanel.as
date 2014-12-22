/**
 * Created by Fabian on 08.12.2014.
 */
package Panels {
import Frames.SelectSkinFrame;

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.GameObject;

import flash.events.MouseEvent;

public class ReskinVendorPanel extends SimpleButtonPanel {

    public function ReskinVendorPanel(_arg1:GameSprite, _arg2:GameObject) {
        super(_arg1, "Change Skin", "Open");
        this.obj_ = _arg2;
    }
    private var obj_:GameObject;

    protected override function onButtonClick(event:MouseEvent):void {
        stage.addChild(new SelectSkinFrame(this.gs_));
    }
}
}
