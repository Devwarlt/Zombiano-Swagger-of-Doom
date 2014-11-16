/**
 * Created by Fabian on 11.11.2014.
 */
package com.company.assembleegameclient.objects {
import Panels.Panel;
import Panels.CraftingPanel;

import com.company.assembleegameclient.game.GameSprite;

import flash.utils.Dictionary;

public class CraftingTerminal extends GameObject implements IPanelProvider {

        public static var rec:Vector.<XML>;

        public function CraftingTerminal(param1:XML) {
            super(param1);
            this._064 = true;
        }

        public function GetPanel(_arg1:GameSprite):Panel {
            return new CraftingPanel(_arg1, this);
        }

        //Basic testing (I'll add a full version soon)
        public static function craftingRecipe(_arg1:Dictionary):int {
            var recIndex = 0;
            var ret = -1;

            //while(recIndex < rec.length - 1) {
                var i = 0;
                while (i < 9) {
                    if (_arg1[i] == 0xa97)
                        ret = 0xc08;

                    i++;
                }
            //}
            return ret;
        }
    }
}
