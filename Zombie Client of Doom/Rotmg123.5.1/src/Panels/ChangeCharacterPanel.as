// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//Panels.ChangeCharacterPanel

package Panels{
    import com.company.assembleegameclient.game.GameSprite;
    import com.company.assembleegameclient.parameters.Parameters;
import com.company.util._H_V_;

import flash.events.KeyboardEvent;
    import flash.events.Event;
    import flash.events.MouseEvent;

    public class ChangeCharacterPanel extends SimpleButtonPanel {

        public function ChangeCharacterPanel(_arg1:GameSprite){
            super(_arg1, "Change Characters", "Change");
            this.addEventListener(Event.ADDED_TO_STAGE,this.onAdded);
            this.addEventListener(Event.REMOVED_FROM_STAGE,this.onRemove);
        }

        protected function onKeyDown(param1:KeyboardEvent) : void {
            if(param1.keyCode == Parameters.data_.interact)
            {
                gs_.dispatchEvent(new Event(Event.COMPLETE));
            }
        }

        override protected function onButtonClick(_arg1:MouseEvent):void{
            gs_.dispatchEvent(new Event(Event.COMPLETE));
        }

        protected function onAdded(param1:Event) : void {
            stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
            this.gs_.dispatchInteractiveObject("Press [" + _H_V_._in[Parameters.data_.interact] + "] to interact.");
        }

        protected function onRemove(param1:Event) : void {
            stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
        }

    }
}//package Panels

