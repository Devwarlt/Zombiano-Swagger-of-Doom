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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.appengine._02k

package com.company.assembleegameclient.appengine {
import _qN_.Account;

import flash.utils.getTimer;

import com.company.assembleegameclient.parameters.Parameters;

import WebRequestEvents.WebRequestSuccessEvent;

import com.company.util.QueryHelper;

public class _02k {

    private static const _s8:int = ((5 * 60) * 1000);//300000

    private static var _0F_F_:int = -(_s8);
    private static var _n_:String = null;

    public static function _U_t(_arg1:String, _arg2:Function):void {
        var _local3:String = Account._get().guid();
        var _local4:int = getTimer();
        if (((!((_local3 == _n_))) || (((_local4 - _0F_F_) > _s8)))) {
            _n_ = _local3;
            _0F_F_ = _local4;
        }
        var _local5:WebRequest = new WebRequest(Parameters.getAccountServerIP(), _arg1, true, 2);
        if (_arg2 != null) {
            _local5.addEventListener(WebRequestSuccessEvent.GENERIC_DATA, _arg2);
        }
        var _local6:Account = Account._get();
        var _local7:Object = {
            "time": _0F_F_,
            "game_net_user_id": _local6.gameNetworkUserId(),
            "game_net": _local6.gameNetwork(),
            "play_platform": _local6.playPlatform()
        };
        QueryHelper.mergeQueries(_local7, Account._get().credentials());
        _local5.sendRequest("getoffers", _local7);
    }

}
}//package com.company.assembleegameclient.appengine

