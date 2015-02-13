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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// either expressed or implied, of the FreeBSD Project.// either expressed or implied, of the FreeBSD Project.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.ui._0B_v

package com.company.assembleegameclient.ui {
import com.company.assembleegameclient.util.Currency;

import flash.display.Sprite;
import com.company.ui.SimpleText;
import flash.display.Bitmap;
import com.company.assembleegameclient.game.GameSprite;
import flash.filters.DropShadowFilter;
import com.company.util.AssetLibrary;
import com.company.assembleegameclient.util.TextureRedrawer;
import flash.events.MouseEvent;
import com.company.assembleegameclient.parameters.Parameters;
import _qN_.Account;

public class CreditsUI extends Sprite {

    private static const FONT_SIZE:int = 18;

    private var goldText:SimpleText;
    private var silverText:SimpleText;
    private var copperText:SimpleText;
    private var goldIcon:Bitmap;
    private var silverIcon:Bitmap;
    private var copperIcon:Bitmap;
    private var credits_:int = -1;
    private var gs:GameSprite;

    public function CreditsUI(gs:GameSprite = null) {
        this.gs = gs;
        this.goldText = new SimpleText(FONT_SIZE, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this.goldText.filters = [new DropShadowFilter(0, 0, 0, 1, 4, 4, 2)];
        addChild(this.goldText);

        this.silverText = new SimpleText(FONT_SIZE, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this.silverText.filters = [new DropShadowFilter(0, 0, 0, 1, 4, 4, 2)];
        addChild(this.silverText);

        this.copperText = new SimpleText(FONT_SIZE, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this.copperText.filters = [new DropShadowFilter(0, 0, 0, 1, 4, 4, 2)];
        addChild(this.copperText);

        this.goldIcon = new Bitmap(TextureRedrawer.redraw(AssetLibrary._xK_("coins", 0), 40, true, 0, 0));
        addChild(this.goldIcon);

        this.silverIcon = new Bitmap(TextureRedrawer.redraw(AssetLibrary._xK_("coins", 1), 40, true, 0, 0));
        addChild(this.silverIcon);

        this.copperIcon = new Bitmap(TextureRedrawer.redraw(AssetLibrary._xK_("coins", 2), 40, true, 0, 0));
        addChild(this.copperIcon);

        this.draw(0);
        mouseEnabled = true;
        doubleClickEnabled = true;
        addEventListener(MouseEvent.DOUBLE_CLICK, this.onCreditsDoubleClick, false, 0, true);
    }

    private function onCreditsDoubleClick(_arg1:MouseEvent):void {
        if (!this.gs || this.gs.isInSafePlace() || Parameters.data_.clickForGold == true) {
            Account._get().showMoneyManagement(stage);
        }
    }

    public function draw(value:int):void {
        if (value == this.credits_) {
            return;
        }
        this.credits_ = value;

        var credits:Object = Currency.parseCredits(this.credits_);

        this.copperIcon.x = -(this.copperIcon.width);
        this.copperText.text = credits.copper;
        this.copperText.updateMetrics();
        this.copperText.x = ((this.copperIcon.x - this.copperText.width) + 8);
        this.copperText.y = ((this.copperIcon.height / 2) - (this.copperText.height / 2));

        this.silverIcon.x = (this.copperText.x - this.silverIcon.width);
        this.silverText.text = credits.silver;
        this.silverText.updateMetrics();
        this.silverText.x = ((this.silverIcon.x - this.silverText.width) + 8);
        this.silverText.y = ((this.silverIcon.height / 2) - (this.silverText.height / 2));

        this.goldIcon.x = (this.silverText.x - this.goldIcon.width);
        this.goldText.text = credits.gold;
        this.goldText.updateMetrics();
        this.goldText.x = ((this.goldIcon.x - this.goldText.width) + 8);
        this.goldText.y = ((this.goldIcon.height / 2) - (this.goldText.height / 2));
    }
}
}//package com.company.assembleegameclient.ui

