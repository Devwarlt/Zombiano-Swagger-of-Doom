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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// either expressed or implied, of the FreeBSD Project.// either expressed or implied, of the FreeBSD Project.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_zD_._fy

package _zD_ {
import _C__.Mediator;

import _F_1.selectChars.CurrentCharacterScreen;
import _F_1._3V_;

import _F_1._C_Q_;
import _F_1._U_W_;

import _W_D_.CharListHistory;
import _W_D_._G_J_;

import _U_5.CharListResetDispatcher;
import _U_5.SpriteTarget;

import com.company.assembleegameclient.appengine.WebRequest;
import com.company.assembleegameclient.parameters.Parameters;

import WebRequestEvents.WebRequestSuccessEvent;
import WebRequestEvents.WebRequestErrorEvent;

public class _fy extends Mediator {

    [Inject]
    public var view:_3V_;
    [Inject]
    public var _eJ_:CharListHistory;
    [Inject]
    public var _0K_K_:_G_J_;
    [Inject]
    public var _0D_p:CharListResetDispatcher;
    [Inject]
    public var _T__:SpriteTarget;
    private var timespan:String;
    private var _0K_y:WebRequest;

    override public function initialize():void {
        this.timespan = "week";
        this._0K_y = new WebRequest(Parameters.getAccountServerIP(), "/fame", true, 2);
        this._0K_y.addEventListener(WebRequestSuccessEvent.GENERIC_DATA, this._S_s);
        this._0K_y.addEventListener(WebRequestErrorEvent.TEXT_ERROR, this._k9);
        this.view.close.add(this._of);
        this.view._8m.add(this._B_L_);
        this.view._T_c.add(this._0A_I_);
        this._qI_();
        this.view.initialize();
    }

    override public function destroy():void {
        this.view.close.remove(this._of);
        this.view._8m.remove(this._B_L_);
        this.view._T_c.remove(this._0A_I_);
    }

    private function _of():void {
        if (this._0K_K_._sr) {
            this._0K_K_._sr = false;
            this._0D_p.dispatch();
            this._T__.dispatch(new CurrentCharacterScreen());
        } else {
            this._T__.dispatch(new _C_Q_());
        }
    }

    private function _B_L_(_arg1:String):void {
        this.timespan = _arg1;
        this._qI_();
    }

    private function _qI_():void {
        var _local1:int = this._eJ_.charList.accountId_;
        var _local2:int = ((((!((_local1 == -1))) && (this._0K_K_._sr))) ? this._0K_K_._J_u : -1);
        this._0K_y.sendRequest("list", {
            "timespan": this.timespan,
            "accountId": _local1,
            "charId": _local2
        });
    }

    public function _S_s(_arg1:WebRequestSuccessEvent):void {
        var _local2:XML = XML(_arg1.data_);
        this.view._0d(_local2);
    }

    private function _k9(_arg1:WebRequestErrorEvent):void {
        this.view._cC_(_arg1.text_);
    }

    private function _0A_I_(_arg1:int, _arg2:int):void {
        this._0K_K_._sr = false;
        this._0K_K_._Z__ = _arg1;
        this._0K_K_._J_u = _arg2;
        this._T__.dispatch(new _U_W_());
    }

}
}//package _zD_

