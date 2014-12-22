/**
 * Created by Fabian on 23.11.2014.
 */
package com.company.assembleegameclient.objects {
import CraftingWebRequests.CraftingRequest;

import Panels.CraftingRecipePanel;
import Panels.Panel;

import com.company.assembleegameclient.game.GameSprite;

public class CraftingRecipeBook extends GameObject implements IPanelProvider {

    public function CraftingRecipeBook(param1:XML) {
        super(param1);
        CraftingTerminal.recipes = new Vector.<String>();
        new CraftingRequest();
    }

    public function GetPanel(_arg1:GameSprite):Panel {
        return new CraftingRecipePanel(_arg1, this);
    }
}
}