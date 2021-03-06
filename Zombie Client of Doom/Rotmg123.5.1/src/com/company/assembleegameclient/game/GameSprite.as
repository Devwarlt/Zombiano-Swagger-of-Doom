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

//com.company.assembleegameclient.game.GameSprite

package com.company.assembleegameclient.game {
import Crafting.SavedCraftingRecipes;

import EasterEggs.EasterEggHandler;
import EasterEggs.EasterEggs.Pretty_Woman_EasterEgg;

import ServerPackets.MapInfo;

import Sounds.Music;

import _9R_._B_w;

import _F_1.MapLoadingScreen;

import _U_5._D_L_;
import _U_5._zz;

import _qN_.Account;

import com.company.assembleegameclient.appengine.SavedCharsList;
import com.company.assembleegameclient.appengine.WebRequest;
import com.company.assembleegameclient.game.menu.PauseMenu;
import com.company.assembleegameclient.map._0D_v;
import com.company.assembleegameclient.map.GameMap;
import com.company.assembleegameclient.net.PacketManager;
import com.company.assembleegameclient.net.Server;
import com.company.assembleegameclient.objects.Player;
import com.company.assembleegameclient.objects.Projectile;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.tutorial.Tutorial;
import com.company.assembleegameclient.ui.CreditsUI;
import com.company.assembleegameclient.ui.Protip;
import com.company.assembleegameclient.ui.SideUI;
import com.company.assembleegameclient.ui._0G_h;
import com.company.assembleegameclient.ui.ChatBox;
import com.company.assembleegameclient.ui._L_N_;
import com.company.assembleegameclient.util.TextureRedrawer;
import com.company.util.MoreColorUtil;
import com.company.util.QueryHelper;
import com.company.util._G_;

import flash.display.Sprite;
import flash.events.Event;
import flash.external.ExternalInterface;
import flash.filters.ColorMatrixFilter;
import flash.utils.ByteArray;
import flash.utils.getTimer;

public class GameSprite extends Sprite {

    public static const _0F_s:Number = new Date().time;
    protected static const _oj:ColorMatrixFilter = new ColorMatrixFilter(MoreColorUtil._0M_l);

    public function GameSprite(_arg1:Server, _arg2:int, _arg3:Boolean, _arg4:int, _arg5:int, _arg6:ByteArray, _arg7:SavedCharsList, _arg8:SavedCraftingRecipes, _arg9:String) {
        this._on = new _0D_v();
        this.moveRecords_ = new PositionHistoryManager();
        super();
        this.charList_ = _arg7;
        this.craftingRecipes = _arg8;
        this.map_ = new GameMap(this);
        addChild(this.map_);
        this.packetManager = new PacketManager(this, _arg1, _arg2, _arg3, _arg4, _arg5, _arg6, _arg9);
        this.mui_ = new GameInputManager(this);
        this.textBox_ = new ChatBox(this, 600, 600);
        addChild(this.textBox_);
        this.sideUI = new SideUI(this, 200, 600);
        addChild(this.sideUI);
        this._0H_R_ = new IdleManager();
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }

    public var _on:_0D_v;
    public var packetManager:PacketManager;
    public var mui_:GameInputManager;
    public var textBox_:ChatBox;
    public var sideUI:SideUI;
    public var tutorial_:Tutorial;
    public var charList_:SavedCharsList;
    public var craftingRecipes:SavedCraftingRecipes;
    public var isNexus_:Boolean = false;
    public var _H_E_:Protip = null;
    public var _0H_R_:IdleManager;
    public var _pg:_0G_h;
    public var _4v:_L_N_;
    public var creditsUI:CreditsUI;
    public var _3c:Boolean;
    public var lastUpdate_:int = 0;
    public var moveRecords_:PositionHistoryManager;
    private var map:GameMap;
    private var _bA_:int = 0;
    private var _qA_:int = 0;
    private var _rz:MapLoadingScreen;
    private var interactiveText:InteractiveAction;
    private var _2e:Boolean;

    public function get map_():GameMap {
        return (this.map);
    }

    public function set map_(_arg1:GameMap):void {
        this.map = _arg1;
    }

    public function _S_z(_arg1:MapInfo):void {
        this.map.setProps(_arg1.width_, _arg1.height_, _arg1.name_, _arg1.background_, _arg1.allowPlayerTeleport_, _arg1.showDisplays_, _arg1.music_, _arg1.weather_, _arg1.currentDatetime_);
        this._dO_(_arg1);
    }

    public function _dO_(_arg1:MapInfo):void {
        if (!this._rz) {
            this._rz = new MapLoadingScreen();
        }
        addChild(this._rz);
        _D_L_.getInstance().dispatch(_arg1);
    }

    public function dispatchInteractiveObject(text:String):void {
        if (this.interactiveText != null) {
            if (this.interactiveText.isEqualTo(text)) return;
            removeChild(this.interactiveText);
        }
        this.interactiveText = new InteractiveAction(text);
        this.interactiveText.y = 530;
        addChild(this.interactiveText);
    }

    public function pause():void {
        if (map == null || map.player_ == null) return;
        if (!getChildByName("PauseMenu")) {
            if (!map.player_.isPaused())
                packetManager.playerText("/pause");
            var pauseMenu:PauseMenu = new PauseMenu(this);
            pauseMenu.addEventListener(Event.COMPLETE, function (e:Event):void {
                packetManager.playerText("/pause");
                removeChild(pauseMenu);
            });
            addChild(pauseMenu);
        }
    }

    public function initialize():void {
        this.map_.initialize();
        this.sideUI.initialize();
        this.creditsUI = new CreditsUI(this);
        this.creditsUI.x = 594;
        this.creditsUI.y = 0;
        addChild(this.creditsUI);
        if (this.map_.showDisplays_) {
            this._pg = new _0G_h(-1, true, false);
            this._pg.x = 8;
            this._pg.y = 4;
            addChild(this._pg);
            this._4v = new _L_N_("", -1);
            this._4v.x = 64;
            this._4v.y = 6;
            addChild(this._4v);
        }
        this.isNexus_ = (this.map_.name_ == "Nexus" || this.map_.name_ == "Shop" || this.map_.name_ == "Editor");
        var _local1:WebRequest = new WebRequest(Parameters.getAccountServerIP(), "/log", true, 0);
        var _local2:Account = Account._get();
        var _local3:Object = {
            "game_net_user_id": _local2.gameNetworkUserId(),
            "game_net": _local2.gameNetwork(),
            "play_platform": _local2.playPlatform()
        };
        QueryHelper.mergeQueries(_local3, Account._get().credentials());
        if (!this.map_.name_ == "Kitchen" && !this.map_.name_ == "Tutorial" && Parameters.data_.watchForTutorialExit == true) {
            Parameters.data_.watchForTutorialExit = false;
            this._uG_('rotmg.Marketing.track("tutorialComplete")');
            _local3["fteStepCompleted"] = 9900;
            _local1.sendRequest("logFteStep", _local3);
        }
        if (this.map_.name_ == "Kitchen") {
            _local3["fteStepCompleted"] = 200;
            _local1.sendRequest("logFteStep", _local3);
        }
        if (this.map_.name_ == "Tutorial") {
            if (Parameters.data_.needsTutorial == true) {
                Parameters.data_.watchForTutorialExit = true;
                this._uG_('rotmg.Marketing.track("install")');
                _local3["fteStepCompleted"] = 100;
                _local1.sendRequest("logFteStep", _local3);
            }
            this._q6();
        } else {
            if (!this.map_.name_ == "Kitchen" && !this.map_.showDisplays_ && Parameters.data_.showProtips) {
                this._yH_();
            }
        }
        this._02J_();
    }

    public function _yH_():void {
        this._0M_8();
        this._H_E_ = new Protip();
        addChild(this._H_E_);
    }

    public function _0M_8():void {
        if (((this._H_E_) && (contains(this._H_E_)))) {
            removeChild(this._H_E_);
        }
        this._H_E_ = null;
    }

    public function dispose():void {
        ((contains(this.map_)) && (removeChild(this.map_)));
        this.map_.dispose();
        removeChild(this.sideUI);
        this.sideUI.dispose();
        _G_.clear();
        TextureRedrawer.clearCache();
        Projectile.dispose();
    }

    public function isInSafePlace():Boolean {
        return this.map_.name_ == "Nexus" || this.map_.name_ == "Vault" || this.map_.name_ == "Guild Hall";
    }

    private function _02J_():void {
        if (this._rz) {
            this._rz._pW_();
            this._rz = null;
        }
    }

    private function _uG_(_arg1:String):void {
        if (ExternalInterface.available == false) {
            return;
        }
        try {
            ExternalInterface.call(_arg1);
        } catch (err:Error) {
        }
    }

    private function _q6():void {
        this.tutorial_ = new Tutorial(this);
        addChild(this.tutorial_);
    }

    public function onAddedToStage(_arg1:Event):void {
        if (this._2e) {
            return;
        }
        EasterEggHandler.registerEasterEgg(new Pretty_Woman_EasterEgg(stage));
        this._2e = true;
        this.sideUI.x = 600;
        this.sideUI.y = 0;
        this.packetManager.connect();
        this._0H_R_.start(this);
        this.lastUpdate_ = getTimer();
        stage.addEventListener(_B_w.MONEY_CHANGED, this._L_u);
        stage.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    public function onRemovedFromStage(_arg1:Event):void {
        if (!this._2e) {
            return;
        }
        this._2e = false;
        this._0H_R_.stop();
        this.packetManager.serverConn.resetSocket();
        _zz.instance.dispatch();
        stage.removeEventListener(_B_w.MONEY_CHANGED, this._L_u);
        stage.removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    private function _L_u(_arg1:Event):void {
        this.packetManager._0J_l();
    }

    private function onEnterFrame(_arg1:Event):void {
        var _local5:Number;
        var _local2:int = getTimer();
        var _local3:int = (_local2 - this.lastUpdate_);
        if (this._0H_R_.update(_local3)) {
            dispatchEvent(new Event(Event.COMPLETE));
            return;
        }
        this._bA_ = (this._bA_ + _local3);
        this._qA_ = (this._qA_ + 1);
        if (this._bA_ > 300000) {
            _local5 = int(Math.round(((1000 * this._qA_) / this._bA_)));
            this._qA_ = 0;
            this._bA_ = 0;
        }
        Music.updateFade();
        this.map_.update(_local2, _local3);
        this._on.update(_local3);
        var _local4:Player = this.map_.player_;
        if (_local4 != null) {
            this._on._K_g(_local4);
            this.map_.draw(this._on, _local2);
            this.creditsUI.draw(_local4.credits_);
            this.sideUI.draw();
            if (this.map_.showDisplays_) {
                this._pg.draw(_local4.rank);
                this._4v.draw(_local4.guildName_, _local4.guildRank_);
            }
            if (_local4.isPaused()) {
                this.map_.filters = [_oj];
                this.sideUI.filters = [_oj];
                this.map_.mouseEnabled = false;
                this.map_.mouseChildren = false;
                this.sideUI.mouseEnabled = false;
                this.sideUI.mouseChildren = false;
            } else {
                if (this.map_.filters.length > 0) {
                    this.map_.filters = [];
                    this.sideUI.filters = [];
                    this.map_.mouseEnabled = true;
                    this.map_.mouseChildren = true;
                    this.sideUI.mouseEnabled = true;
                    this.sideUI.mouseChildren = true;
                }
            }
            this.moveRecords_._F_5(_local2, _local4.x_, _local4.y_);
        }
        this.lastUpdate_ = _local2;
    }

}
}//package com.company.assembleegameclient.game

