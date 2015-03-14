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

//_R_e._L_Z_

package _R_e {
import _0L_C_.DialogBox;

import _C__.Mediator;

import _F_1.selectChars.CurrentCharacterScreen;

import com.company.assembleegameclient.game.GameSprite;

import _05Z_._D_m;

import _U_5.CharListResetDispatcher;
import _U_5.SpriteTarget;
import _U_5._dd;

import _05Z_._08i;

import _W_D_.CharListHistory;
import _W_D_._G_J_;

import com.company.assembleegameclient.parameters.Parameters;

import flash.events.Event;

import _9R_._j_;
import _9R_._D_X_;

import _04w._07V_;

public class GameSpriteEventDispatcher extends Mediator {

    [Inject]
    public var view:GameSprite;
    [Inject]
    public var _0H_j:_D_m;
    [Inject]
    public var _0D_p:CharListResetDispatcher;
    [Inject]
    public var _0_b:SpriteTarget;
    [Inject]
    public var _T__:_dd;
    [Inject]
    public var _D_u:_08i;
    [Inject]
    public var _0I_s:CharListHistory;
    [Inject]
    public var _8X_:_G_J_;

    private var newVersion:String;

    override public function initialize():void {
        this._0H_j.add(this._n4);
        addViewListener(Event.COMPLETE, this.onComplete);
        addViewListener(_j_.RECONNECT, this._X_3);
        addViewListener(_D_X_.CLIENT_UPDATE, this._Y_z);
    }

    override public function destroy():void {
        this._0H_j.remove(this._n4);
        removeViewListener(Event.COMPLETE, this.onComplete);
        removeViewListener(_D_X_.CLIENT_UPDATE, this._Y_z);
        removeViewListener(_j_.RECONNECT, this._X_3);
        this.view.dispose();
    }

    public function _n4(_arg1:Boolean):void {
        this.view.mui_._vB_(_arg1);
    }

    private function onComplete(_arg1:Event):void {
        this._0D_p.dispatch();
        this._0_b.dispatch(new CurrentCharacterScreen());
    }

    private function _Y_z(_arg1:_D_X_):void {
        this.newVersion = _arg1.newVersion;
        this._0D_p.dispatch();
        var screen:CurrentCharacterScreen = new CurrentCharacterScreen();
        screen.addEventListener(Event.ADDED_TO_STAGE, this.addBox);
        this._0_b.dispatch(screen);
    }

    private function _X_3(_arg1:_j_):void {
        if (this.view._3c) {
            return;
        }
        var _local2:_07V_ = new _07V_();
        _local2._0L_9 = _arg1.server_;
        _local2._0A_6 = _arg1.gameId_;
        _local2._0_E_ = _arg1._96;
        _local2.charId = _arg1.charId_;
        _local2._f2 = _arg1.keyTime_;
        _local2.key = _arg1.key_;
        this._D_u.dispatch(_local2);
    }

    private function closeBox(event:Event):void {
        event.target.parent.removeChild(event.target);
    }

    private function addBox(event:Event):void {
        var _local2:DialogBox = new DialogBox(((("Client version: " + Parameters.clientVersion) + "\nServer version: ") + this.newVersion), "Client Update Needed", "Ok", null);
        _local2.addEventListener(DialogBox.BUTTON1_EVENT, this.closeBox);
        event.target.addChild(_local2);
    }
}
}//package _R_e

