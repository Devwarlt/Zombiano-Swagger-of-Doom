// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.objects.GuildBoard

package com.company.assembleegameclient.objects{
    import _R_v.GuildBoardPanel;
    import com.company.assembleegameclient.game.GameSprite;
    import _R_v.Panel;

    public class GuildBoard extends GameObject implements IPanelProvider {

        public function GuildBoard(_arg1:XML){
            super(_arg1);
            _064 = true;
        }
        public function GetPanel(_arg1:GameSprite):Panel{
            return (new GuildBoardPanel(_arg1));
        }

    }
}//package com.company.assembleegameclient.objects

