// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.objects.GuildBoard

package com.company.assembleegameclient.objects {
import Panels.GuildBoardPanel;
import Panels.Panel;

import com.company.assembleegameclient.game.GameSprite;

public class GuildBoard extends GameObject implements IPanelProvider {

    public function GuildBoard(_arg1:XML) {
        super(_arg1);
    }

    public function GetPanel(_arg1:GameSprite):Panel {
        return (new GuildBoardPanel(_arg1));
    }

}
}//package com.company.assembleegameclient.objects

