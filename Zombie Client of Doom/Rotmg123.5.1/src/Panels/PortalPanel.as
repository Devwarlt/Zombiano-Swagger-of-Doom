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

//Panels.PortalPanel

package Panels {
import AccountManagement.ui.FancyTextButton;

import com.company.assembleegameclient.objects.Portal;
import com.company.ui.SimpleText;
import com.company.assembleegameclient.ui.boxButton;
import com.company.util.Keys;

import flash.text.TextFieldAutoSize;
import flash.filters.DropShadowFilter;
import flash.events.Event;

import com.company.assembleegameclient.game.GameSprite;

import flash.events.MouseEvent;
import flash.events.KeyboardEvent;

import com.company.assembleegameclient.ui.ChatBox;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.assembleegameclient.tutorial.doneAction;
import com.company.assembleegameclient.tutorial.Tutorial;

public class PortalPanel extends Panel {

    public var _iA_:Portal;
    private var nameText_:SimpleText;
    private var _O_M_:FancyTextButton;
    private var _0C_U_:SimpleText;

    public function PortalPanel(_arg1:GameSprite, _arg2:Portal) {
        super(_arg1);
        this._iA_ = _arg2;
        this.nameText_ = new SimpleText(18, 0xFFFFFF, false, WIDTH, 0, "Myriad Pro");
        this.nameText_.boldText(true);
        this.nameText_.htmlText = '<p align="center">Portal</p>';
        this.nameText_.wordWrap = true;
        this.nameText_.multiline = true;
        this.nameText_.autoSize = TextFieldAutoSize.CENTER;
        this.nameText_.filters = [new DropShadowFilter(0, 0, 0)];
        addChild(this.nameText_);
        this._O_M_ = new FancyTextButton(16, "Enter");
        addChild(this._O_M_);
        this._0C_U_ = new SimpleText(18, 0xFF0000, false, WIDTH, 0, "Myriad Pro");
        this._0C_U_.boldText(true);
        if (this._iA_._xq) {
            this._0C_U_.htmlText = '<p align="center">Locked</p>';
        } else {
            this._0C_U_.htmlText = '<p align="center">Full</p>';
        }
        this._0C_U_.autoSize = TextFieldAutoSize.CENTER;
        this._0C_U_.filters = [new DropShadowFilter(0, 0, 0)];
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }

    private function onAddedToStage(_arg1:Event):void {
        this.nameText_.y = 6;
        this._O_M_.x = ((WIDTH / 2) - (this._O_M_.width / 2));
        this._O_M_.y = ((HEIGHT - this._O_M_.height) - 4);
        this._0C_U_.y = ((HEIGHT - this._0C_U_.height) - 12);
        this._O_M_.addEventListener(MouseEvent.CLICK, this._xH_);
        stage.addEventListener(KeyboardEvent.KEY_DOWN, this._0A_Y_);
        this.gs_.dispatchInteractiveObject("Press [" + Keys.KeyNames[Parameters.data_.interact] + "] to interact.");
    }

    private function onRemovedFromStage(_arg1:Event):void {
        stage.removeEventListener(KeyboardEvent.KEY_DOWN, this._0A_Y_);
    }

    private function _xH_(_arg1:MouseEvent):void {
        this.enterPortal();
    }

    private function _0A_Y_(_arg1:KeyboardEvent):void {
        if ((((_arg1.keyCode == Parameters.data_.interact)) && (!(ChatBox._0G_B_)))) {
            this.enterPortal();
        }
    }

    private function enterPortal():void {
        doneAction(gs_, Tutorial._Y_5);
        gs_.packetManager.usePortal(this._iA_.objectId_);
    }

    override public function draw():void {
        var _local1:String = this._iA_._include();
        var _local2 = "Locked ";
        if (((this._iA_._xq) && ((_local1.indexOf(_local2) == 0)))) {
            _local1 = _local1.substr(_local2.length);
        }
        this.nameText_.htmlText = (('<p align="center">' + _local1) + "</p>");
        this.nameText_._08S_();
        if (this.nameText_.height > 30) {
            this.nameText_.y = 0;
        } else {
            this.nameText_.y = 6;
        }
        if (((((!(this._iA_._xq)) && (this._iA_._09S_))) && (contains(this._0C_U_)))) {
            removeChild(this._0C_U_);
            addChild(this._O_M_);
        } else {
            if (((((this._iA_._xq) || (!(this._iA_._09S_)))) && (contains(this._O_M_)))) {
                removeChild(this._O_M_);
                addChild(this._0C_U_);
            }
        }
    }

}
}//package Panels

