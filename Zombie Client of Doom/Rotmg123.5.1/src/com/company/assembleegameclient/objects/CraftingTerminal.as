/**
 * Created by Fabian on 11.11.2014.
 */
package com.company.assembleegameclient.objects {
import CraftingWebRequests.CraftingRequest;

import Panels.Panel;
import Panels.CraftingPanel;

import _qN_.Account;

import WebRequestEvents.WebRequestSuccessEvent;
import WebRequestEvents.WebRequestErrorEvent;

import com.company.assembleegameclient.appengine.WebRequest;

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.parameters.Parameters;

import flash.utils.Dictionary;

public class CraftingTerminal extends GameObject implements IPanelProvider {

    public static var recipes:Vector.<String>;

    public function CraftingTerminal(param1:XML) {
        super(param1);
        recipes = new Vector.<String>();
        new CraftingRequest();
    }

    public function GetPanel(_arg1:GameSprite):Panel {
        return new CraftingPanel(_arg1, this);
    }

    public static function craftingRecipe(_arg1:String):int {
        var i:int = 0;
        var ret:int = -1;

        if(recipes == null) return ret;

        while (i < recipes.length) {
            var recString:Array = String(recipes[i].split(";")[0]).split(",");
            var s:String = "";
            var c:int = 0;

            for each (var val:String in recString) {
                if(c == (recString.length - 1))
                    s += String(int(val));
                else
                    s+= String(int(val)) + ",";
                c++;
            }

             if (s == _arg1) {
                ret = int(recipes[i].split(";")[1]);
                break;
            }
            i++;
        }
        return ret;
    }
}
}
