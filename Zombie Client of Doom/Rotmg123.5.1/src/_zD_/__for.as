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

//_zD_.__for

package _zD_ {
import AccountManagement.AccountEventDispatcher;
import AccountManagement.AccountManagementScreen;

import Villages.nations.ChooseNationScreen;

import _0_j._kW_;

import _C__._cM_;

import _F_1.CreditsScreen;

import _F_1.selectChars.CurrentCharacterScreen;
import _F_1._01_;
import _F_1._3V_;

import _F_1._C_Q_;

import _W_D_.CharListHistory;

import _U_5._dd;

import _05Z_._08i;

import Language.LanguageKeys.LanguageKeys_Screen;

import _0L_C_.DialogBox;

import _04w._07V_;

import _qN_.Account;

import com.company.assembleegameclient.parameters.Parameters;

import _D_d._hj;

import flash.events.Event;
import flash.system.fscommand;

public class __for extends _cM_ {

    [Inject]
    public var view:_C_Q_;
    [Inject]
    public var _eJ_:CharListHistory;
    [Inject]
    public var _T__:_dd;
    [Inject]
    public var _D_u:_08i;

    override public function initialize():void {
        this.view._ft.add(this._F_A_);
        this.view.initialize(this._eJ_.charList);
    }

    override public function destroy():void {
        this.view._ft.remove(this._F_A_);
    }

    public function _F_A_(_arg1:String):void {
        switch (_arg1) {
            case LanguageKeys_Screen.PLAY:
                this._04P_();
                return;
            case LanguageKeys_Screen.SERVERS:
                this._0B_M_();
                return;
            case LanguageKeys_Screen.CREDITS:
                this._C_0();
                return;
            case LanguageKeys_Screen.ACCOUNT:
                this._0A_3();
                return;
            case LanguageKeys_Screen.LEGENDS:
                this._N_E_();
                return;
            case LanguageKeys_Screen.EDITOR:
                this._0E_r();
                return;
            case "SPRITE_EDITOR":
                var questionBox:DialogBox = new DialogBox("Open Sprite Editor?", "Enter Sprite Editor", "Open", "Cancel");
                questionBox.addEventListener(DialogBox.BUTTON1_EVENT, spriteEditor);
                questionBox.addEventListener(DialogBox.BUTTON2_EVENT, cancelOpen);
                this.view.addChild(questionBox);
                return;
            case LanguageKeys_Screen.QUIT:
                this._uz();
                return;
            case "ChooseCountry":
                this.view.addChild(new ChooseNationScreen());
                return;
        }
    }

    private function _04P_():void {
        var _local1:DialogBox;
        var _local2:_07V_;
        if (((!Parameters.isTesting) && ((this._eJ_.charList.servers_.length == 0)))) {
            if (Parameters._I_O_()) {
                _local1 = new DialogBox(((("There are currently no testing servers available.  " + 'Please play on <font color="#7777EE">') + '<a href="http://www.amaymon.com/">') + "www.amaymon.com</a></font>."), "No Testing Servers", null, null);
            } else {
                _local1 = new DialogBox((((("Realm of the Mad God is currently offline.\n\n" + "Go here for more information:\n") + '<font color="#7777EE">') + '<a href="http://forums.wildshadow.com/">') + "forums.wildshadow.com</a></font>."), "Oryx Sleeping", null, null);
            }
            this.view.stage.addChild(_local1);
            return;
        }
        if (((Parameters.data_.needsTutorial) && ((this._eJ_.charList.nextCharId_ == 1)))) {
            Parameters.data_.playerObjectType = 782;
            Parameters.save();
            _local2 = new _07V_();
            _local2._0_E_ = true;
            _local2.charId = this._eJ_.charList.nextCharId_;
            _local2._f2 = -1;
            _local2._05d = true;
            this._D_u.dispatch(_local2);
        } else {
            this._T__.dispatch(new CurrentCharacterScreen());
        }
    }

    private function _C_0():void {
        this._T__.dispatch(new CreditsScreen());
    }

    private function _0B_M_():void {
        this._T__.dispatch(new _01_());
    }

    private function _0A_3():void {
        this._T__.dispatch(new AccountManagementScreen(false));
    }

    private function _N_E_():void {
        this._T__.dispatch(new _3V_());
    }

    private function _0E_r():void {
        if (Account._get().admin_) {
            var questionBox:DialogBox = new DialogBox("", "Choose Editor", "Sprite Editor", "Map Editor");
            questionBox.addEventListener(DialogBox.BUTTON1_EVENT, spriteEditor);
            questionBox.addEventListener(DialogBox.BUTTON2_EVENT, mapEditor);
            this.view.addChild(questionBox);
        }
    }

    private function _uz():void {
        fscommand("quit");
    }

    private function cancelOpen(event:Event):void {
        this.view.removeChild(event.target as DialogBox);
    }

    private function mapEditor(event:Event):void {
        this._T__.dispatch(new _hj());
    }

    private function spriteEditor(event:Event):void {
        this._T__.dispatch(new _kW_());
    }
}
}//package _zD_

