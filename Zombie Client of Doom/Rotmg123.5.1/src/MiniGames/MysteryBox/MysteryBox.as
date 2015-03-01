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

    private var gs:GameSprite;
    private var _window:Sprite;

    public function MysteryBox(gs:GameSprite, data:XML) {
        this.gs = gs;
        name = "MysteryBox";

        var title:SimpleText = new SimpleText(24, 0x000000, false, WIDTH, 30);
        title.boldText(true);
        title.htmlText = '<p align="center">Ossi Boxes</p>';
        title.autoSize = TextFieldAutoSize.CENTER;
        addChild(title);

        graphics.beginFill(0xffffff, 1.0);
        graphics.drawRect(0, 0, WIDTH, 30);
        graphics.endFill();

        var xmlData:XML =
                <Minigames>
                    <MysteryBoxes>
                        <Box id="0">
                            <Title>Box 1</Title>
                            <Price amount="1" currency="0" />
                        </Box>
                        <Box id="1">
                            <Title>Box 2</Title>
                            <Price amount="10" currency="1" />
                        </Box>
                        <Box id="2">
                            <Title>Box 3</Title>
                            <Price amount="100" currency="2" />
                        </Box>
                        <Box id="3">
                            <Title>Box 4</Title>
                            <Price amount="200" currency="2" />
                        </Box>
                    </MysteryBoxes>
                </Minigames>;

        var i:int = 0;
        for each(var offerData:XML in xmlData.MysteryBoxes.Box) {
            var of:MysteryBoxOffer = new MysteryBoxOffer(this.gs, offerData);
            of.y = 50 + (50 * i) + (10 * i);
            of.x = 10;
            addChild(of);
            i++
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

    public function set window(val:Sprite):void {
        if (this._window) {
            removeChild(this._window);
        }
        this._window = val;
        addChild(this._window);
    }

    private function onClose(event:MouseEvent):void {
        if (parent)
            parent.removeChild(this);
    }
}
}

import Language.LanguageKeys.LanguageKeys_SellAbleButton;
import Language.LanguageManager;

import MiniGames.MysteryBox.MysteryBox;
import MiniGames.MysteryBox.MysteryBoxRequest;
import MiniGames.MysteryBox.MysteryBoxResultEvent;
import MiniGames.MysteryBox.MysteryBoxRoll;

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.ui.SellAbleButton;
import com.company.ui.SimpleText;

import flash.display.Bitmap;
import flash.display.GradientType;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Matrix;
import flash.utils.getTimer;

class MysteryBoxOffer extends Sprite {

    public static const WIDTH:int = MysteryBox.WIDTH - 20;
    public static const HEIGHT:int = 50;

    [Embed(source="treasure-icon.png")]
    private static var treasureIcon:Class;

    private var buyButton:SellAbleButton;
    private var title:SimpleText;
    private var oldTime:int;
    private var over:Boolean;
    private var data:XML;
    private var gs:GameSprite;

    public function MysteryBoxOffer(gs:GameSprite, offer:XML) {
        this.x = 10;
        this.data = offer;
        this.gs = gs;
        graphics.beginFill(0x000000, 1.0);
        graphics.drawRect(0, 0, WIDTH, HEIGHT);
        graphics.endFill();

        var icon:Bitmap = new treasureIcon();
        icon.x = 1;
        icon.y = 1;
        addChild(icon);

        this.title = new SimpleText(26, 0xffffff);
        this.title.text = offer.Title;
        this.title.updateMetrics();
        this.title.x = 50;
        this.title.y = ((HEIGHT / 2) - (this.title.height / 2));
        addChild(this.title);

        this.buyButton = new SellAbleButton(LanguageKeys_SellAbleButton.Buy_for, 21, offer.Price.@amount, offer.Price.@currency);
        this.buyButton.x = WIDTH - this.buyButton.width - 10;
        this.buyButton.y = ((HEIGHT / 2) - (this.buyButton.height / 2)) + 5;
        this.buyButton.addEventListener(MouseEvent.CLICK, this.onBuy);
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

    private function onBuy(event:MouseEvent):void {
        MysteryBox(this.gs.stage.getChildByName("MysteryBox")).window = getRoll();
        var req:MysteryBoxRequest = new MysteryBoxRequest();
        req.addEventListener(MysteryBoxResultEvent.MYSTERYBOX_RESULT, this.onResult);
        req.sendBoxPurchase(this.data.@id);
    }

    private function onResult(event:MysteryBoxResultEvent):void {
        if (event.error) {
            //this.gs.stage.addChild(new DialogBox(event.errorMessage, "Failed to purchase", "Ok", null));
        }
        else {

        }
    }

    private function getRoll():Sprite {
        return new MysteryBoxRoll(this.gs, this.data);
    }
}