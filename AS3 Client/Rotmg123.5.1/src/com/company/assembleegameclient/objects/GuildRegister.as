// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.objects.GuildRegister

package com.company.assembleegameclient.objects{
    import _R_v.GuildCreatorPanel;
    import com.company.assembleegameclient.game.GameSprite;
    import _R_v.Panel;

    public class GuildRegister extends GameObject implements IPanelProvider {

        public function GuildRegister(_arg1:XML){
            super(_arg1);
            _064 = true;
        }
        public function GetPanel(_arg1:GameSprite):Panel{
            return (new GuildCreatorPanel(_arg1));
        }

    }
}//package com.company.assembleegameclient.objects

