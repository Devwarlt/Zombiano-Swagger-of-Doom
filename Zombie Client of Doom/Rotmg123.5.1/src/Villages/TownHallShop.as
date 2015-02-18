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
 * Created by Fabian on 28.01.2015.
 */
package Villages {
import WebRequestEvents.WebRequestErrorEvent;
import WebRequestEvents.WebRequestRetryEvent;
import WebRequestEvents.WebRequestSuccessEvent;

import _qN_.Account;

import com.company.assembleegameclient.appengine.WebRequest;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.ui.ScrollBar;
import com.company.ui.SimpleText;

import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextFieldAutoSize;

public class TownHallShop extends VillageManagementScreenBase {

    [Embed("../FireBite/Embeds/Images/data/button_reload.png")]
    private static var reloadButtonImage:Class;

    private var status:SimpleText;
    private var headingText:SimpleText;
    private var scrollBar:ScrollBar;
    private var reloadButton:Sprite;
    private var offersHolder:Sprite;

    override public function initialize():void {
        var webRequest:WebRequest = new WebRequest(Parameters.getAccountServerIP(), "/town", true, 5);
        webRequest.addEventListener(WebRequestSuccessEvent.GENERIC_DATA, this.onOfferReceiveSuccess);
        webRequest.addEventListener(WebRequestErrorEvent.TEXT_ERROR, this.onOfferReceiveError);
        webRequest.addEventListener(WebRequestRetryEvent.RETRY, this.onRetry);
        webRequest.sendRequest("/getShopOffers", Account._get().credentials());

        this.headingText = new SimpleText(46, 0xffffff, false, WIDTH);
        this.headingText.boldText(true);
        this.headingText.autoSize = TextFieldAutoSize.CENTER;
        this.headingText.htmlText = '<p align="center">Shop</p>';
        addChild(this.headingText);

        this.status = new SimpleText(46, 0xffffff);
        this.status.htmlText = '<p align="center">Loading...</p>';
        this.status.autoSize = TextFieldAutoSize.CENTER;
        this.status.updateMetrics();
        this.status.x = ((WIDTH / 2) - (this.status.width / 2));
        this.status.y = ((HEIGHT / 2) - (this.status.height / 2));
        addChild(this.status);
    }

    private function onOfferReceiveSuccess(event:WebRequestSuccessEvent):void {
        prepareForOffers();

        var c:int = 0;
        var nextOfferHeight:Number = 60;
        var offerData:XML;
        for each(offerData in XML(event.data_).Offers.Offer) {
            var offer:shopOffer = new shopOffer(offerData);
            offer.x = 10;
            offer.y = nextOfferHeight;
            this.offersHolder.addChild(offer);

            nextOfferHeight += (shopOffer.HEIGHT + 10);
            c++;
        }

        this.scrollBar = new ScrollBar(16, 430);
        this.scrollBar.x = WIDTH - 20;
        this.scrollBar.y = 60;
        this.scrollBar.addEventListener(Event.CHANGE, this.onScroll);
        this.scrollBar._fA_(430, ((shopOffer.HEIGHT * c) + ((c - 1) * 10)), true);
        addChild(this.scrollBar);

        this.reloadButton = new Sprite();
        this.reloadButton.addChild(new reloadButtonImage());
        this.reloadButton.x = WIDTH - this.reloadButton.width - 5;
        this.reloadButton.y = 5;
        this.reloadButton.addEventListener(MouseEvent.CLICK, this.reloadOffers);
        addChild(this.reloadButton);

        removeChild(this.status);
    }

    private function onOfferReceiveError(event:WebRequestErrorEvent):void {
        this.status.htmlText = '<p align="center">' + "Error loading offers:\n" + event.text_ + '</p>';
        this.status.autoSize = TextFieldAutoSize.CENTER;
        this.status.updateMetrics();
        this.status.x = ((WIDTH / 2) - (this.status.width / 2));
        this.status.y = (HEIGHT / 2) - (this.status.height / 2);

        this.reloadButton = new Sprite();
        this.reloadButton.addChild(new reloadButtonImage());
        this.reloadButton.x = WIDTH - this.reloadButton.width - 5;
        this.reloadButton.y = 5;
        this.reloadButton.addEventListener(MouseEvent.CLICK, this.reloadOffers);
        addChild(this.reloadButton);
    }

    private function onRetry(event:WebRequestRetryEvent):void {
        this.status.htmlText = '<p align="center">' + "Attempt[" + event.attempt + "]: Error loading offers.\nRetrying!" + '</p>';
        this.status.autoSize = TextFieldAutoSize.CENTER;
        this.status.updateMetrics();
        this.status.x = ((WIDTH / 2) - (this.status.width / 2));
        this.status.y = ((HEIGHT / 2) - (this.status.height / 2));
    }

    private function prepareForOffers():void {
        var mask:Shape = new Shape();
        mask.name = "OffersMask";
        mask.y = 55;
        mask.graphics.beginFill(0x000000, 0.0);
        mask.graphics.drawRect(0, 0, 570, 448);
        mask.graphics.endFill();
        addChild(mask);

        graphics.lineStyle(2, 0xFF9D00, 1.0);
        graphics.moveTo(0, 54);
        graphics.lineTo(0, HEIGHT);
        graphics.moveTo(0, 54);
        graphics.lineTo(570, 54);
        graphics.moveTo(570, 54);
        graphics.lineTo(570, HEIGHT);

        this.offersHolder = new Sprite();
        this.offersHolder.mask = mask;
        addChild(this.offersHolder);
    }

    private function reloadOffers(event:MouseEvent):void {
        if (contains(this.status)) {
            removeChild(this.status);
        }
        if(getChildByName("OffersMask") != null) {
            removeChild(getChildByName("OffersMask"));
        }
        graphics.clear();
        removeChild(this.scrollBar);
        removeChild(this.reloadButton);
        removeChild(this.headingText);
        removeChild(this.offersHolder);
        initialize();
    }

    private function onScroll(event:Event):void {
        this.offersHolder.y = (-this.scrollBar._Q_D_() * (this.scrollBar.totalHeight - 430));
    }
}
}

