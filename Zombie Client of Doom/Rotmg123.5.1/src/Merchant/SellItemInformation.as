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
 * Created by Fabian on 07.03.2015.
 */
package Merchant {
import AccountManagement.ui.FancyTextButton;

import _05R_.GTween;

import _0L_C_.DialogBox;

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.assembleegameclient.objects.Player;
import com.company.assembleegameclient.ui.CreditsUI;
import com.company.assembleegameclient.ui.SellAbleButton;
import com.company.ui.SimpleText;

import flash.display.Bitmap;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
import flash.text.TextFieldAutoSize;

public class SellItemInformation extends Sprite {

    [Embed(source="sold.png")]
    private static var itemSoldIcon:Class;

    [Inject]
    public var gs:GameSprite;
    [Inject]
    public var player:Player;

    private var currentEvent:ItemSellCandidateEvent;

    private var closeButton:FancyTextButton;
    private var sellButton:SellAbleButton;
    private var creditsUI:CreditsUI;

    public function SellItemInformation(event:ItemSellCandidateEvent) {
        this.currentEvent = event;
        this.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        addChild(new SellItemMerchant.bg());
    }

    public function initialize():void {
        if (this.currentEvent.sellAble) {
            this.sellButton = new SellAbleButton("Sell for {price}", 16, this.currentEvent.price, this.currentEvent.currency);
            this.closeButton = new FancyTextButton(16, "Close", this.sellButton.width);

            this.sellButton.scaleX = this.sellButton.scaleY =
            this.closeButton.scaleX = this.closeButton.scaleY = 2;

            this.sellButton.x = 50;
            this.closeButton.x = 750 - this.sellButton.width;

            this.sellButton.y = 600 - this.sellButton.height - 10;
            this.closeButton.y = this.sellButton.y;

            this.sellButton.addEventListener(MouseEvent.CLICK, this.sellItem);
            this.closeButton.addEventListener(MouseEvent.CLICK, this.onComplete);

            addChild(this.sellButton);
            addChild(this.closeButton);
        }
        else {
            this.closeButton = new FancyTextButton(16, "Close");
            this.closeButton.scaleX = this.closeButton.scaleY = 2;
            this.closeButton.x = 400 - (this.closeButton.width / 2);
            this.closeButton.y = 600 - this.closeButton.height - 10;
            this.closeButton.addEventListener(MouseEvent.CLICK, this.onComplete);
            addChild(this.closeButton);
        }

        var icon:Bitmap = new Bitmap(this.currentEvent.graphicsData);
        icon.scaleX = icon.scaleY = 2;
        icon.x = 400 - (icon.width / 2);
        icon.y = 300 - (icon.height / 2);
        addChild(icon);

        if(!this.currentEvent.sellAble) {
            var errorText:SimpleText = new SimpleText(21, 0xffffff, false, 800);
            errorText.htmlText = "This item is not sellable.";
            errorText.boldText(true);
            errorText.filters = [new DropShadowFilter(0, 0, 0, 1.0, 5.0, 5.0, 10.0)];
            errorText.y = icon.y + icon.width;
            errorText.autoSize = TextFieldAutoSize.CENTER;
            addChild(errorText);
        }

        var title:SimpleText = new SimpleText(56, 0xffffff, false, 800);
        title.htmlText = '<p align="center">' + ObjectLibrary.Items[this.currentEvent.itemId].@id + '</p>';
        title.boldText(true);
        title.filters = [new DropShadowFilter(0, 0, 0, 1.0, 5.0, 5.0, 10.0)];
        title.y = 10;
        title.autoSize = TextFieldAutoSize.CENTER;
        addChild(title);

        this.creditsUI = new CreditsUI(this.gs);
        this.creditsUI.x = 800;
        addChild(this.creditsUI);
    }

    private function onComplete(event:Event):void {
        dispatchEvent(new Event(Event.COMPLETE));
    }

    private function onEnterFrame(event:Event):void {
        this.creditsUI.draw(this.player.credits_);
    }

    private function sellItem(event:MouseEvent):void {
        this.gs.addEventListener(ItemSellResultEvent.SELL_RESULT, this.onSellResult);
        this.sellButton.enabled(false);
        this.gs.packetManager.sellItem(this.currentEvent.slotId);
    }

    private function onSellResult(event:ItemSellResultEvent):void {
        this.gs.removeEventListener(ItemSellResultEvent.SELL_RESULT, this.onSellResult);
        if(event.sellSuccess) {
            this.closeButton.x = 400 - (this.closeButton.width / 2);
            this.closeButton.y = 600 - this.closeButton.height - 10;
            removeChild(this.sellButton);

            var soldIcon:Bitmap = new itemSoldIcon();
            soldIcon.scaleX = soldIcon.scaleY = 5;
            soldIcon.x = 400 - (soldIcon.width / 2);
            soldIcon.y = 300 - (soldIcon.height / 2);
            addChild(soldIcon);

            var tween:GTween = new GTween(soldIcon, 0.4, { "scaleX": 0.5, "scaleY": 0.5});
            tween.onChange = function(t:GTween):void {
                soldIcon.x = 400 - (soldIcon.width / 2);
                soldIcon.y = 300 - (soldIcon.height / 2);
            }
        }
        else {
            var dialogBox:DialogBox = new DialogBox(event.errorMessage, "Error while selling item.", "Ok", null);
            dialogBox.addEventListener(DialogBox.BUTTON1_EVENT, this.onComplete);
            addChild(dialogBox);
        }
    }
}
}
