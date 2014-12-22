// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//OptionsStuff.Options

package OptionsStuff {
import Sounds.Music;
import Sounds._Q_P_;

import _F_1._H_o;

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.rotmg.graphics.ScreenGraphic;
import com.company.ui.SimpleText;
import com.company.util._H_V_;

import flash.display.Sprite;
import flash.display.StageDisplayState;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
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

    public function Options(_arg1:GameSprite) {
        var _local4:_P_4;
        this._C_F_ = new Vector.<_P_4>();
        this._03a = new Vector.<Sprite>();
        super();
        this.gs_ = _arg1;
        graphics.clear();
        graphics.beginFill(0x2B2B2B, 0.8);
        graphics.drawRect(0, 0, 800, 600);
        graphics.endFill();
        graphics.lineStyle(1, 0x5E5E5E);
        graphics.moveTo(0, 100);
        graphics.lineTo(800, 100);
        graphics.lineStyle();
        this.title = new SimpleText(36, 0xFFFFFF, false, 800, 0, "Myriad Pro");
        this.title.boldText(true);
        this.title.htmlText = '<p align="center">Options</p>';
        this.title.autoSize = TextFieldAutoSize.CENTER;
        this.title.filters = [new DropShadowFilter(0, 0, 0)];
        this.title.updateMetrics();
        this.title.x = ((800 / 2) - (this.title.width / 2));
        this.title.y = 8;
        addChild(this.title);
        addChild(new ScreenGraphic());
        this.continueButton = new _H_o("continue", 36, false);
        this.continueButton.addEventListener(MouseEvent.CLICK, this.closeMenu);
        addChild(this.continueButton);
        this.resetButton = new _H_o("reset to defaults", 22, false);
        this.resetButton.addEventListener(MouseEvent.CLICK, this.resetOptions);
        addChild(this.resetButton);
        this.homeButton = new _H_o("back to home", 22, false);
        this.homeButton.addEventListener(MouseEvent.CLICK, this.backToHome);
        addChild(this.homeButton);
        var _local2:int = 14;
        var _local3:int;
        while (_local3 < optionsTabs.length) {
            _local4 = new _P_4(optionsTabs[_local3]);
            _local4.x = _local2;
            _local4.y = 70;
            addChild(_local4);
            _local4.addEventListener(MouseEvent.CLICK, this._ni);
            this._C_F_.push(_local4);
            _local2 = (_local2 + 108);
            _local3++;
        }
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }
    private var gs_:GameSprite;
    private var title:SimpleText;
    private var continueButton:_H_o;
    private var resetButton:_H_o;
    private var homeButton:_H_o;
    private var _C_F_:Vector.<_P_4>;
    private var selected_:_P_4 = null;
    private var _03a:Vector.<Sprite>;
    private var _00s:int = 0;

    public function invSwap():String {
        var _local1:String = Capabilities.os.split(" ")[0] == "Mac" ? "Command" : "Ctrl";
        return _local1;
    }

    private function setSelected(_arg1:_P_4):void {
        if (_arg1 == this.selected_) {
            return;
        }
        if (this.selected_ != null) {
            this.selected_.setSelected(false);
        }
        this.selected_ = _arg1;
        this.selected_.setSelected(true);
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

    private function close():void {
        stage.focus = null;
        parent.removeChild(this);
    }

    private function _H_c():void {
        var _local1:Sprite;
        for each (_local1 in this._03a) {
            removeChild(_local1);
        }
        this._03a.length = 0;
        this._00s = 0;
    }

    private function _q9():void {
        this.registerOption(new KeyBindingOption("moveUp", "Move Up", "Key to will move character up"));
        this.registerOption(new KeyBindingOption("moveLeft", "Move Left", "Key to will move character to the left"));
        this.registerOption(new KeyBindingOption("moveDown", "Move Down", "Key to will move character down"));
        this.registerOption(new KeyBindingOption("moveRight", "Move Right", "Key to will move character to the right"));
        this.registerOption(new SwitchOption("allowRotation", new <String>["On", "Off"], [true, false], "Allow Camera Rotation", "Toggles whether to allow for camera rotation", this._F_x));
        this.registerOption(new Sprite());
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
        if (Capabilities.playerType == "Desktop") {
            this.registerOption(new KeyBindingOption("toggleFullscreen", "Toggle Fullscreen Mode", ("Toggle whether the game is " + "run in a window or fullscreen")));
        }
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
        _arg1.x = ((((this._00s % 2) == 0)) ? 20 : 415);
        _arg1.y = ((int((this._00s / 2)) * 44) + 122);
        addChild(_arg1);
        _arg1.addEventListener(Event.CHANGE, this._bR_);
        this._03a.push(_arg1);
        this._00s++;
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

    private function closeMenu(_arg1:MouseEvent):void {
        this.close();
    }

    private function resetOptions(_arg1:MouseEvent):void {
        var _local3:_0_i;
        var _local2:int;
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

    private function backToHome(_arg1:MouseEvent):void {
        this.gs_.dispatchEvent(new Event(Event.COMPLETE));
    }

    private function _ni(_arg1:MouseEvent):void {
        var _local2:_P_4 = (_arg1.target as _P_4);
        this.setSelected(_local2);
    }

    private function onAddedToStage(_arg1:Event):void {
        stage;
        this.continueButton.x = ((800 / 2) - (this.continueButton.width / 2));
        this.continueButton.y = 524;
        this.resetButton.x = 20;
        this.resetButton.y = 536;
        this.homeButton.x = 620;
        this.homeButton.y = 536;
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
        if ((((Capabilities.playerType == "Desktop")) && ((_arg1.keyCode == _H_V_.ESCAPE)))) {
            Parameters.data_.fullscreenMode = false;
            Parameters.save();
            this.refresh();
        }
        if (_arg1.keyCode == Parameters.data_.options) {
            this.close();
        }
        _arg1.stopImmediatePropagation();
    }

    private function _H_H_(_arg1:KeyboardEvent):void {
        _arg1.stopImmediatePropagation();
    }

    private function _bR_(_arg1:Event):void {
        this.refresh();
    }

}
}//package OptionsStuff

