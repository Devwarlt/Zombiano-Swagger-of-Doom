// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//Panels.GuildChroniclePanel

package Panels{
    import com.company.assembleegameclient.game.GameSprite;
    import _sP_._07x;
    import flash.events.MouseEvent;

    public class GuildChroniclePanel extends SimpleButtonPanel {

        public function GuildChroniclePanel(_arg1:GameSprite){
            super(_arg1, "Guild Chronicle", "View");
        }
        override protected function onButtonClick(_arg1:MouseEvent):void{
            gs_.mui_.clearInput();
            gs_.addChild(new _07x(gs_));
        }

    }
}//package Panels

