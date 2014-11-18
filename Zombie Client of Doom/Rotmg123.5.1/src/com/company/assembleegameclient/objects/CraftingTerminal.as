/**
 * Created by Fabian on 11.11.2014.
 */
package com.company.assembleegameclient.objects {
import CraftingWebRequests.CraftingRequest;

import Panels.Panel;
import Panels.CraftingPanel;

import _qN_.Account;

import _zo._8C_;
import _zo._mS_;

import com.company.assembleegameclient.appengine._0B_u;

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.parameters.Parameters;

import flash.utils.Dictionary;

public class CraftingTerminal extends GameObject implements IPanelProvider {

    public static var recipes:Vector.<String>;

    public function CraftingTerminal(param1:XML) {
        super(param1);
        _064 = true;
        recipes = new Vector.<String>();
        new CraftingRequest();
    }

    public function GetPanel(_arg1:GameSprite):Panel {
        return new CraftingPanel(_arg1, this);
    }

    public static function craftingRecipe(_arg1:String):int {
        var i = 0;
        var ret = -1;

        while (i < recipes.length) {
             if (recipes[i].split(";")[0] == _arg1) {
                ret = int(recipes[i].split(";")[1]);
                break;
            }
            i++;
        }
        return ret;
    }
}
}
