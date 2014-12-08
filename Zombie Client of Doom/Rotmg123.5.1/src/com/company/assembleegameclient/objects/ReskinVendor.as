/**
 * Created by Fabian on 08.12.2014.
 */
package com.company.assembleegameclient.objects {
import Panels.Panel;
import Panels.ReskinVendorPanel;

import com.company.assembleegameclient.game.GameSprite;

public class ReskinVendor extends GameObject implements IPanelProvider {

    public function ReskinVendor(param1:XML) {
        super(param1);
    }

    public function GetPanel(_arg1:GameSprite):Panel {
        return new ReskinVendorPanel(_arg1, this);
    }
}
}
