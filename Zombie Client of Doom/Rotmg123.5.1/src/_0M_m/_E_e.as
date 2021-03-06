﻿// Copyright (c) 2015, FireBite/Aceticsoft Studios Inc.
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

//_0M_m._E_e

package _0M_m {
import _sp.Signal;

import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.appengine.WebRequest;

import WebRequestEvents.WebRequestSuccessEvent;

import com.company.util.QueryHelper;

import _qN_.Account;

import com.company.assembleegameclient.util._04d;
import com.company.assembleegameclient.util.offer.Offer;
import com.company.assembleegameclient.util.offer.Offers;

public class _E_e implements _00V_ {

    private static const _Q_3:int = 2600;

    [Inject]
    public var _0J_E_:_j5;
    private var _08t:int;
    private var _0H_C_:Boolean;
    private var _0B_8:Signal;
    private var _0e:Signal;

    public function isAvailable():Boolean {
        return ((this._tT_() > 0));
    }

    public function _li():Boolean {
        return (Parameters.data_.beginnersOfferShowNow);
    }

    public function _14():void {
        Parameters.data_.beginnersOfferShowNow = false;
    }

    public function _03K_():void {
        var _local1:WebRequest = new WebRequest(Parameters.getAccountServerIP(), "/account", true);
        _local1.addEventListener(WebRequestSuccessEvent.GENERIC_DATA, this._0L_8);
        var _local2:Object = {};
        QueryHelper.mergeQueries(_local2, Account._get().credentials());
        _local1.sendRequest("getBeginnerPackageTimeLeft", _local2);
    }

    private function _0L_8(_arg1:WebRequestSuccessEvent):void {
        var _local2:XML = new XML(_arg1.data_);
        this._0H_C_ = true;
        this._08t = _04d._3r(_local2.text());
        this._J_1.dispatch();
    }

    public function get _J_1():Signal {
        return ((this._0B_8 = ((this._0B_8) || (new Signal()))));
    }

    public function _tT_():int {
        return (((this._0H_C_) ? this._08t : Parameters.data_.beginnersOfferTimeLeft));
    }

    public function _ao():Offer {
        var _local2:Offer;
        var _local1:Offers = this._0J_E_._U_t();
        if (!_local1) {
            return (null);
        }
        for each (_local2 in _local1.offerList) {
            if (_local2.realmGold_ == _Q_3) {
                return (_local2);
            }
        }
        return (null);
    }

    public function _xh():void {
        this._08t = 0;
        Parameters.data_.showBeginningsOffer = false;
        ((this._0e) && (this._0e.dispatch()));
    }

    public function get _Q_o():Signal {
        return ((this._0e = ((this._0e) || (new Signal()))));
    }

}
}//package _0M_m

