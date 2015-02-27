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

//_0M_m._0E_v

package _0M_m {
import com.company.assembleegameclient.util.offer.Offers;

import _sp._aJ_;

import com.company.assembleegameclient.util.offer.Offer;
import com.company.assembleegameclient.appengine._02k;

import WebRequestEvents.WebRequestSuccessEvent;

import _qN_.Account;

import _00g.WebAccount;

public class _0E_v implements _j5 {

    private static const _Q_3:int = 2600;

    private var _0J_E_:Offers;
    private var _U_k:_aJ_;
    private var _Z_r:Offer;

    public function _002():void {
        _02k._U_t(this._E_A_(), this._y6);
    }

    public function _U_t():Offers {
        return (this._0J_E_);
    }

    public function get _Z_8():_aJ_ {
        return ((this._U_k = ((this._U_k) || (new _aJ_()))));
    }

    private function _y6(_arg1:WebRequestSuccessEvent):void {
        this._0J_E_ = new Offers(XML(_arg1.data_));
        this._Z_8.dispatch();
    }

    private function _E_A_():String {
        switch (Account._get().gameNetwork()) {
            case WebAccount.GAME_NETWORK:
            default:
                return ("/credits");
        }
    }

}
}//package _0M_m

