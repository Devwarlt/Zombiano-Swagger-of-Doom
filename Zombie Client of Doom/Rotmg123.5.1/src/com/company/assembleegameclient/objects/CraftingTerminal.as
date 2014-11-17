/**
 * Created by Fabian on 11.11.2014.
 */
package com.company.assembleegameclient.objects {
import Panels.Panel;
import Panels.CraftingPanel;

import com.company.assembleegameclient.game.GameSprite;

import flash.utils.Dictionary;

public class CraftingTerminal extends GameObject implements IPanelProvider {

        public static var rec:Vector.<String>;

        public function CraftingTerminal(param1:XML) {
            super(param1);
            _064 = true;
            rec = new Vector.<String>();
            rec.push("2711,2711,2711,0,0,0,0,0;3080");
        }

        public function GetPanel(_arg1:GameSprite):Panel {
            return new CraftingPanel(_arg1, this);
        }

        public static function craftingRecipe(_arg1:String):int {
            var i = 0;
            var ret = -1;

            while(i < rec.length) {
                if(rec[i].split(";")[0] == _arg1) {
                    ret = int(rec[i].split(";")[1]);
                    break;
                }
                i++;
            }
            return ret;
        }
    }
}
