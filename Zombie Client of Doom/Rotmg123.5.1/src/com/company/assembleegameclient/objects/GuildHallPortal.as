// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.objects.GuildHallPortal

package com.company.assembleegameclient.objects{
    import Panels.GuildHallPortalPanel;
    import com.company.assembleegameclient.game.GameSprite;
    import Panels.Panel;

    public class GuildHallPortal extends GameObject implements IPanelProvider {

        public function GuildHallPortal(_arg1:XML){
            super(_arg1);
        }
        public function GetPanel(_arg1:GameSprite):Panel{
            return (new GuildHallPortalPanel(_arg1, this));
        }

    }
}//package com.company.assembleegameclient.objects

