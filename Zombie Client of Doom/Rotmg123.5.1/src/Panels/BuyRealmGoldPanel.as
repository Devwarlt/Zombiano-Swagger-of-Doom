// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//Panels.BuyRealmGoldPanel

package Panels{
    import _qN_.Account;

import com.company.util._H_V_;

import flash.events.Event;
    import com.company.assembleegameclient.game.GameSprite;
    import flash.events.MouseEvent;
    import flash.events.KeyboardEvent;
    import com.company.assembleegameclient.ui._4D_;
    import com.company.assembleegameclient.parameters.Parameters;

    public class BuyRealmGoldPanel extends SimpleButtonPanel {

        public function BuyRealmGoldPanel(_arg1:GameSprite){
            super(_arg1, "Buy Realm Gold", "Buy");
            Account._get().cacheOffers();
            addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
        }
        override protected function onButtonClick(_arg1:MouseEvent):void{
            Account._get().showMoneyManagement(stage);
        }
        private function onRemovedFromStage(_arg1:Event):void{
            stage.removeEventListener(KeyboardEvent.KEY_DOWN, this._0A_Y_);
            this.gs_.dispatchInteractiveObject("Press [" + _H_V_._in[Parameters.data_.interact] + "] to interact.");
        }
        private function onAddedToStage(_arg1:Event):void{
            stage.addEventListener(KeyboardEvent.KEY_DOWN, this._0A_Y_);
        }
        private function _0A_Y_(_arg1:KeyboardEvent):void{
            if ((((_arg1.keyCode == Parameters.data_.interact)) && (!(_4D_._0G_B_))))
            {
                Account._get().showMoneyManagement(stage);
            }
        }

    }
}//package Panels

