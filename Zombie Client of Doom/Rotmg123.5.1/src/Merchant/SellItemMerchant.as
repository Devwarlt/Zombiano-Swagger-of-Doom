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

import SimpleInject.ISimpleInjector;

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.ui.SellItemContainer;

import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;

public class SellItemMerchant extends Sprite {

    [Embed(source="bg.png")]
    public static var bg:Class;

    private var itemContainer:SellItemContainer;
    private var itemInformation:SellItemInformation;

    private var childHolder:DisplayObject;
    private var injector:ISimpleInjector;

    public var gs:GameSprite;

    public function SellItemMerchant(gs:GameSprite) {
        this.gs = gs;

        this.injector = new SellItemMerchantInjector(this);

        var bgMask:Shape = new Shape();
        bgMask.graphics.beginFill(0x000000, 0.0);
        bgMask.graphics.drawRect(0, 0, 600, 800);
        bgMask.graphics.endFill();
        addChild(bgMask);

        var background:Bitmap = new bg();
        background.x = -100;
        background.mask = bgMask;
        addChild(background);

        this.itemContainer = new SellItemContainer();
        this.itemContainer.x = 150;
        this.itemContainer.y = 150;
        this.itemContainer.addEventListener(ItemSellCandidateEvent.GOT_CANDIDATE, this.onItemGet);
        setNewChild(this.itemContainer);
    }

    private function onItemGet(event:ItemSellCandidateEvent):void {
        this.itemInformation = new SellItemInformation(event);
        setNewChild(this.itemInformation);
    }

    private function setNewChild(child:DisplayObject):void {
        if (this.childHolder != null) {
            removeChild(this.childHolder);
        }
        this.childHolder = child;
        this.childHolder.addEventListener(Event.COMPLETE, this.switchToDefault);
        if (this.childHolder != null) {
            this.injector.injectInto(this.childHolder);
            addChild(this.childHolder);
        }
    }

    private function switchToDefault(event:Event):void {
        setNewChild(this.itemContainer);
    }
}
}
