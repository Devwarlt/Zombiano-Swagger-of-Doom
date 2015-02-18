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

/**
 * Created by Fabian on 17.02.2015.
 */
package MiniGames.MysteryBox {
import AccountManagement.ui.FancyTextButton;

import com.company.assembleegameclient.game.GameSprite;
import com.company.ui.SimpleText;
import com.company.util.GraphicHelper;

import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextFieldAutoSize;

public class MysteryBox extends Sprite {

    public static const WIDTH:int = 400;
    public static const HEIGHT:int = 500;

    private var gs:GameSprite;

    public function MysteryBox(gs:GameSprite, data:XML) {
        this.gs = gs;

        var title:SimpleText = new SimpleText(24, 0x000000, false, WIDTH, 30);
        title.boldText(true);
        title.htmlText = '<p align="center">Ossi Boxes</p>';
        title.autoSize = TextFieldAutoSize.CENTER;
        addChild(title);

        graphics.beginFill(0xffffff, 1.0);
        graphics.drawRect(0, 0, WIDTH, 30);
        graphics.endFill();

        for(var i:int = 0; i < 4; i++) {

            var of:MysteryBoxOffer = new MysteryBoxOffer(null);
            of.y = 50 + (50 * i) + (10*i);
            of.x = 10;
            addChild(of);
        }

        var closeBtn:FancyTextButton = new FancyTextButton(26, "Close", WIDTH - 20);
        closeBtn.addEventListener(MouseEvent.CLICK, this.onClose);
        closeBtn.x = 10;
        closeBtn.y = height + 10;
        addChild(closeBtn);

        graphics.beginFill(0x000000, 1.0);
        graphics.drawRect(0, 30, WIDTH, height - 20);
        graphics.endFill();

        GraphicHelper.createBorder(this, 1, 0xffffff);

        this.x = 100;
        this.y = (300 - (height / 2));
    }

    private function onClose(event:MouseEvent):void {
        if (parent)
            parent.removeChild(this);
    }
}
}

import MiniGames.MysteryBox.MysteryBox;

import com.company.assembleegameclient.ui.SellableButton;
import com.company.assembleegameclient.util.Currency;
import com.company.ui.SimpleText;

import flash.display.GradientType;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Matrix;
import flash.utils.getTimer;

class MysteryBoxOffer extends Sprite {

    public static const WIDTH:int = MysteryBox.WIDTH - 20;
    public static const HEIGHT:int = 50;

    private var buyButton:SellableButton;
    private var title:SimpleText;
    private var oldTime:int;
    private var over:Boolean;

    public function MysteryBoxOffer(offer:XML) {
        this.x = 10;
        graphics.beginFill(0x000000, 1.0);
        graphics.drawRect(0, 0, WIDTH, HEIGHT);
        graphics.endFill();

        this.title = new SimpleText(26, 0xffffff);
        this.title.text = "null";
        this.title.updateMetrics();
        this.title.x = 10;
        this.title.y = ((HEIGHT / 2) - (this.title.height / 2));
        addChild(this.title);

        this.buyButton = new SellableButton("Buy for ", 21, -1, Currency.GOLD);
        this.buyButton.x = WIDTH - this.buyButton.width - 10;
        this.buyButton.y = ((HEIGHT / 2) - (this.buyButton.height / 2)) + 6;
        addChild(this.buyButton);

        this.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        this.addEventListener(MouseEvent.ROLL_OVER, this.onMouseOver);
        this.addEventListener(MouseEvent.ROLL_OUT, this.onMouseOut);
    }

    protected function onEnterFrame(event:Event):void {
        var time:int;
        if ((time = ((getTimer() / 10) % WIDTH)) != oldTime) {
            graphics.clear();

            graphics.beginFill(0x000000, 1.0);
            graphics.drawRect(0, 0, WIDTH, HEIGHT);
            graphics.endFill();

            var gradientMatrix:Matrix = new Matrix();
            gradientMatrix.createGradientBox(WIDTH, HEIGHT, ((Math.PI / 180) * time), 0, 0);
            graphics.lineStyle(2);
            graphics.lineGradientStyle(GradientType.LINEAR, [this.over ? 0x00FF00 : 0xFF0000, 0xFFFFFF], [1.0, 1.0], [0, 255], gradientMatrix);
            graphics.drawRect(0, 0, WIDTH, HEIGHT);
            graphics.endFill();
            this.oldTime = time;
        }
    }

    private function onMouseOver(event:MouseEvent):void {
        this.over = true;
    }

    private function onMouseOut(event:MouseEvent):void {
        this.over = false;
    }
}
