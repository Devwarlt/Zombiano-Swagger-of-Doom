/**
 * Created by Fabian on 29.12.2014.
 */
package com.company.assembleegameclient.objects {
import Panels.Panel;
import Panels.MountainPanel;

import com.company.assembleegameclient.game.GameSprite;

public class Mountain extends CaveWall implements IPanelProvider {

    public var mountainName:String;

    public function Mountain(_arg1:XML) {
        super(_arg1);

        mountainName = _arg1.DisplayId;
    }

    public function GetPanel(_arg1:GameSprite):Panel {
        return new MountainPanel(_arg1, this);
    }
}
}
