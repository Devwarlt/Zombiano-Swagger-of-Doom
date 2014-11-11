/**
 * Created by Fabian on 11.11.2014.
 */
package com.company.assembleegameclient.objects {
import _R_v.Panel;
import _R_v.LithPanel;

import com.company.assembleegameclient.game.GameSprite;

public class LithiumObject extends GameObject implements IPanelProvider {
        public function LithiumObject(param1:XML) {
            super(param1);
            this._064 = true;
        }

    public function GetPanel(_arg1:GameSprite):Panel {
        return new LithPanel(_arg1, this);
    }
}
}
