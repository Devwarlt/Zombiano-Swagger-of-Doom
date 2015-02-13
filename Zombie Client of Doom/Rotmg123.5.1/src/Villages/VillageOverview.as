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
import com.company.ui.SimpleText;

import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextFieldAutoSize;

public class VillageOverview extends VillageManagementScreenBase {
    [Embed("../FireBite/Embeds/Images/data/button_reload.png")]
    private static var reloadButtonImage:Class;

    private var status:SimpleText;
    private var headingText:SimpleText;
    private var reloadButton:Sprite;

    private var houses:SimpleText;
    private var shopLevel:SimpleText;

    override public function initialize():void {
        var webRequest:WebRequest = new WebRequest(Parameters.getAccountServerIP(), "/town", true, 5);
        webRequest.addEventListener(WebRequestSuccessEvent.GENERIC_DATA, this.onOfferReceiveSuccess);
        webRequest.addEventListener(WebRequestErrorEvent.TEXT_ERROR, this.onOfferReceiveError);
        webRequest.addEventListener(WebRequestRetryEvent.RETRY, this.onRetry);
        webRequest.sendRequest("/getGeneralInfo", Account._get().credentials());

        this.headingText = new SimpleText(46, 0xffffff, false, WIDTH);
        this.headingText.boldText(true);
        this.headingText.autoSize = TextFieldAutoSize.CENTER;
        this.headingText.htmlText = '<p align="center">General</p>';
        addChild(this.headingText);

        this.status = new SimpleText(46, 0xffffff, false, WIDTH);
        this.status.wordWrap = true;
        this.status.multiline = true;
        this.status.htmlText = '<p align="center">Loading...</p>';
        this.status.autoSize = TextFieldAutoSize.CENTER;
        this.status.updateMetrics();
        this.status.x = ((WIDTH / 2) - (this.status.width / 2));
        this.status.y = ((HEIGHT / 2) - (this.status.height / 2));
        addChild(this.status);
    }

    private function onOfferReceiveSuccess(event:WebRequestSuccessEvent):void {
        this.reloadButton = new Sprite();
        this.reloadButton.addChild(new reloadButtonImage());
        this.reloadButton.x = WIDTH - this.reloadButton.width - 5;
        this.reloadButton.y = 5;
        this.reloadButton.addEventListener(MouseEvent.CLICK, this.reload);
        addChild(this.reloadButton);

        this.houses = new SimpleText(20, 0xffffff);
        this.houses.x = 10;
        this.houses.y = 70;
        this.houses.text = "Houses: " + XML(event.data_).Houses.@current + "/" + XML(event.data_).Houses.@max;
        this.houses.updateMetrics();
        addChild(this.houses);

        this.shopLevel = new SimpleText(20, 0xffffff);
        this.shopLevel.x = 10;
        this.shopLevel.y = 70 + this.houses.height;
        this.shopLevel.text = "Current Shop Level: " + (XML(event.data_).Shop.@upgrade == 0 ? "Basic" : "Invalid ShopType");
        this.shopLevel.updateMetrics();
        addChild(this.shopLevel);

        removeChild(this.status);
    }

    private function onOfferReceiveError(event:WebRequestErrorEvent):void {
        this.status.htmlText = '<p align="center">' + "Error loading overview:\n" + event.text_ + '</p>';
        this.status.autoSize = TextFieldAutoSize.CENTER;
        this.status.updateMetrics();
        this.status.x = ((WIDTH / 2) - (this.status.width / 2));
        this.status.y = (HEIGHT / 2) - (this.status.height / 2);

        this.reloadButton = new Sprite();
        this.reloadButton.addChild(new reloadButtonImage());
        this.reloadButton.x = WIDTH - this.reloadButton.width - 5;
        this.reloadButton.y = 5;
        this.reloadButton.addEventListener(MouseEvent.CLICK, this.reload);
        addChild(this.reloadButton);
    }

    private function onRetry(event:WebRequestRetryEvent):void {
        this.status.htmlText = '<p align="center">' + "Attempt[" + event.attempt + "]: Error loading overview.\nRetrying!" + '</p>';
        this.status.autoSize = TextFieldAutoSize.CENTER;
        this.status.updateMetrics();
        this.status.x = ((WIDTH / 2) - (this.status.width / 2));
        this.status.y = ((HEIGHT / 2) - (this.status.height / 2));
    }

    private function reload(event:MouseEvent):void {
        if (contains(this.status)) {
            removeChild(this.status);
        }

        if (contains(this.houses)) {
            removeChild(this.houses);
            removeChild(this.shopLevel);
        }

        graphics.clear();
        removeChild(this.reloadButton);
        removeChild(this.headingText);
        initialize();
    }
}
}
