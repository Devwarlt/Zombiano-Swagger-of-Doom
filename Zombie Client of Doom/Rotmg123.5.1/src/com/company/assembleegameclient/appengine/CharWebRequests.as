// Copyright (c) 2015, FireBite/Aceticsoft Studios Inc.
// All rights reserved.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
// ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// either expressed or implied, of the FreeBSD Project.// either expressed or implied, of the FreeBSD Project.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.appengine._2n

package com.company.assembleegameclient.appengine{
import WebRequestEvents.WebRequestErrorEvent;

import _F_1.CreditsScreen;

import com.company.assembleegameclient.parameters.Parameters;
import WebRequestEvents.WebRequestSuccessEvent;
import _qN_.Account;
import com.company.util.QueryHelper;
import flash.events.Event;

    public class CharWebRequests extends WebRequest {

        public function CharWebRequests(retriesIfFailed:int=0){
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

