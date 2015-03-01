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

//com.company.assembleegameclient.ui._u5

package com.company.assembleegameclient.ui {
import Language.LanguageManager;
import Language.LanguageParameterNames;

import flash.display.GradientType;
import flash.display.Sprite;
import flash.display.BitmapData;
import flash.display.Bitmap;
import flash.events.Event;
import flash.events.MouseEvent;

import com.company.ui.SimpleText;
import com.company.assembleegameclient.util.TextureRedrawer;
import com.company.util.AssetLibrary;
import com.company.assembleegameclient.util.Currency;

import flash.geom.Matrix;
import flash.utils.getTimer;


public class SellAbleButton extends Sprite {

    private static var goldCoin_:BitmapData = null;
    private static var silverCoin_:BitmapData = null;
    private static var copperCoin_:BitmapData = null;

    public var _A_2:String;
    public var text_:SimpleText;
    public var _5U_:Bitmap;
    public var price_:int = -1;
    public var currency_:int = -1;
    public var w_:int;

    private var mouseOver:Boolean;
    private var oldTime:int;

    public function SellAbleButton(text:String, textSize:int, price:int, currency:int) {
        super();
        this._A_2 = text;
        this.text_ = new SimpleText(textSize, 0xFFD700, false, 0, 0, "Myriad Pro");
        this.text_.boldText(true);
        addChild(this.text_);
        this._5U_ = new Bitmap();
        addChild(this._5U_);
        addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
        addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        this.setPrice(price, currency);
    }

    public static function goldCoin():BitmapData {
        if (goldCoin_ == null) {
            goldCoin_ = TextureRedrawer.resize(AssetLibrary._xK_("coins", 0), null, 40, true, 0, 0);
            goldCoin_ = TextureRedrawer.outlineGlow(goldCoin_, 0, 0xFFFFFFFF);
        }
        return (goldCoin_);
    }

    public static function silverCoin():BitmapData {
        if (silverCoin_ == null) {
            silverCoin_ = TextureRedrawer.resize(AssetLibrary._xK_("coins", 1), null, 40, true, 0, 0);
            silverCoin_ = TextureRedrawer.outlineGlow(silverCoin_, 0, 0xFFFFFFFF);
        }
        return (silverCoin_);
    }

    public static function copperCoin():BitmapData {
        if (copperCoin_ == null) {
            copperCoin_ = TextureRedrawer.resize(AssetLibrary._xK_("coins", 2), null, 40, true, 0, 0);
            copperCoin_ = TextureRedrawer.outlineGlow(copperCoin_, 0, 0xFFFFFFFF);
        }
        return (copperCoin_);
    }

    public function setPrice(_arg1:int, _arg2:int):void {
        if ((((this.price_ == _arg1)) && ((this.currency_ == _arg2)))) {
            return;
        }
        this.price_ = _arg1;
        this.currency_ = _arg2;
        this.text_.text = LanguageManager.manager.fillWithParameter(LanguageManager.manager.getValue(this._A_2), LanguageParameterNames.PRICE, this.price_);
        this.text_.updateMetrics();
        switch (_arg2) {
            case Currency.GOLD:
                this._5U_.bitmapData = goldCoin();
                break;
            case Currency.SILVER:
                this._5U_.bitmapData = silverCoin();
                break;
            case Currency.COPPER:
                this._5U_.bitmapData = copperCoin();
                break;
            default:
                this._5U_.bitmapData = null;
        }
        this._5U_.x = (this.text_.width - 3);
        this._5U_.y = -7;
        this.text_.x = ((((this.text_.width + 12) / 2) - (this.text_.textWidth / 2)) - 2);
        this.text_.y = 1;
        this.w_ = ((this.text_.width + this._5U_.width) - 6);
        this.draw(false);
    }

    public function _A_w(_arg1:Boolean):void {
        if (_arg1 == mouseEnabled) {
            return;
        }
        mouseEnabled = _arg1;
        this.draw(false);
    }

    private function onMouseOver(_arg1:MouseEvent):void {
        this.draw(this.mouseOver = true);
        var gradientMatrix:Matrix = new Matrix();
        gradientMatrix.createGradientBox(this.w_, this.text_.textHeight + 8, (Math.PI / 180) * 90, 0, 0);
        graphics.beginGradientFill(GradientType.LINEAR, [0xffffff, 0x000000], [0.6, 1.0], [0, 200], gradientMatrix);
        graphics.drawRect(0, 0, this.w_, this.text_.textHeight + 8);
        graphics.endFill();
    }

    private function onRollOut(_arg1:MouseEvent):void {
        this.draw(this.mouseOver = false);
    }

    private function draw(mouseOver:Boolean):void {
        graphics.clear();
        graphics.beginFill(0x000000, 1.0);
        graphics.drawRect(0, 0, this.w_, this.text_.textHeight + 8);
        graphics.endFill();

        if (!mouseOver) {
            graphics.lineStyle(1, 0xFFD700, 1.0);
            graphics.drawRect(0, 0, this.w_, this.text_.textHeight + 8);
        }
    }

    private function onEnterFrame(event:Event):void {
        if (this.mouseOver) {
            draw(this.mouseOver);

            var time:int;
            if ((time = ((getTimer() / 10) % 360)) != oldTime) {
                var gradientMatrix:Matrix = new Matrix();
                gradientMatrix.createGradientBox(this.w_, this.text_.textHeight + 8, (Math.PI / 180) * time, 0, 0);
                graphics.lineStyle(1);
                graphics.lineGradientStyle(GradientType.LINEAR, [0xff0000, 0x37FF00], [1.0, 1.0], [0, 255], gradientMatrix);
                graphics.drawRect(0, 0, this.w_, this.text_.textHeight + 8);
                graphics.endFill();
                this.oldTime = time;
            }
        }
    }
}
}//package com.company.assembleegameclient.ui

