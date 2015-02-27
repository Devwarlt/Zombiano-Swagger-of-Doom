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

//OptionsStuff.Options

package OptionsStuff {
import AccountManagement.ui.FancyTextButton;

import Sounds._Q_P_;
import Sounds.Music;

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.ui.ScrollBar;
import com.company.ui.SimpleText;
import com.company.util.GraphicHelper;
import com.company.util.Keys;

import flash.display.Shape;
import flash.display.Sprite;
import flash.display.StageDisplayState;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
import flash.filters.GlowFilter;
import flash.system.Capabilities;
import flash.text.TextFieldAutoSize;

public class Options extends Sprite {

    private static const controls:String = "Controls";
    private static const hotkeys:String = "Hot Keys";
    private static const chat:String = "Chat";
    private static const _graphics:String = "Graphics";
    private static const sound:String = "Sound";
    private static const extras:String = "Extras";
    private static const optionsTabs:Vector.<String> = new <String>[controls, hotkeys, chat, _graphics, sound, extras];

    public static const WIDTH:int = 570;
    public static const HEIGHT:int = 500;

    private var gs_:GameSprite;
    //private var title:SimpleText;
    private var continueButton:FancyTextButton;
    private var resetButton:FancyTextButton;
    private var _C_F_:Vector.<FancyTextButton>;
    private var selected_:FancyTextButton = null;
    private var _03a:Vector.<Sprite>;
    private var optionsSprite:Sprite;
    private var scrollBar:ScrollBar;
    private var optionsMask:Shape;
    private var nextOptionHeight:int = 2;

    public function Options(_arg1:GameSprite) {
        var _local4:FancyTextButton;
        this._C_F_ = new Vector.<FancyTextButton>();
        this._03a = new Vector.<Sprite>();
        this.optionsSprite = new Sprite();
        super();
        this.gs_ = _arg1;
        graphics.clear();
        graphics.beginFill(0x000000/*0x2B2B2B*/, 0.8);
        graphics.drawRect(0, 0, WIDTH, HEIGHT);
        graphics.endFill();

        graphics.beginFill(0x000000/*0x2B2B2B*/, 0.8);
        graphics.drawRect(180, -100, 400, 100);
        graphics.endFill();

        this.optionsMask = new Shape();
        this.optionsMask.x = 180;
        this.optionsMask.graphics.beginFill(0x000000, 0.0);
        this.optionsMask.graphics.drawRect(0, 0, 360, 400);
        this.optionsMask.graphics.endFill();
        addChild(this.optionsMask);
        this.optionsSprite.mask = this.optionsMask;

        var title:SimpleText = new SimpleText(36, 0xFFFFFF, false, 400, 0, "Myriad Pro");
        title.y = -85;
        title.x = 180;
        title.boldText(true);
        title.htmlText = '<p align="center">Options</p>';
        title.autoSize = TextFieldAutoSize.CENTER;
        title.filters = [new DropShadowFilter(0, 0, 0)];
        addChild(title);
        addChild(optionsSprite);
        this.continueButton = new FancyTextButton(36, "Close Options", 200);
        this.continueButton.boldText(true);
        this.continueButton.addEventListener(MouseEvent.CLICK, this.closeMenu);
        addChild(this.continueButton);
        this.resetButton = new FancyTextButton(22, "Reset to defaults", 200);
        this.resetButton.boldText(true);
        this.resetButton.addEventListener(MouseEvent.CLICK, this.resetOptions);
        addChild(this.resetButton);
        var _local2:int = 0;
        var _local3:int = 0;
        while (_local3 < optionsTabs.length) {
            _local4 = new FancyTextButton(20, optionsTabs[_local3], 150);
            _local4.x = 10;
            _local4.y = _local2;
            addChild(_local4);
            _local4.addEventListener(MouseEvent.CLICK, this._ni);
            this._C_F_.push(_local4);
            _local2 += _local4.height + 5;
            _local3++;
        }
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }

    private function closeMenu(_arg1:MouseEvent):void {
        this.close();
    }

    private function resetOptions(_arg1:MouseEvent):void {
        var _local3:_0_i;
        var _local2:int = 0;
        while (_local2 < this._03a.length) {
            _local3 = (this._03a[_local2] as _0_i);
            if (_local3 != null) {
                delete Parameters.data_[_local3._W_Y_];
            }
            _local2++;
        }
        Parameters._fX_();
        Parameters.save();
        this.refresh();
    }

    private function _ni(_arg1:MouseEvent):void {
        var _local2:FancyTextButton = (_arg1.target as FancyTextButton);
        this.setSelected(_local2);
    }

    private function setSelected(_arg1:FancyTextButton):void {
        if (_arg1 == this.selected_) {
            return;
        }
        if (this.selected_ != null) {
            this.selected_.enabled(true);
        }
        this.selected_ = _arg1;
        this.selected_.enabled(false);
        this._H_c();
        switch (this.selected_.text_) {
            case controls:
                this._q9();
                return;
            case hotkeys:
                this._wP_();
                return;
            case chat:
                this._E_j();
                return;
            case _graphics:
                this._R_E_();
                return;
            case sound:
                this._Y_V_();
                return;
            case extras:
                this.extraOptions();
                return;
        }
    }

    private function onAddedToStage(_arg1:Event):void {
        stage;
        this.continueButton.x = 10;
        this.continueButton.y = HEIGHT - (50 + (this.continueButton.height / 2));
        this.resetButton.x = WIDTH - this.resetButton.width - 10;
        this.resetButton.y = HEIGHT - (50 + (this.resetButton.height / 2));
        if (Capabilities.playerType == "Desktop") {
            Parameters.data_.fullscreenMode = (stage.displayState == "fullScreenInteractive");
            Parameters.save();
        }
        this.setSelected(this._C_F_[0]);
        stage.addEventListener(KeyboardEvent.KEY_DOWN, this._0A_Y_, false, 1);
        stage.addEventListener(KeyboardEvent.KEY_UP, this._H_H_, false, 1);
    }

    private function onRemovedFromStage(_arg1:Event):void {
        stage.removeEventListener(KeyboardEvent.KEY_DOWN, this._0A_Y_, false);
        stage.removeEventListener(KeyboardEvent.KEY_UP, this._H_H_, false);
    }

    private function _0A_Y_(_arg1:KeyboardEvent):void {
        if ((((Capabilities.playerType == "Desktop")) && ((_arg1.keyCode == Keys.ESCAPE)))) {
            Parameters.data_.fullscreenMode = false;
            Parameters.save();
            this.refresh();
        }
        if (_arg1.keyCode == Parameters.data_.options) {
            this.close();
        }
        _arg1.stopImmediatePropagation();
    }

    private function close():void {
        stage.focus = null;
        parent.removeChild(this);
    }

    private function _H_H_(_arg1:KeyboardEvent):void {
        _arg1.stopImmediatePropagation();
    }

    private function _H_c():void {
        var _local1:Sprite;
        for each (_local1 in this._03a) {
            optionsSprite.removeChild(_local1);
        }
        this._03a.length = 0;
        this.nextOptionHeight = 2;
        removeChild(this.optionsSprite);
        this.optionsSprite = new Sprite();
        this.optionsSprite.mask = this.optionsMask;
        addChild(this.optionsSprite);
    }

    private function _q9():void {
        this.registerOption(new KeyBindingOption("moveUp", "Move Up", "Key to will move character up"));
        this.registerOption(new KeyBindingOption("moveLeft", "Move Left", "Key to will move character to the left"));
        this.registerOption(new KeyBindingOption("moveDown", "Move Down", "Key to will move character down"));
        this.registerOption(new KeyBindingOption("moveRight", "Move Right", "Key to will move character to the right"));
        this.registerOption(new Sprite());
        this.registerOption(new SwitchOption("allowRotation", new <String>["On", "Off"], [true, false], "Allow Camera Rotation", "Toggles whether to allow for camera rotation", this._F_x));
        this.registerOption(new KeyBindingOption("rotateLeft", "Rotate Left", "Key to will rotate the camera to the left", !(Parameters.data_.allowRotation)));
        this.registerOption(new KeyBindingOption("rotateRight", "Rotate Right", "Key to will rotate the camera to the right", !(Parameters.data_.allowRotation)));
        this.registerOption(new KeyBindingOption("useSpecial", "Use Special Ability", "This key will activate your special ability"));
        this.registerOption(new KeyBindingOption("autofireToggle", "Autofire Toggle", "This key will toggle autofire"));
        this.registerOption(new KeyBindingOption("resetToDefaultCameraAngle", "Reset To Default Camera Angle", ("This key will reset the camera angle to the default " + "position")));
        this.registerOption(new KeyBindingOption("togglePerformanceStats", "Toggle Performance Stats", "This key will toggle a display of fps and memory usage"));
        this.registerOption(new KeyBindingOption("toggleCentering", "Toggle Centering of Player", ("This key will toggle the position between centered and " + "offset")));
        this.registerOption(new KeyBindingOption("interact", "Interact/Buy", "This key will allow you to enter a portal or buy an item"));
        this.registerOption(new SwitchOption("contextualClick", new <String>["On", "Off"], [true, false], "Contextual Click", "Toggle the contextual click functionality", null));
        this.registerOption(new SwitchOption("clickForGold", new <String>["On", "Off"], [true, false], "Double Click for Gold", "Double clicking on gold/fame while in a Realm will open the payments screen", null));
    }

    private function _F_x():void {
        var _local2:KeyBindingOption;
        var _local1:int;
        while (_local1 < this._03a.length) {
            _local2 = (this._03a[_local1] as KeyBindingOption);
            if (_local2 != null) {
                if ((((_local2._W_Y_ == "rotateLeft")) || ((_local2._W_Y_ == "rotateRight")))) {
                    _local2._J_r(!(Parameters.data_.allowRotation));
                }
            }
            _local1++;
        }
    }

    private function _wP_():void {
        this.registerOption(new KeyBindingOption("useInvSlot1", "Use Inventory Slot 1", "Use item in inventory slot 1"));
        this.registerOption(new KeyBindingOption("useInvSlot2", "Use Inventory Slot 2", "Use item in inventory slot 1"));
        this.registerOption(new KeyBindingOption("useInvSlot3", "Use Inventory Slot 3", "Use item in inventory slot 1"));
        this.registerOption(new KeyBindingOption("useInvSlot4", "Use Inventory Slot 4", "Use item in inventory slot 1"));
        this.registerOption(new KeyBindingOption("useInvSlot5", "Use Inventory Slot 5", "Use item in inventory slot 1"));
        this.registerOption(new KeyBindingOption("useInvSlot6", "Use Inventory Slot 6", "Use item in inventory slot 1"));
        this.registerOption(new KeyBindingOption("useInvSlot7", "Use Inventory Slot 7", "Use item in inventory slot 1"));
        this.registerOption(new KeyBindingOption("useInvSlot8", "Use Inventory Slot 8", "Use item in inventory slot 1"));
        this.registerOption(new KeyBindingOption("miniMapZoomIn", "Mini-Map Zoom In", "This key will zoom in the minimap"));
        this.registerOption(new KeyBindingOption("miniMapZoomOut", "Mini-Map Zoom Out", "This key will zoom out the minimap"));
        this.registerOption(new KeyBindingOption("escapeToNexus", "Escape To Nexus", "This key will instantly escape you to the Nexus"));
        this.registerOption(new KeyBindingOption("options", "Show Options", "This key will bring up the options screen"));
        this.registerOption(new KeyBindingOption("switchTabs", "Switch Tabs", "THis key will flip through your tabs."));
        this.registerOption(new SwitchOption("inventorySwap", new <String>["On", "Off"], [true, false], "Switch items to/from backpack.", "Hold the " + this.invSwap() + " key and click on an item to swap it between your inventory and your backpack.", null));
        this.registerOption(new KeyBindingOption("sprintKey", "Sprint Key", "This is the key you need to press if you wanna sprint"));
        this.registerOption(new KeyBindingOption("openGifts", "Open Gift Menu", "This key will open your menu where you can see all your gifts"));
        if (Capabilities.playerType == "Desktop") {
            this.registerOption(new KeyBindingOption("toggleFullscreen", "Toggle Fullscreen Mode", ("Toggle whether the game is " + "run in a window or fullscreen")));
        }
    }

    public function invSwap():String {
        var _local1:String = Capabilities.os.split(" ")[0] == "Mac" ? "Command" : "Ctrl";
        return _local1;
    }

    private function _E_j():void {
        this.registerOption(new KeyBindingOption("chat", "Activate Chat", "This key will bring up the chat input box"));
        this.registerOption(new KeyBindingOption("chatCommand", "Start Chat Command", ("This key will bring up the chat with a '/' prepended to " + "allow for commands such as /who, /ignore, etc.")));
        this.registerOption(new KeyBindingOption("tell", "Begin Tell", ("This key will bring up a tell (private message) in the chat" + " input box")));
        this.registerOption(new KeyBindingOption("guildChat", "Begin Guild Chat", ("This key will bring up a guild chat in the chat" + " input box")));
        this.registerOption(new SwitchOption("filterLanguage", new <String>["On", "Off"], [true, false], "Filter Offensive Language", "This toggles whether offensive language be filtering will be attempted", null));
        this.registerOption(new KeyBindingOption("scrollChatUp", "Scroll Chat Up", ("This key will scroll up to older messages in the chat " + "buffer")));
        this.registerOption(new KeyBindingOption("scrollChatDown", "Scroll Chat Down", ("This key will scroll down to newer messages in the chat " + "buffer")));
        this.registerOption(new SwitchOption("hidePlayerChat", new <String>["On", "Off"], [true, false], "Hide Player Chat", "Hides player chat messages in the chat box.", null));
        this.registerOption(new SwitchOption("chatStarRequirement", new <String>["Off", "1", "2", "3", "5", "10"], [0, 1, 2, 3, 5, 10], "Star Requirement", "Only see chat from players who have earned at least this amount of stars. May help with chat spam.", null));
    }

    private function _R_E_():void {
        this.registerOption(new SwitchOption("defaultCameraAngle", new <String>["45°", "0°"], [((7 * Math.PI) / 4), 0], "Default Camera Angle", "This toggles the default camera angle", this._oD_));
        this.registerOption(new SwitchOption("centerOnPlayer", new <String>["On", "Off"], [true, false], "Center On Player", "This toggles whether the player is centered or offset", null));
        this.registerOption(new SwitchOption("showQuestPortraits", new <String>["On", "Off"], [true, false], "Show Quest Portraits", "This toggles whether quest portraits are displayed", this._fJ_));
        this.registerOption(new SwitchOption("showProtips", new <String>["On", "Off"], [true, false], "Show Tips", "This toggles whether a tip is displayed when you join a new game", null));
        this.registerOption(new SwitchOption("drawShadows", new <String>["On", "Off"], [true, false], "Draw Shadows", "This toggles whether to draw shadows", null));
        this.registerOption(new SwitchOption("textBubbles", new <String>["On", "Off"], [true, false], "Draw Text Bubbles", "This toggles whether to draw text bubbles", null));
        this.registerOption(new SwitchOption("showTradePopup", new <String>["On", "Off"], [true, false], "Show Trade Request Panel", "This toggles whether to show trade requests in the lower-right panel or just in chat.", null));
        this.registerOption(new SwitchOption("confirmCraftingBox", new <String>["On", "Off"], [true, false], "Show Confirm Craft Box", "This toggles the crafting confirm box before you are crafting an item.", null));
        this.registerOption(new SwitchOption("showGuildInvitePopup", new <String>["On", "Off"], [true, false], "Show Guild Invite Panel", "This toggles whether to show guild invites in the lower-right panel or just in chat.", null));
        this.registerOption(new SwitchOption("showBarsAlways", new <String>["On", "Off"], [true, false], "Toggle HP/Hunger Text", "Always show text values for HP/Hunger/Kills", this.toggleBarTextVisibility));
        if (Capabilities.playerType == "Desktop") {
            this.registerOption(new SwitchOption("fullscreenMode", new <String>["On", "Off"], [true, false], "Fullscreen Mode", "This toggles whether the game is run in fullscreen mode.", this._6k));
        }
    }

    private function extraOptions():void {
        this.registerOption(new SwitchOption("rotationSpeed", new <String>["Slow", "Normal", "Fast", "Hyper"], [0.001, 0.003, 0.007, 0.01], "Manage Rotation Speed", "Changes the speed you rotate the camera", null));
    }

    private function _oD_():void {
        Parameters.data_.cameraAngle = Parameters.data_.defaultCameraAngle;
        Parameters.save();
    }

    private function _fJ_():void {
        if (((((((!((this.gs_ == null))) && (!((this.gs_.map_ == null))))) && (!((this.gs_.map_.partyOverlay_ == null))))) && (!((this.gs_.map_.partyOverlay_.questArrow_ == null))))) {
            this.gs_.map_.partyOverlay_.questArrow_.refreshToolTip();
        }
    }

    private function _6k():void {
        stage.displayState = ((Parameters.data_.fullscreenMode) ? "fullScreenInteractive" : StageDisplayState.NORMAL);
    }

    private function _Y_V_():void {
        this.registerOption(new SwitchOption("playMusic", new <String>["On", "Off"], [true, false], "Play Music", "This toggles whether music is played", this._05z));
        this.registerOption(new SliderOption("musicVolume", "Music Volume", "This is the volume from the in game music.", this._05z));
        this.registerOption(new SwitchOption("playSFX", new <String>["On", "Off"], [true, false], "Play Sound Effects", "This toggles whether sound effects are played", this._super));
        this.registerOption(new Sprite());
        this.registerOption(new SwitchOption("playPewPew", new <String>["On", "Off"], [true, false], "Play Weapon Sounds", "This toggles whether weapon sounds are played", null));
        this.registerOption(new Sprite());
        this.registerOption(new SwitchOption("playNotifySound", new <String>["On", "Off"], [true, false], "Play Notification Box Sound", "This toggles whether the notification box alert sound is played", null));
        this.registerOption(new Sprite());
        this.registerOption(new SwitchOption("playAllyShootSound", new <String>["On", "Off"], [true, false], "Play Ally shoot Sound", "This toggles whether weapon sounds from other players are played.", null));
    }

    private function _05z():void {
        Music._continue(Parameters.data_.playMusic);
    }

    private function _super():void {
        _Q_P_._2c(Parameters.data_.playSFX);
    }

    private function registerOption(_arg1:Sprite):void {
        _arg1.x = 180;
        _arg1.y = this.nextOptionHeight;
        this.optionsSprite.addChild(_arg1);
        _arg1.addEventListener(Event.CHANGE, this._bR_);
        this._03a.push(_arg1);
        this.nextOptionHeight += 40;

        if (this.nextOptionHeight > 400) {
            if (this.scrollBar == null) {
                this.scrollBar = new ScrollBar(16, 400 - 10);
                this.scrollBar.y = 5;
                this.scrollBar.x = WIDTH - this.scrollBar.width - 5;
                this.scrollBar.addEventListener(Event.CHANGE, this.onChange);
                this.addChild(this.scrollBar);
            }

            this.scrollBar._fA_(400 - 10, this.nextOptionHeight - 40);
        }
        else {
            if (this.scrollBar != null) {
                removeChild(this.scrollBar);
                this.scrollBar = null;
            }
        }
    }

    private function _bR_(_arg1:Event):void {
        this.refresh();
    }

    private function refresh():void {
        var _local2:_0_i;
        var _local1:int;
        while (_local1 < this._03a.length) {
            _local2 = (this._03a[_local1] as _0_i);
            if (_local2 != null) {
                _local2.refresh();
            }
            _local1++;
        }
    }

    private function onChange(event:Event):void {
        if (this.scrollBar == null) return;
        var changeVal:Number = this.scrollBar._Q_D_();
        if (isNaN(changeVal)) return;
        optionsSprite.y = (((-(changeVal) * (this.nextOptionHeight - 400))));
    }

    private function toggleBarTextVisibility():void {
        this.gs_.sideUI._02y.setBarsTextVisibility(Parameters.data_.showBarsAlways);
    }
}
}//package OptionsStuff

