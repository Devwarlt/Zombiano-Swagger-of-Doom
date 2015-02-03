// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.appengine._2n

package com.company.assembleegameclient.appengine{
import WebRequestEvents.WebRequestErrorEvent;

import com.company.assembleegameclient.parameters.Parameters;
import _F_1.CreditsScreen;
import WebRequestEvents.WebRequestSuccessEvent;
import _qN_.Account;
import com.company.util.QueryHelper;
import flash.events.Event;

    public class _2n extends WebRequest {

        public function _2n(retriesIfFailed:int=0){
            super(Parameters.getAccountServerIP(), "/char", true, retriesIfFailed);
        }
        public function _H_Q_():void{
            addEventListener(WebRequestSuccessEvent.GENERIC_DATA, this._D_D_);
            var _local1:Object = Account._get().credentials();
            var _local2:Object = {
                "game_net_user_id":Account._get().gameNetworkUserId(),
                "game_net":Account._get().gameNetwork(),
                "play_platform":Account._get().playPlatform(),
                "do_login":Parameters.doLogin
            };
            QueryHelper.mergeQueries(_local2, _local1);
            sendRequest("list", _local2);
            Parameters.doLogin = false;

            var webReq:WebRequest = new WebRequest(Parameters.getAccountServerIP(), "/credits", true);
            webReq.addEventListener(WebRequestSuccessEvent.GENERIC_DATA, CreditsScreen.setCredits);
            webReq.addEventListener(WebRequestErrorEvent.TEXT_ERROR, CreditsScreen.onError);
            webReq.sendRequest("getInfo", []);
        }
        public function deleteCharacter(_arg1:int):void{
            addEventListener(WebRequestSuccessEvent.GENERIC_DATA, this._Q_M_);
            var _local2:Object = {
                "charId":_arg1,
                "reason":1
            };
            QueryHelper.mergeQueries(_local2, Account._get().credentials());
            sendRequest("delete", _local2);
        }
        private function _D_D_(_arg1:WebRequestSuccessEvent):void{
            dispatchEvent(new SavedCharsList(_arg1.data_.toString()));
        }
        private function _Q_M_(_arg1:WebRequestSuccessEvent):void{
            dispatchEvent(new Event(Event.COMPLETE));
        }

    }
}//package com.company.assembleegameclient.appengine

