// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.objects.GuildRegister

package com.company.assembleegameclient.objects {
import Panels.GuildCreatorPanel;
import Panels.Panel;

import com.company.assembleegameclient.game.GameSprite;

public class GuildRegister extends GameObject implements IPanelProvider {

    public function GuildRegister(_arg1:XML) {
        super(_arg1);
    }

    public function GetPanel(_arg1:GameSprite):Panel {
        return (new GuildCreatorPanel(_arg1));
    }

}
}//package com.company.assembleegameclient.objects

