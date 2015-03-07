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
package com.company.assembleegameclient.ui {
import Merchant.ItemSellCandidateEvent;

import com.company.ui.SimpleText;
import com.company.util.GraphicHelper;

import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Point;
import flash.text.TextFieldAutoSize;

public class SellItemContainer extends Sprite {

    private var dragItemHereText:SimpleText;
    private var dropItemHereText:SimpleText;
    private var over:Boolean;

    public function SellItemContainer() {
        this.dragItemHereText = new SimpleText(21, 0xffffff, false, 300);
        this.dragItemHereText.htmlText = '<p align="center">     Drag an item here\nto get price information</p>';
        this.dragItemHereText.autoSize = TextFieldAutoSize.CENTER;
        this.dragItemHereText.boldText(true);
        this.dragItemHereText.y = (150 - (this.dragItemHereText.height / 2));
        addChild(this.dragItemHereText);

        this.dropItemHereText = new SimpleText(21, 0xffffff, false, 300);
        this.dropItemHereText.htmlText = '<p align="center">Drop your item here.</p>';
        this.dropItemHereText.autoSize = TextFieldAutoSize.CENTER;
        this.dropItemHereText.boldText(true);
        this.dropItemHereText.visible = false;
        this.dropItemHereText.y = (150 - (this.dropItemHereText.height / 2));
        addChild(this.dropItemHereText);

        this.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);

        graphics.clear();
        graphics.beginFill(0x000000, 1.0);
        graphics.drawRect(0, 0, 300, 300);
        graphics.endFill();
        GraphicHelper.createBorder(this, 2);
    }

    public function dropItem(itemId:int, slotId:int, data:BitmapData):void {
        draw(false);
        dispatchEvent(new ItemSellCandidateEvent(itemId, slotId, data));
    }

    private function detectMouseOver():Boolean {
        var mousePoint:Point = this.localToGlobal(new Point(this.mouseX, this.mouseY));
        return this.hitTestPoint(mousePoint.x, mousePoint.y, true);
    }

    private function onEnterFrame(event:Event):void {
        if(InventorySlot.dragging) {
            draw(detectMouseOver());
        }
    }

    private function draw(mouseOver:Boolean):void {
        if(this.over == mouseOver) {
            return;
        }
        this.over = mouseOver;
        graphics.clear();
        graphics.beginFill(0x000000, 1.0);
        graphics.drawRect(0, 0, 300, 300);
        graphics.endFill();
        GraphicHelper.createBorder(this, 2, mouseOver ? 0x00ff00 : 0xFFD700);

        if(mouseOver) {
            if (this.dragItemHereText.visible || !this.dropItemHereText.visible) {
                this.dragItemHereText.visible = false;
                this.dropItemHereText.visible = true;
            }
        }
        else {
            if (!this.dragItemHereText.visible || this.dropItemHereText.visible) {
                this.dragItemHereText.visible = true;
                this.dropItemHereText.visible = false;
            }
        }
    }
}
}
