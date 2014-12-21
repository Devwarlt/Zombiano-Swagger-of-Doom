/**
 * Created by Fabian on 18.12.2014.
 */
package AccountManagement.tabHolders {
import AccountManagement.AccountManagementBody;
import AccountManagement.images.AccountManagementImages;
import AccountManagement.tabHolders.premium.PremiumEventCalendar;
import AccountManagement.tabHolders.premium.PremiumTabHolder;
import AccountManagement.ui.TabButton;

import _0L_C_.DialogBox;

import com.company.ui.SimpleText;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;

public class PremiumHolder extends TabHolder {

    private var premiumPurchased:Boolean;
    private var tabHolder:TabHolder;
    private var tabs:Vector.<TabButton>;
    private var tabSprite:Sprite;
    private var nextTabWidth:Number = 10;
    private var nextTabId:Number = 0;

    public function PremiumHolder(parent:AccountManagementBody, purchased:Boolean) {
        super(parent);
        this.premiumPurchased = purchased;
        this.tabs = new Vector.<TabButton>();
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
            tabSprite = new Sprite();
            tabSprite.graphics.lineStyle(2, 0xFFD700);
            tabSprite.graphics.moveTo(0, 29);
            tabSprite.graphics.lineTo(800, 29);
            tabSprite.graphics.lineStyle();

            addTab("Event Calendar", null, new PremiumEventCalendar(bodyParent));
            addTab("TAB 2", null, new PremiumTabHolder(bodyParent));

            addChild(tabSprite);
        }
    }

    public function updateScreen(holder:PremiumTabHolder):void {
        if(this.tabHolder != null) {
            if (getChildIndex(this.tabHolder) != -1) {
                removeChild(this.tabHolder);
            }
        }
        this.tabHolder = holder;
        this.tabHolder.y = 30;
        addChild(this.tabHolder);
    }

    private function onTabClick(event:MouseEvent):void {
        for each (var tab:TabButton in this.tabs) {
            tab.selected = false;
        }

        tab = event.target as TabButton;
        tab.selected = true;
        updateScreen(tab.holder as PremiumTabHolder);
    }

    private function addTab(text:String, icon:BitmapData, holder:PremiumTabHolder):void {
        var tabButton:TabButton = new TabButton(text, icon, nextTabId, nextTabId == 0);
        tabButton.deSelectedColor = 0x7A6700;
        tabButton.selectedColor = 0xFFD700;
        tabButton.holder = holder;
        tabButton.x = nextTabWidth;
        tabButton.y = 30 - (tabButton.height + 2);
        tabButton.addEventListener(MouseEvent.CLICK, this.onTabClick);
        tabs.push(tabButton);
        tabSprite.addChild(tabButton);
        if(nextTabId == 0) {
            updateScreen(tabButton.holder as PremiumTabHolder);
        }

        nextTabId++;
        nextTabWidth += tabButton.width + 5;
    }
}
}
