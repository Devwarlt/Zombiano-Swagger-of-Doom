﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_F_1.CharacterBox

package _F_1{
    import _E_7._E_J_;
    import _E_7._for_;

import _qN_.Account;

import avmplus.methodXml;

import com.company.assembleegameclient.appengine.SavedCharacter;
    import com.company.assembleegameclient.appengine._0A_H_;
    import com.company.assembleegameclient.appengine._0K_R_;
    import com.company.assembleegameclient.util.RankUtils;
    import com.company.assembleegameclient.util._lJ_;
    import com.company.rotmg.graphics.FullCharBoxGraphic;
    import com.company.rotmg.graphics.LockedCharBoxGraphic;
    import com.company.rotmg.graphics.ranks.AdminRank;
import com.company.rotmg.graphics.ranks.premiumRank;
import com.company.ui.SimpleText;
    import com.company.util.AssetLibrary;
    
    import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;
    import flash.filters.DropShadowFilter;
    import flash.geom.ColorTransform;
    import flash.text.TextFieldAutoSize;
    import flash.ui.Keyboard;
    import flash.utils.getTimer;

    public class CharacterBox extends Sprite {

        public static const DELETE_CHAR:String = "DELETE_CHAR";
        public static const ENTER_NAME:String = "ENTER_NAME";
        private static const _Z_k:ColorTransform = new ColorTransform(0.8, 0.8, 0.8);
        private static const _t0:ColorTransform = new ColorTransform(0.2, 0.2, 0.2);
        private static const _I_Z_:ColorTransform = new ColorTransform(0.87, 0.62, 0);

        public const _lz:int = 600;

        public var skinXml_:XML = null;
        public var charStats_:_0A_H_;
        public var charList_:_0K_R_;
        public var _F_I_:Boolean;
        private var _87:DisplayObject;
        private var bitmap_:Bitmap;
        private var _L_B_:SimpleText;
        private var classNameText_:SimpleText;
        public var _6S_:int = -2147483648;
        public var _P_:int;
        public var _N_K_:int;

		public var selectedOver:Boolean = false;
        public var yBase:Number;

        public function CharacterBox(_arg1:XML, _arg2:_0A_H_, _arg3:_0K_R_){
            super();
            this.skinXml_ = _arg1;
            this.charStats_ = _arg2;
            this.charList_ = _arg3;
            this._F_I_ = _E_J_.isAvailable(_arg1, _arg3);
            if (!this._F_I_)
            {
                this._87 = new LockedCharBoxGraphic();
            } else
            {
                this._87 = new FullCharBoxGraphic();
            }
            addChild(this._87);

            this.bitmap_ = new Bitmap(null);
            this.setImage(_lJ_.DOWN, _lJ_._sS_, 0);
            addChild(this.bitmap_);
            this.classNameText_ = new SimpleText(14, 0xFFFFFF, false, 0, 0, "Myriad Pro");
            this.classNameText_.boldText(true);
            var text:String = this.skinXml_.DisplayId;
            text = text.replace("{NL}", "\n");
            this.classNameText_.htmlText = '<p align="center">' + text + '</p>';
            this.classNameText_.autoSize = TextFieldAutoSize.CENTER;
            this.classNameText_.updateMetrics();
            this.classNameText_.filters = [new DropShadowFilter(0, 0, 0, 1, 4, 4)];
            addChild(this.classNameText_);
            if (!this._F_I_)
            {
                this._L_B_ = new SimpleText(14, 0xFF0000, false, 0, 0, "Myriad Pro");
                this._L_B_.htmlText = '<p align="center">Locked</p>';
                this._L_B_.boldText(true);
                this._L_B_.autoSize = TextFieldAutoSize.CENTER;
                this._L_B_.updateMetrics();
                this._L_B_.filters = [new DropShadowFilter(0, 0, 0, 1, 4, 4, 5)];
                this._L_B_.y = 52;
                addChild(this._L_B_);
                this.classNameText_.y = 80 - this.classNameText_.textHeight / 2;
            }
            else
            {
                this.classNameText_.y = 75 - this.classNameText_.textHeight / 2;
            }

            if(_arg1.hasOwnProperty("PremiumSkin")) {
                var premiumIcon:DisplayObject = new premiumRank();
                premiumIcon.x = width - premiumIcon.width - 5;
                premiumIcon.y = 8;
                addChild(premiumIcon);
            }
        }

        public function setY(_arg1:Number):void {
            y = yBase + _arg1;
        }

        public function skinType():int{
            return (int(this.skinXml_.@type));
        }
        public function getTooltip():_for_{
            return (new _E_J_(this.skinXml_, this.charList_));
        }
        public function _P_Y_(_arg1:Boolean):void{
            if (!this._F_I_)
            {
                return;
            }
            if (_arg1)
            {
                transform.colorTransform = new ColorTransform(1.2, 1.2, 1.2);
            } else
            {
                transform.colorTransform = new ColorTransform(1, 1, 1);
            }
        }
        private function _0A_Y_(_arg1:KeyboardEvent):void{
            if (_arg1.charCode == Keyboard.ENTER)
            {
                dispatchEvent(new Event(ENTER_NAME));
                _arg1.stopPropagation();
            }
        }
        private function onDeleteClick(_arg1:MouseEvent):void{
            dispatchEvent(new Event(DELETE_CHAR));
            _arg1.stopPropagation();
        }
        private function onEnterFrame(_arg1:Event):void{
            var _local3:Number;
            var _local2:int = getTimer();
            if (_local2 < (this._6S_ + this._lz))
            {
                _local3 = ((_local2 - this._6S_) / this._lz);
                this.setImage(this._P_, this._N_K_, _local3);
            } else
            {
                this.setImage(_lJ_.DOWN, _lJ_._sS_, 0);
                if (Math.random() < 0.005)
                {
                    this._6S_ = _local2;
                    this._P_ = (((Math.random() > 0.5)) ? _lJ_.LEFT : _lJ_.RIGHT);
                    this._N_K_ = _lJ_._E_w;
                }
            }
        }
        public function setImage(_arg1:int, _arg2:int, _arg3:Number):void{
            this.bitmap_.bitmapData = SavedCharacter.getImage(null, this.skinXml_, _arg1, _arg2, _arg3, this._F_I_, false);
            this.bitmap_.x = ((this._87.width / 2) - (this.bitmap_.bitmapData.width / 2));
        }
    }
}//package _F_1

