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

//Panels.GuildHallPortalPanel

package Panels {
import AccountManagement.ui.FancyTextButton;

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.GuildHallPortal;
import com.company.assembleegameclient.objects.Player;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.ui.ChatBox;
import com.company.assembleegameclient.ui.boxButton;
import com.company.ui.SimpleText;
import com.company.util.Keys;

import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
import flash.text.TextFieldAutoSize;

public class GuildHallPortalPanel extends Panel {

    private var _iA_:GuildHallPortal;
    private var nameText_:SimpleText;
    private var _O_M_:FancyTextButton;
    private var _0J_T_:SimpleText;

    public function GuildHallPortalPanel(_arg1:GameSprite, _arg2:GuildHallPortal) {
        super(_arg1);
        this._iA_ = _arg2;
        if ((((gs_.map_ == null)) || ((gs_.map_.player_ == null)))) {
            return;
        }
        var _local3:Player = gs_.map_.player_;
        this.nameText_ = new SimpleText(18, 0xFFFFFF, false, WIDTH, 0, "Myriad Pro");
        this.nameText_.boldText(true);
        this.nameText_.htmlText = '<p align="center">Guild Hall</p>';
        this.nameText_.wordWrap = true;
        this.nameText_.multiline = true;
        this.nameText_.autoSize = TextFieldAutoSize.CENTER;
        this.nameText_.filters = [new DropShadowFilter(0, 0, 0)];
        this.nameText_.y = 6;
        addChild(this.nameText_);
        if (((!((_local3.guildName_ == null))) && ((_local3.guildName_.length > 0)))) {
            this._O_M_ = new FancyTextButton(16, "Enter");
            this._O_M_.addEventListener(MouseEvent.CLICK, this._xH_);
            this._O_M_.x = ((WIDTH / 2) - (this._O_M_.width / 2));
            this._O_M_.y = ((HEIGHT - this._O_M_.height) - 4);
            addChild(this._O_M_);
            addEventListener(Event.ADDED_TO_STAGE, this._W_Z_);
            addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
        } else {
            this._0J_T_ = new SimpleText(18, 0xFF0000, false, WIDTH, 0, "Myriad Pro");
            this._0J_T_.boldText(true);
            this._0J_T_.htmlText = '<p align="center">Not In Guild</p>';
            this._0J_T_.autoSize = TextFieldAutoSize.CENTER;
            this._0J_T_.filters = [new DropShadowFilter(0, 0, 0)];
            this._0J_T_.y = ((HEIGHT - this._0J_T_.height) - 12);
            addChild(this._0J_T_);
        }
    }

    private function _W_Z_(_arg1:Event):void {
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
        gs_.packetManager.usePortal(this._iA_.objectId_);
    }

}
}//package Panels

