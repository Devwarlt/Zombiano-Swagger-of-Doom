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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// either expressed or implied, of the FreeBSD Project.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_F_1.CurrentCharacterScreen

package _F_1.selectChars {
import FireBite.Embeds.Models._br;

import Language.LanguageKeys.LanguageKeys_Screen;
import Language.LanguageKeys.LanguageKeys_TextButton;

import _F_1.*;

import _02t._R_f;

import Frames._T_K_;

import _0L_C_._4B_;
import _0L_C_.DialogBox;

import _S_K_._u3;

import _nA_._ax;

import _qN_.Account;

import _sp.Signal;

import com.company.assembleegameclient.appengine.SavedCharsList;
import com.company.assembleegameclient.ui.TextButton;
import com.company.assembleegameclient.ui.CreditsUI;
import com.company.assembleegameclient.ui.ScrollBar;
import com.company.rotmg.graphics.ScreenGraphic;
import com.company.ui.SimpleText;

import flash.display.Graphics;
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;

public class CurrentCharacterScreen extends _05p {

    public var close:Signal;
    public var _n7:Signal;
    public var newCharacter:Signal;
    public var _1V_:Signal;
    public var _O_v:Signal;
    public var _D_u:Signal;
    private var charList:SavedCharsList;
    private var nameText_:SimpleText;
    private var chooseNameButton:TextButton;
    private var creditsUI:CreditsUI;
    private var charactersButton:TextButton;
    private var graveyardButton:TextButton;
    private var packagesButton:TextButton;
    private var chars:CharsSprite;
    private var graveyard:NewsSprite;
    private var packages:PackagesSprite;
    public var _lR_:_ax;
    private var totalHeight:Number;
    private var playBtn:_H_o;
    private var mainBtn:_H_o;
    private var skinsBtn:_H_o;
    private var lines:Shape;
    private var scrollBar:ScrollBar;
    private var currentSprite:Sprite;

    private var selectedButton:TextButton;

    public function CurrentCharacterScreen() {
        addChild(new _R_f());
        this.playBtn = new _H_o(LanguageKeys_Screen.PLAY, 36, true);
        this.mainBtn = new _H_o(LanguageKeys_Screen.MAIN, 22, false);
        this.skinsBtn = new _H_o(LanguageKeys_Screen.SKINS, 22, false);
        super(CurrentCharacterScreen);
        this._n7 = new Signal();
        this.newCharacter = new Signal();
        this.close = new _u3(this.mainBtn, MouseEvent.CLICK);
        this._1V_ = new _u3(this.skinsBtn, MouseEvent.CLICK);
        this._O_v = new Signal();
        this._D_u = new Signal();
    }

    override public function initialize(_arg1:SavedCharsList):void {
        this.charList = _arg1;
        super.initialize(_arg1);
        this.nameText_ = new SimpleText(22, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this.nameText_.boldText(true);
        this.nameText_.text = _arg1.name_;
        this.nameText_.updateMetrics();
        this.nameText_.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this.nameText_.y = 24;
        this.nameText_.x = ((800 / 2) - (this.nameText_.width / 2));
        addChild(this.nameText_);
        if (!_arg1.nameChosen_) {
            this.chooseNameButton = new TextButton(16, false, "choose name");
            this.chooseNameButton.addEventListener(MouseEvent.CLICK, this._fT_);
            this.chooseNameButton.y = 50;
            this.chooseNameButton.x = ((800 / 2) - (this.chooseNameButton.width / 2));
            addChild(this.chooseNameButton);
        }
        this.creditsUI = new CreditsUI();
        this.creditsUI.draw(_arg1.credits_);
        stage;
        this.creditsUI.x = 800;
        this.creditsUI.y = 20;
        addChild(this.creditsUI);
        this.charactersButton = new TextButton(18, true, LanguageKeys_TextButton.Characters);
        this.charactersButton.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this.charactersButton.x = 18;
        this.charactersButton.y = 72;
        this.charactersButton.clickAble(false);
        this.charactersButton.addEventListener(MouseEvent.CLICK, this.onButtonClick);
        addChild(this.charactersButton);
        this.selectedButton = this.charactersButton;
        this.graveyardButton = new TextButton(18, true, LanguageKeys_TextButton.Graveyard);
        this.graveyardButton.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this.graveyardButton.x = this.charactersButton.width + this.charactersButton.x + 15;
        this.graveyardButton.y = 72;
        this.graveyardButton.addEventListener(MouseEvent.CLICK, this.onButtonClick);
        addChild(this.graveyardButton);
        this.packagesButton = new TextButton(18, true, LanguageKeys_TextButton.Packages);
        this.packagesButton.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this.packagesButton.x = this.graveyardButton.width + this.graveyardButton.x + 15;
        this.packagesButton.y = 72;
        this.packagesButton.addEventListener(MouseEvent.CLICK, this.onButtonClick);
        addChild(this.packagesButton);
        this.scrollBar = new ScrollBar(16, 400);
        this.scrollBar.x = ((800 - this.scrollBar.width) - 4);
        this.scrollBar.y = 104;
        addChild(this.scrollBar);
        this.chars = new CharsSprite(this.charList, this);
        this.chars.y = 101;
        this.packages = new PackagesSprite();
        this.packages.y = 101;
        this.graveyard = new NewsSprite(this.charList);
        this.graveyard.y = 101;
        this.lines = new Shape();
        var _local2:Graphics = this.lines.graphics;
        _local2.clear();
        _local2.lineStyle(2, 0xEE9327);
        _local2.moveTo(0, 100);
        _local2.lineTo(800, 100);
        _local2.lineStyle();
        addChild(this.lines);
        addChild(new ScreenGraphic());

        this.playBtn.addEventListener(MouseEvent.CLICK, this._04P_);
        this.playBtn.x = ((800 / 2) - (this.playBtn.width / 2));
        this.playBtn.y = 524;
        addChild(this.playBtn);
        this.mainBtn.x = (((800 / 2) - (this.mainBtn.width / 2)) - 94);
        this.mainBtn.y = 534;
        addChild(this.mainBtn);
        this.skinsBtn.x = (((800 / 2) - (this.skinsBtn.width / 2)) + 96);
        this.skinsBtn.y = 534;
        addChild(this.skinsBtn);

        reload();
    }

    private function _fT_(_arg1:Event):void {
        var _local3:_4B_;
        if (!Account._get().isRegistered()) {
            _local3 = new _4B_();
            _local3.addEventListener(DialogBox.BUTTON1_EVENT, this._4);
            _local3.addEventListener(DialogBox.BUTTON2_EVENT, this.onDialogRegister);
            addChild(_local3);
            return;
        }
        var _local2:_T_K_ = new _T_K_();
        _local2.addEventListener(Event.COMPLETE, this._0G_V_);
        addChild(_local2);
    }

    private function _0G_V_(_arg1:Event):void {
        this._O_v.dispatch();
    }

    private function _4(_arg1:Event):void {
        var _local2:DialogBox = (_arg1.currentTarget as DialogBox);
        removeChild(_local2);
    }

    private function onDialogRegister(_arg1:Event):void {
        var _local2:DialogBox = (_arg1.currentTarget as DialogBox);
        removeChild(_local2);
        _0j();
    }

    private function onScrollBarChange(_arg1:Event):void {
        this.chars.scrollBarScroll((-(this.scrollBar.getPositionInPercent()) * (this.totalHeight - 400)));
        this.graveyard.scrollBarScroll((-(this.scrollBar.getPositionInPercent()) * (this.totalHeight - 400)));
    }

    public function _u_():void {
        this._lR_ = new _ax();
        this._lR_.x = 35;
        this._lR_.y = 32;
        addChild(this._lR_);
    }

    private function _04P_(_arg1:Event):void {
        if (this.charList.numChars_ == 0) {
            this.newCharacter.dispatch();
        } else {
            this._D_u.dispatch();
        }
    }

    private function reload():void {
        if (this.currentSprite != null) {
            removeChild(this.currentSprite);
        }

        switch (this.selectedButton.name) {
            case LanguageKeys_TextButton.Characters:
                this.currentSprite = this.chars;
                break;
            case LanguageKeys_TextButton.Graveyard:
                this.currentSprite = this.graveyard;
                break;
            case LanguageKeys_TextButton.Packages:
                this.currentSprite = this.packages;
                break;
        }

        this.totalHeight = this.currentSprite.height;
        this.scrollBar.visible = false;

        if (this.totalHeight > 400) {
            this.scrollBar._fA_(400, this.totalHeight);
            this.scrollBar.addEventListener(Event.CHANGE, this.onScrollBarChange);
            this.scrollBar.visible = true;
        }

        if (this.currentSprite != null) {
            addChildAt(this.currentSprite, 1);
        }
    }

    private function onButtonClick(event:MouseEvent):void {
        if (this.selectedButton != null) {
            this.selectedButton.clickAble(true);
        }
        this.selectedButton = event.target as TextButton;
        this.selectedButton.clickAble(false);
        reload();
    }
}
}//package _F_1

