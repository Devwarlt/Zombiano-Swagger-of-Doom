// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.objects.MoneyChanger

package com.company.assembleegameclient.objects {
import Panels.BuyRealmGoldPanel;
import Panels.Panel;

import com.company.assembleegameclient.game.GameSprite;

public class MoneyChanger extends GameObject implements IPanelProvider {

    public function MoneyChanger(_arg1:XML) {
        super(_arg1);
    }

    public function GetPanel(_arg1:GameSprite):Panel {
        return (new BuyRealmGoldPanel(_arg1));
    }

}
}//package com.company.assembleegameclient.objects

