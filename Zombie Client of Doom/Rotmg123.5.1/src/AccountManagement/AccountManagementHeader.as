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
 * Created by Fabian on 17.12.2014.
 */
package AccountManagement {
import AccountManagement.tabHolders.AchievementsHolder;
import AccountManagement.tabHolders.FirePacksHolder;
import AccountManagement.tabHolders.OverviewHolder;
import AccountManagement.tabHolders.PremiumHolder;
import AccountManagement.tabHolders.SettingsHolder;
import AccountManagement.tabHolders.TabHolder;
import AccountManagement.images.AccountManagementImages;
import AccountManagement.ui.TabButton;

import Villages.nations.Country;

import _qN_.Account;

import com.company.rotmg.graphics.ranks.premiumRank;
import com.company.ui.SimpleText;

import flash.display.Bitmap;

import flash.display.BitmapData;

import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
import flash.filters.GlowFilter;

public class AccountManagementHeader extends Sprite {

    public static const WIDTH:int = 800;
    public static const HEIGHT:int = 80;

    private var managementParent:AccountManagementScreen;

    private var tabs:Vector.<TabButton>;

    private var nextTabLeftWidth:Number = 10;
    private var nextTabRightWidth:Number = WIDTH - 10;
    private var nextTabId:Number = 0;

    public var titleText:SimpleText;
    public var email:SimpleText;

    public function AccountManagementHeader(parent:AccountManagementScreen) {
        this.managementParent = parent;
        this.tabs = new Vector.<TabButton>();
        var background:Bitmap = new AccountManagementImages.AccountHeaderBackground();
        background.filters = [new GlowFilter()];
        addChild(background);
    }

    public function initialize():void {

        this.titleText = new SimpleText(26, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this.titleText.boldText(true);
        this.titleText.text = "Currently logged in as:";
        this.titleText.updateMetrics();
        this.titleText.filters = [new DropShadowFilter(0, 0, 0)];
        this.titleText.y = 2;
        this.titleText.x = 10;
        addChild(this.titleText);

        this.email = new SimpleText(20, 0xB3B3B3, false, 0, 30, "Myriad Pro");
        this.email.text = Account._get().guid();
        this.email.updateMetrics();
        this.email.y = 26;
        this.email.x = 10;
        addChild(this.email);

        if (managementParent.accountXml.Country != -1) {
            var c:Country = new Country(managementParent.accountXml.Country);

            var cText:SimpleText = new SimpleText(18, 0xB3B3B3);
            cText.htmlText = '<b>Nation:</b>\n' + c.name;
            cText.x = this.titleText.width > this.email.width ? (this.titleText.x + this.titleText.width + 50) : (this.email.x + this.email.width + 50);
            cText.y = 4;
            cText.updateMetrics();
            cText.filters = [new DropShadowFilter()];
            addChild(cText);

            var img:Bitmap = c.image;
            img.x = cText.x + cText.width + 10;
            img.y = 2;
            img.scaleX = img.scaleY = 0.35;
            img.filters = [new DropShadowFilter()];
            addChild(img);
        }

        addTab("Overview", new AccountManagementImages.homeIcon().bitmapData, new OverviewHolder(managementParent.accountBody));
        addTab("Fire Packs (" + XMLList(managementParent.accountXml.FirePacks.Pack).length() + ")", new AccountManagementImages.goldFirePack().bitmapData, new FirePacksHolder(managementParent.accountBody));
        addTab("Achievements (" + managementParent.accountXml.Achievements.@completed + "/" + managementParent.accountXml.Achievements.@total + ")",
                new AccountManagementImages.achievement_image().bitmapData, new AchievementsHolder(managementParent.accountBody));
        addTab("Settings", new AccountManagementImages.settings2Icon().bitmapData, new SettingsHolder(managementParent.accountBody));
        addTab("Premium", new premiumRank().bitmapData, new PremiumHolder(managementParent.accountBody, managementParent.accountXml.Premium.toString().toLowerCase() == "true"), true);
    }

    public function switchToTab(name:String):void {
        for each (var tab:TabButton in tabs) {
            var text:String = tab.text.text.slice(0, tab.text.text.indexOf("(") == -1 ? tab.text.text.length : tab.text.text.indexOf("(") - 1);
            name = name.slice(0, name.indexOf("(") == -1 ? name.length : name.indexOf("(") - 1);
            if (text == name) {
                tab.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
            }
        }
    }

    private function addTab(text:String, icon:BitmapData, holder:TabHolder, right:Boolean = false):void {
        var tab:TabButton = new TabButton(text, icon, nextTabId, nextTabId == 0);
        tab.addEventListener(MouseEvent.CLICK, this.onTabClick);
        tab.holder = holder;
        tab.x = right ? nextTabRightWidth - tab.w_ : nextTabLeftWidth;
        tab.y = HEIGHT - tab.height;
        tabs.push(tab);
        addChild(tab);

        if (tab.selected) {
            managementParent.accountBody.updateScreen(tab.holder);
        }

        if (!right) {
            nextTabLeftWidth += (tab.w_ + 5);
        }
        else {
            nextTabRightWidth -= (tab.w_ + 5);
        }
        nextTabId++;
    }

    private function onTabClick(event:MouseEvent):void {
        for each (var tab:TabButton in this.tabs) {
            tab.selected = false;
        }

        tab = event.target as TabButton;
        tab.selected = true;
        managementParent.selectedTab = tab.text.text;
        managementParent.accountBody.updateScreen(tab.holder);
    }
}
}
