/**
 * Created by Fabian on 11.11.2014.
 */
package com.company.assembleegameclient.objects {
import Panels.Panel;
import Panels.CraftingPanel;

import com.company.assembleegameclient.game.GameSprite;

    public class CraftingTerminal extends GameObject implements IPanelProvider {

        public function CraftingTerminal(param1:XML) {
            super(param1);
            this._064 = true;
        }

        public function GetPanel(_arg1:GameSprite):Panel {
            return new CraftingPanel(_arg1, this);
        }
    }
}
