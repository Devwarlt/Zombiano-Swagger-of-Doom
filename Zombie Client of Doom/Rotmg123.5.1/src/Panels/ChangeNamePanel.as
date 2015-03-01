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

//Panels.ChangeNamePanel

package Panels {
import AccountManagement.ui.FancyTextButton;

import Language.LanguageKeys.LanguageKeys_SellAbleButton;

import com.company.ui.SimpleText;

import flash.display.Sprite;

import com.company.assembleegameclient.ui.SellAbleButton;
import com.company.assembleegameclient.objects.Player;

import flash.text.TextFieldAutoSize;
import flash.filters.DropShadowFilter;

import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.util.Currency;

import flash.events.MouseEvent;

import com.company.assembleegameclient.ui._0G_h;
import com.company.assembleegameclient.ui.boxButton;
import com.company.assembleegameclient.game.GameSprite;

import _qN_.Account;

import com.company.assembleegameclient.ui.FrameHolder;

import Frames._8x;

import _0L_C_._2k;

public class ChangeNamePanel extends Panel {

    private var _B_E_:Boolean;
    private var _O_k:SimpleText;
    private var _ek:Sprite;

    public function ChangeNamePanel(_arg1:GameSprite, _arg2:int) {
        var _local5:SellAbleButton;
        var _local6:Sprite;
        var _local7:SimpleText;
        var _local8:Sprite;
        super(_arg1);
        if ((((gs_.map_ == null)) || ((gs_.map_.player_ == null)))) {
            return;
        }
        var _local3:Player = gs_.map_.player_;
        this._B_E_ = _local3.nameChosen;
        var _local4:String = gs_.charList_.name_;
        this._O_k = new SimpleText(18, 0xFFFFFF, false, WIDTH, 0, "Myriad Pro");
        this._O_k.boldText(true);
        this._O_k.wordWrap = true;
        this._O_k.multiline = true;
        this._O_k.autoSize = TextFieldAutoSize.CENTER;
        this._O_k.filters = [new DropShadowFilter(0, 0, 0)];
        if (this._B_E_) {
            this._O_k.htmlText = (('<p align="center">Your name is: \n' + _local4) + "</p>");
            this._O_k.y = 0;
            addChild(this._O_k);
            _local5 = new SellAbleButton(LanguageKeys_SellAbleButton.Change, 16, Parameters.NAME_CHANGE_PRICE, Currency.GOLD);
            _local5.addEventListener(MouseEvent.CLICK, this.onButtonClick);
            _local5.x = ((WIDTH / 2) - (_local5.w_ / 2));
            _local5.y = ((HEIGHT - (_local5.height / 2)) - 10);
            addChild(_local5);
            this._ek = _local5;
        } else {
            if (_local3.rank < _arg2) {
                this._O_k.htmlText = '<p align="center">Choose Account Name</p>';
                addChild(this._O_k);
                _local6 = new Sprite();
                _local7 = new SimpleText(16, 0xFFFFFF, false, 0, 0, "Myriad Pro");
                _local7.boldText(true);
                _local7.text = "Rank Required:";
                _local7.updateMetrics();
                _local7.filters = [new DropShadowFilter(0, 0, 0)];
                _local6.addChild(_local7);
                _local8 = new _0G_h(_arg2, false, false);
                _local8.x = (_local7.width + 4);
                _local8.y = ((_local7.height / 2) - (_local8.height / 2));
                _local6.addChild(_local8);
                _local6.x = ((WIDTH / 2) - (_local6.width / 2));
                _local6.y = ((HEIGHT - (_local6.height / 2)) - 20);
                addChild(_local6);
            } else {
                this._O_k.htmlText = '<p align="center">Choose Account Name</p>';
                this._O_k.y = 6;
                addChild(this._O_k);
                this._ek = new FancyTextButton(16, "Choose");
                this._ek.addEventListener(MouseEvent.CLICK, this.onButtonClick);
                this._ek.x = ((WIDTH / 2) - (this._ek.width / 2));
                this._ek.y = ((HEIGHT - this._ek.height) - 4);
                addChild(this._ek);
            }
        }
    }

    private function onButtonClick(_arg1:MouseEvent):void {
        var _local2:Sprite;
        if (Account._get().isRegistered()) {
            _local2 = new FrameHolder(new _8x(gs_));
            visible = false;
        } else {
            _local2 = new _2k(("In order to choose an " + "account name, you must be registered"));
        }
        stage.addChild(_local2);
    }

}
}//package Panels

