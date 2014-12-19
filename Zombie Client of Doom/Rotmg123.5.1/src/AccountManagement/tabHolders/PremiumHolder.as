/**
 * Created by Fabian on 18.12.2014.
 */
package AccountManagement.tabHolders {
import AccountManagement.AccountManagementBody;
import AccountManagement.images.AccountManagementImages;
import AccountManagement.ui.TabButton;

import _0L_C_.DialogBox;

import com.company.ui.SimpleText;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;

public class PremiumHolder extends TabHolder {

    private var premiumPurchased:Boolean;

    public function PremiumHolder(parent:AccountManagementBody, purchased:Boolean) {
        super(parent);
        this.premiumPurchased = purchased;
    }

    public override function initialize(tab:TabButton):void {
        super.tab = tab;

        if(!premiumPurchased) {
            var purchaseText:SimpleText = new SimpleText(46, 0xffffff);
            purchaseText.multiline = true;
            purchaseText.text = "You are not a premium member.";
            purchaseText.filters = [new DropShadowFilter()];
            purchaseText.updateMetrics();
            purchaseText.x = ((WIDTH / 2) - (purchaseText.textWidth / 2));
            purchaseText.y = 20;
            addChild(purchaseText);

            purchaseText = new SimpleText(30, 0xffffff);
            purchaseText.multiline = true;
            purchaseText.text = "In order to access premium features, click on the image below.";
            purchaseText.filters = [new DropShadowFilter()];
            purchaseText.updateMetrics();
            purchaseText.x = ((WIDTH / 2) - (purchaseText.textWidth / 2));
            purchaseText.y = 80;
            addChild(purchaseText);

            var iconSprite:Sprite = new Sprite();
            iconSprite.buttonMode = true;
            iconSprite.addChild(new Bitmap(new AccountManagementImages.premiumBig().bitmapData));
            iconSprite.filters = [new DropShadowFilter()];
            iconSprite.x = ((WIDTH / 2) - (iconSprite.width / 2));
            iconSprite.y = 120 + ((320 / 2) - (iconSprite.height / 2));
            addChild(iconSprite);

            iconSprite.addEventListener(MouseEvent.CLICK, function(event:MouseEvent):void {
                var dialogBox:DialogBox = new DialogBox("You will be redirected to another website.", "Continue?", "Ok", "Cancel", "");
                addChild(dialogBox);
                dialogBox.addEventListener(DialogBox.BUTTON1_EVENT, function(e1:Event):void {
                    trace("Premium purchased");
                    removeChild(dialogBox);
                });
                dialogBox.addEventListener(DialogBox.BUTTON2_EVENT, function(e2:Event):void {
                    removeChild(dialogBox);
                });
            });
        }
        else {
            var arrow = AccountManagementImages.nextArrow(0.5);
            var arrow2 = AccountManagementImages.prevArrow(0.5);

            arrow.x = 800 - arrow.width;
            arrow2.x = 400;

            addChild(arrow);
            addChild(arrow2);

            var simpletext = new SimpleText(36, 0xffffff);
            simpletext.text = "Premium Tab";
            simpletext.updateMetrics();
            addChild(simpletext);
        }
    }
}
}
