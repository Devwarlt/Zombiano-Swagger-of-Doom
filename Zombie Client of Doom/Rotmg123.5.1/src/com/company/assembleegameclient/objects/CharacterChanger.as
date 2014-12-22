// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.objects.CharacterChanger

package com.company.assembleegameclient.objects {
import Panels.ChangeCharacterPanel;
import Panels.Panel;

import com.company.assembleegameclient.game.GameSprite;

public class CharacterChanger extends GameObject implements IPanelProvider {

    public function CharacterChanger(_arg1:XML) {
        super(_arg1);
    }

    public function GetPanel(_arg1:GameSprite):Panel {
        return (new ChangeCharacterPanel(_arg1));
    }

}
}//package com.company.assembleegameclient.objects

