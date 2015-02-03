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

import flash.text.TextFieldAutoSize;

public class TownHallShop extends VillageManagementScreenBase {

    private var status:SimpleText;
    private var scrollBar:ScrollBar;

    public function TownHallShop() {
    }

    override public function initialize():void {
        var smp:SimpleText = new SimpleText(46, 0xffffff, false, WIDTH);
        smp.boldText(true);
        smp.autoSize = TextFieldAutoSize.CENTER;
        smp.htmlText = '<p align="center">Shop</p>';
        addChild(smp);

        var webRequest:WebRequest = new WebRequest(Parameters.getAccountServerIP(), "/town", true, 5);
        webRequest.addEventListener(WebRequestSuccessEvent.GENERIC_DATA, this.onOfferReceiveSuccess);
        webRequest.addEventListener(WebRequestErrorEvent.TEXT_ERROR, this.onOfferReceiveError);
        webRequest.addEventListener(WebRequestRetryEvent.RETRY, this.onRetry);
        webRequest.sendRequest("/getShopOffers", Account._get().credentials());

        this.status = new SimpleText(46, 0xffffff);
        this.status.text = "Loading...";
        this.status.updateMetrics();
        this.status.x = ((WIDTH / 2) - (this.status.width / 2));
        this.status.y = ((HEIGHT / 2) - (this.status.height / 2));
        addChild(this.status);
    }

    private function onOfferReceiveSuccess(event:WebRequestSuccessEvent):void {
        var c:int = 0;
        var nextOfferHeight:Number = 60;
        var offerData:XML;
        for each(offerData in XML(event.data_).Offers.Offer) {
            var offer:shopOffer = new shopOffer(offerData);
            offer.x = 10;
            offer.y = nextOfferHeight;
            addChild(offer);

            nextOfferHeight += (shopOffer.HEIGHT + 10);
            c++;
        }

        this.scrollBar = new ScrollBar(16, 430);
        this.scrollBar.x = WIDTH - 20;
        this.scrollBar.y = 60;
        this.scrollBar._fA_(430, ((shopOffer.HEIGHT * c) + ((c - 1) * 10)), true);
        addChild(this.scrollBar);

        removeChild(this.status);
    }

    private function onOfferReceiveError(event:WebRequestErrorEvent):void {
        this.status.text = "Error loading offers:\n" + event.text_;
        this.status.updateMetrics();
        this.status.x = ((WIDTH / 2) - (this.status.width / 2));
        this.status.y = (HEIGHT / 2) - (this.status.height / 2);
    }

    private function onRetry(event:WebRequestRetryEvent):void {
        this.status.text = "Attempt[" + event.attempt + "]: Error loading offers.\nRetrying!";
        this.status.updateMetrics();
        this.status.x = ((WIDTH / 2) - (this.status.width / 2));
        this.status.y = ((HEIGHT / 2) - (this.status.height / 2));
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
