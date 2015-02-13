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
import Villages.ui.TabButton;

import com.company.ui.SimpleText;

import flash.display.Shape;

import flash.display.Shape;

import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;

public class TownHallScreen extends Sprite {

    public static const WIDTH:int = 800;
    public static const HEIGHT:int = 600;

    [Embed(source="pergament-gross.png")]
    private static var DefaultBackground:Class;
    [Embed(source="backgroundScroll.png")]
    private static var backgroundScroll:Class;

    private var selectedTab:TabButton;
    private var nextTabLeftWidth:Number = 115;
    private var nextTabRightWidth:Number = WIDTH - 115;
    private var nextTabId:Number = 0;

    private var townName:SimpleText;
    private var currentManagementScreen:VillageManagementScreenBase;

    public function TownHallScreen(population:Array) {
        addChild(new DefaultBackground());
        addChild(new backgroundScroll());

        this.townName = new SimpleText(46, 0x000000);
        this.townName.text = "Germany - Berlin (" + population[0] + "/" + population[1] + ")";
        this.townName.updateMetrics();
        this.townName.y = 10;
        this.townName.x = (400 - (this.townName.width / 2));
        this.townName.filters = [new DropShadowFilter()];
        addChild(this.townName);

        var s:Shape = new Shape();
        s.graphics.beginFill(0x000000, 1.0);
        s.graphics.drawRect(86, 100, 624, 4);
        s.graphics.endFill();
        addChild(s);

        //graphics.lineStyle(10, 0x000000, 1.0);
        //graphics.moveTo(88, 100);
        //graphics.lineTo(88, 710);
        //graphics.lineStyle();

        addTab("General", new VillageOverview());
        addTab("Shop", new TownHallShop());
    }

    private function addTab(text:String, holder:VillageManagementScreenBase, right:Boolean = false):void {
        var tab:TabButton = new TabButton(text, null, nextTabId, nextTabId == 0);
        tab.addEventListener(MouseEvent.CLICK, this.onTabClick);
        tab.holder = holder;
        tab.x = right ? nextTabRightWidth - tab.w_ : nextTabLeftWidth;
        tab.y = 100 - tab.height;
        addChild(tab);

        if(nextTabId == 0) {
            this.dispatchManagementScreen(tab.holder);
        }

        if(tab.selected) {
            this.selectedTab = tab;
        }

        if(!right) {
            nextTabLeftWidth += (tab.w_ + 5);
        }
        else {
            nextTabRightWidth -= (tab.w_ + 5);
        }
        nextTabId++;
    }

    public function dispatchManagementScreen(screen:VillageManagementScreenBase):void {
        if(this.currentManagementScreen) {
            removeChild(this.currentManagementScreen);
        }
        this.currentManagementScreen = screen;

        if(this.currentManagementScreen != null) {
            this.currentManagementScreen.x = this.currentManagementScreen.y = 100;
            addChild(this.currentManagementScreen);
        }
    }

    private function onTabClick(event:MouseEvent):void {
        if(this.selectedTab) {
            this.selectedTab.selected = false;
        }

        var tab:TabButton = event.target as TabButton;
        tab.selected = true;
        this.selectedTab = tab;
        dispatchManagementScreen(tab.holder);
    }
}
}
