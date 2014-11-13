// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.objects.CharacterChanger

package com.company.assembleegameclient.objects{
    import Panels.ChangeCharacterPanel;
    import com.company.assembleegameclient.game.GameSprite;
    import Panels.Panel;

    public class CharacterChanger extends GameObject implements IPanelProvider {

        public function CharacterChanger(_arg1:XML){
            super(_arg1);
            _064 = true;
        }
        public function GetPanel(_arg1:GameSprite):Panel{
            return (new ChangeCharacterPanel(_arg1));
        }

    }
}//package com.company.assembleegameclient.objects

