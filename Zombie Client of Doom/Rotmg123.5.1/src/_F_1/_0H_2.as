// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_F_1._0H_2

package _F_1 {

import AccountManagement.ui.FancyTextButton;

import _02t._R_f;
import _sp._aJ_;

import com.company.assembleegameclient.appengine.SavedCharsList;
import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.assembleegameclient.ui.CreditsUI;
import com.company.assembleegameclient.ui.ScrollBar;
import com.company.assembleegameclient.ui.boxButton;
import com.company.rotmg.graphics.ScreenGraphic;
import com.company.ui.SimpleText;

import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;

public class _0H_2 extends _05p {

    private var _p6:_H_o;
    private var _H_t:CreditsUI;
    private var _break:Object;
    public var close:_aJ_;
    public var play:_aJ_;
    public var scrollBar:ScrollBar;

    public var charBoxHolder:Sprite;
    public var charHeight:Number;
    public var premiumLine:Shape;
    public var premiumLineYBase:int = -1;

    public function _0H_2() {
        this._break = {};
        addChild(new _R_f());
        super(CurrentCharacterScreen);
        this.play = new _aJ_(int);
        this.close = new _aJ_();
    }

    override public function initialize(_arg1:SavedCharsList):void {
        var _local3:XML;
        var _local4:int;
        var _local5:CharacterBox;
        super.initialize(_arg1);
        addChild(new ScreenGraphic());
        this._p6 = new _H_o("back", 36, false);
        this._p6.addEventListener(MouseEvent.CLICK, this._0K_0);
        addChild(this._p6);
        this._H_t = new CreditsUI();
        this._H_t.draw(_arg1.credits_);
        addChild(this._H_t);

        var title:SimpleText = new SimpleText(36, 0xffffff, false, 800, 600);
        title.text = "Select a skin.";
        title.x = 400 - (title.textWidth / 2);
        title.y = 10;
        title.filters = [new DropShadowFilter()];
        addChild(title);

        var noSkin:FancyTextButton = new FancyTextButton(20, "No skin");
        noSkin.x = (400) - (noSkin.width / 2);
        noSkin.y = 65;
        noSkin.addEventListener(MouseEvent.CLICK, this.playWithNoSkin);
        addChild(noSkin);

        var line:Sprite = new Sprite();
        line.graphics.clear();
        line.graphics.lineStyle(2, 0xFFC400);
        line.graphics.moveTo(0, 102);
        line.graphics.lineTo(800, 102);
        line.graphics.lineStyle();
        addChild(line);

        line = new Sprite();
        line.graphics.clear();
        line.graphics.lineStyle(2, 0xFFC400);
        line.graphics.moveTo(773, 102);
        line.graphics.lineTo(773, 523);
        line.graphics.lineStyle();
        addChild(line);

        this.charBoxHolder = new Sprite();
        addChild(this.charBoxHolder);

        var holderMask:Shape = new Shape();
        holderMask.graphics.beginFill(0);
        holderMask.graphics.drawRect(0, 104, 773, 420);
        holderMask.graphics.endFill();
        this.charBoxHolder.mask = holderMask;
        addChild(holderMask);

        var normalSkins:Vector.<XML> = new Vector.<XML>();
        var premiumSkins:Vector.<XML> = new Vector.<XML>();

        for (var i:uint = 0; i < ObjectLibrary.skins.length; i++) {
            var l:XML = ObjectLibrary.skins[i];
            if (l.hasOwnProperty("PremiumSkin")) {
                premiumSkins.push(l);
            }
            else {
                normalSkins.push(l);
            }
        }

        var _local2:int = 0;
        while (_local2 < normalSkins.length) {
            _local3 = normalSkins[_local2];
            _local4 = int(_local3.@type);
            _local5 = new CharacterBox(_local3, _arg1.charStats_[_local4], _arg1);
            _local5.x = (((50 + (140 * int((_local2 % 5)))) + 70) - (_local5.width / 2));
            _local5.y = (110 + (140 * int((_local2 / 5))));
            _local5.yBase = _local5.y;
            this._break[_local4] = _local5;
            _local5.addEventListener(MouseEvent.ROLL_OVER, this._O_y);
            _local5.addEventListener(MouseEvent.ROLL_OUT, this._02F_);
            if (_arg1.hasAvailableCharSlot()) {
                _local5.addEventListener(MouseEvent.CLICK, this._X_);
            }
            charBoxHolder.addChild(_local5);
            _local2++;
        }

        if (premiumSkins.length > 0) {
            this.premiumLine = new Shape();
            this.premiumLine.graphics.clear();
            this.premiumLine.graphics.lineStyle(2, 0xFFC400);
            this.premiumLine.graphics.moveTo(0, charBoxHolder.height + 150);
            this.premiumLine.graphics.lineTo(800, charBoxHolder.height + 150);
            this.premiumLine.graphics.lineStyle();
            this.charBoxHolder.addChild(this.premiumLine);
            this.premiumLineYBase = this.premiumLine.y;
        }

        var pX:int = 0;
        var pY:int = 5;
        var base:int = this.charBoxHolder.height;

        while (_local2 < (normalSkins.length + premiumSkins.length)) {
            _local3 = premiumSkins[_local2 - normalSkins.length];
            _local4 = int(_local3.@type);
            _local5 = new CharacterBox(_local3, _arg1.charStats_[_local4], _arg1);
            _local5.x = (((50 + (140 * int((pX % 5)))) + 70) - (_local5.width / 2));
            _local5.y = (base + (140 * int((pY / 5))));
            _local5.yBase = _local5.y;
            this._break[_local4] = _local5;
            _local5.addEventListener(MouseEvent.ROLL_OVER, this._O_y);
            _local5.addEventListener(MouseEvent.ROLL_OUT, this._02F_);
            if (_arg1.hasAvailableCharSlot()) {
                _local5.addEventListener(MouseEvent.CLICK, this._X_);
            }
            charBoxHolder.addChild(_local5);
            _local2++;
            pX++;
            pY++;
        }

        this.charHeight = charBoxHolder.height + 10;
        this.scrollBar = new ScrollBar(16, 410);
        this.scrollBar.x = 780;
        this.scrollBar.y = 110;
        this.scrollBar.addEventListener(Event.CHANGE, this.onChange);
        this.scrollBar._fA_(410, this.charHeight);
        addChild(this.scrollBar);

        this._p6.x = ((800 / 2) - (this._p6.width / 2));
        this._p6.y = 524;
        this._H_t.x = 800;
        this._H_t.y = 20;
    }

    private function onChange(event:Event):void {
        var val = this.scrollBar._Q_D_();
        for each (var box:CharacterBox in this._break) {
            box.setY(((-(val) * ((this.charHeight) - 410))));
        }
        if (this.premiumLine != null) {
            this.premiumLine.y = (premiumLineYBase + ((-(val) * ((this.charHeight) - 410))));
        }
    }

    private function _0K_0(_arg1:Event):void {
        this.close.dispatch();
    }

    private function _O_y(_arg1:MouseEvent):void {
        var _local2:CharacterBox = (_arg1.currentTarget as CharacterBox);
        _local2._P_Y_(true);
        _local2.selectedOver = true;
        tooltip.dispatch(_local2.getTooltip());
    }

    private function _02F_(_arg1:MouseEvent):void {
        var _local2:CharacterBox = (_arg1.currentTarget as CharacterBox);
        _local2._P_Y_(false);
        _local2.selectedOver = false;
        tooltip.dispatch(null);
    }

    private function _X_(_arg1:MouseEvent):void {
        tooltip.dispatch(null);
        var _local2:CharacterBox = (_arg1.currentTarget as CharacterBox);
        if (!_local2._F_I_) {
            return;
        }
        var _local3:int = _local2.skinType();
        var _local4:String = ObjectLibrary._0D_N_[_local3];
        this.play.dispatch(_local3);
    }

    private function playWithNoSkin(_arg1:MouseEvent):void {
        tooltip.dispatch(null);
        var _local3:int = -1;
        var _local4:String = ObjectLibrary._0D_N_[_local3];
        this.play.dispatch(_local3);
    }
}
}//package _F_1

