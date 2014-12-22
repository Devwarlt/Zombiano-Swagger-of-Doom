/**
 * Created by Fabian on 11.11.2014.
 */
package com.company.assembleegameclient.objects {
import CraftingWebRequests.CraftingRequest;

import Panels.CraftingPanel;
import Panels.Panel;

import com.company.assembleegameclient.game.GameSprite;

public class CraftingTerminal extends GameObject implements IPanelProvider {

    public static var recipes:Vector.<String>;

    public static function craftingRecipe(_arg1:String):int {
        var i = 0;
        var ret = -1;

        if (recipes == null) return ret;

        while (i < recipes.length) {
            if (recipes[i].split(";")[0] == _arg1) {
                ret = int(recipes[i].split(";")[1]);
                break;
            }
            i++;
        }
        return ret;
    }

    public function CraftingTerminal(param1:XML) {
        super(param1);
        recipes = new Vector.<String>();
        new CraftingRequest();
    }

    public function GetPanel(_arg1:GameSprite):Panel {
        return new CraftingPanel(_arg1, this);
    }
}
}
