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

//Panels.GuildCreatorPanel

package Panels {
import AccountManagement.ui.FancyTextButton;

import Villages.CreateVillageScreen;

import com.company.ui.SimpleText;

import flash.display.Sprite;

import com.company.assembleegameclient.ui.SellableButton;
import com.company.assembleegameclient.objects.Player;

import flash.text.TextFieldAutoSize;
import flash.filters.DropShadowFilter;

import com.company.assembleegameclient.util._07E_;

import flash.events.MouseEvent;

import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.util.Currency;
import com.company.assembleegameclient.game.GameSprite;

import _0L_C_.DialogBox;

import flash.events.Event;

import com.company.assembleegameclient.ui.FrameHolder;

public class VillageCreatorPanel extends Panel {

    private var text:SimpleText;
    private var interactiveObject:Sprite;

    public function VillageCreatorPanel(_arg1:GameSprite) {
        var _local3:String;
        var _local4:SellableButton;
        super(_arg1);
        if ((((gs_.map_ == null)) || ((gs_.map_.player_ == null)))) {
            return;
        }
        var _local2:Player = gs_.map_.player_;
        this.text = new SimpleText(18, 0xFFFFFF, false, WIDTH, 0, "Myriad Pro");
        this.text.boldText(true);
        this.text.wordWrap = true;
        this.text.multiline = true;
        this.text.autoSize = TextFieldAutoSize.CENTER;
        this.text.filters = [new DropShadowFilter(0, 0, 0)];
        if (((!((_local2.guildName_ == null))) && ((_local2.guildName_.length > 0)))) {
            _local3 = _07E_._0C_n(_local2.guildRank_);
            this.text.htmlText = (((('<p align="center">' + _local3) + " of \n") + _local2.guildName_) + "</p>");
            this.text.y = 0;
            addChild(this.text);
            this.interactiveObject = new FancyTextButton(16, "Renounce");
            this.interactiveObject.addEventListener(MouseEvent.CLICK, this.onRenounce);
            this.interactiveObject.x = ((WIDTH / 2) - (this.interactiveObject.width / 2));
            this.interactiveObject.y = ((HEIGHT - this.interactiveObject.height) - 4);
            addChild(this.interactiveObject);
        } else {
            this.text.htmlText = '<p align="center">Create a Guild</p>';
            this.text.y = 0;
            addChild(this.text);
            _local4 = new SellableButton("Create ", 16, Parameters.CREATE_VILLAGE_PRICE, Currency.GOLD);
            _local4.addEventListener(MouseEvent.CLICK, this.onVillageCreate);
            _local4.x = ((WIDTH / 2) - (_local4.w_ / 2));
            _local4.y = ((HEIGHT - (_local4.height / 2)) - 10);
            addChild(_local4);
            this.interactiveObject = _local4;
        }
    }

    public function onRenounce(_arg1:MouseEvent):void {
        if ((((gs_.map_ == null)) || ((gs_.map_.player_ == null)))) {
            return;
        }
        var _local2:Player = gs_.map_.player_;
        var _local3:DialogBox = new DialogBox(("Are you sure you want to quit:\n" + _local2.guildName_), "Renounce Guild", "No, I'll stay", "Yes, I'll quit");
        _local3.addEventListener(DialogBox.BUTTON1_EVENT, this._S_V_);
        _local3.addEventListener(DialogBox.BUTTON2_EVENT, this._J_2);
        stage.addChild(_local3);
    }

    private function _S_V_(_arg1:Event):void {
        stage.removeChild((_arg1.currentTarget as DialogBox));
    }

    private function _J_2(_arg1:Event):void {
        if ((((gs_.map_ == null)) || ((gs_.map_.player_ == null)))) {
            return;
        }
        var _local2:Player = gs_.map_.player_;
        gs_.packetManager.guildRemove(_local2.name_);
        stage.removeChild((_arg1.currentTarget as DialogBox));
        visible = false;
    }

    public function onVillageCreate(_arg1:MouseEvent):void {
        var _local2:Sprite = new CreateVillageScreen(this.gs_);
        stage.addChild(_local2);
        visible = false;
    }
}
}//package Panels