import ToolTips.ToolTip;

import com.company.assembleegameclient.ui.SellableButton;
import com.company.ui.SimpleText;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.MouseEvent;

class shopOffer extends Sprite {

    public static const WIDTH:int = 550;
    public static const HEIGHT:int = 100;

    private var offerTitle:SimpleText;
    private var description:SimpleText;

    [Embed(source="ui/house.png")]
    private static var house:Class;
    [Embed(source="ui/tradingPost.png")]
    private static var tradingPost:Class;

    private static var toolTip:ToolTip;
    private var offerData:XML;
    private var offerIcon:Bitmap;

    public function shopOffer(offerData:XML) {
        graphics.beginFill(0x000000, 1.0);
        graphics.drawRect(0, 0, WIDTH, HEIGHT);
        graphics.endFill();

        this.offerData = offerData;

        if(this.offerIcon = new shopOffer[offerData.@image]) {
            this.offerIcon.x = 10;
            this.offerIcon.y = 15;
            addChild(this.offerIcon);
        }

        this.offerTitle = new SimpleText(20, 0xffffff);
        this.offerTitle.text = offerData.@offerTitle;
        this.offerTitle.boldText(true);
        this.offerTitle.updateMetrics();
        this.offerTitle.x = 100;
        this.offerTitle.y = 5;
        addChild(this.offerTitle);

        this.description = new SimpleText(16, 0xffffff, false, 260);
        this.description.multiline = true;
        this.description.wordWrap = true;
        this.description.text = offerData.@description.split("\\n").join("\n");
        this.description.x = 100;
        this.description.y = 30;
        addChild(this.description);

        var btn:SellableButton = new SellableButton("Buy for ", 16, offerData.@price, offerData.@currency);
        btn.x = WIDTH - btn.w_ - 10;
        btn.y = 50 - ((btn.text_.textHeight + 8) / 2);
        addChild(btn);

        graphics.lineStyle(2, 0xFFD700);
        graphics.drawRect(0, 0, WIDTH, HEIGHT);

        this.addEventListener(MouseEvent.ROLL_OVER, this.dispatchTooltip);
        this.addEventListener(MouseEvent.ROLL_OUT, this.removeTooltip);
    }

    private function dispatchTooltip(event:MouseEvent):void {
        if(toolTip) {
            if(toolTip.parent) {
                toolTip.parent.removeChild(toolTip);
            }
        }

        toolTip = new offerInformation(this.offerData.@image, this.offerIcon ? this.offerIcon.bitmapData : null);
        parent.parent.parent.stage.addChild(toolTip);
    }

    private function removeTooltip(event:MouseEvent):void {
        if(toolTip) {
            if(toolTip.parent) {
                toolTip.parent.removeChild(toolTip);
            }
        }
    }
}

class offerInformation extends ToolTip {

    private var icon:Bitmap;
    private var objectName:SimpleText;
    private var objectInfo:SimpleText;

    public function offerInformation(offerType:String, icon:BitmapData) {
        super(0x000000, 1.0, 0xffffff, 1.0, true);

        this.icon = new Bitmap(icon);
        this.objectName = new SimpleText(20, 0xffffff, false, 180);
        this.objectInfo = new SimpleText(16, 0xffffff, false, 250);

        this.objectName.boldText(true);

        this.objectName.wordWrap =
        this.objectInfo.wordWrap =
        this.objectName.multiline =
        this.objectInfo.multiline = true;

        this.objectName.text = informationDetails._get(offerType).name;
        this.objectInfo.text = informationDetails._get(offerType).info;

        this.objectName.updateMetrics();
        this.objectInfo.updateMetrics();

        addChild(this.icon);
        addChild(this.objectName);
        addChild(this.objectInfo);

        align();
    }

    private function align():void {
        this.icon.x = 5;
        this.icon.y = 5;
        this.objectName.x = this.icon.width + 20;
        this.objectName.y = (((this.icon.height / 2) + 5) - (this.objectName.textHeight / 2));
        this.objectInfo.x = 10;
        this.objectInfo.y = 80;
    }
}

class informationDetails {
    private static var m_details:informationDetails;

    private var data:Object;

    public function informationDetails() {
        data = {
            "house": {
                "name": "House",
                "info": "This building will increase your maximum population by the specific amount."
            },
            "tradingPost": {
                "name": "Trading Post",
                "info": "This building will allow you to buy/sell goods with other villages/countries, and it will also allow you to create trade agreements with other villages"
            }
        }
    }

    public static function _get(offerType:String):Object {
        if(!m_details) m_details = new informationDetails();
        return m_details.data[offerType];
    }
}
