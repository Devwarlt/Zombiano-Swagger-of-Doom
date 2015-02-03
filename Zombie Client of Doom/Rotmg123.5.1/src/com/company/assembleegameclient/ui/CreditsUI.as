// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.ui._0B_v

package com.company.assembleegameclient.ui {
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

        this.copperIcon.x = -(this.copperIcon.width);
        this.copperText.text = int((this.credits_ - (int((this.credits_ / 10000)) * 10000) - (int(((this.credits_ - (int((this.credits_ / 10000)) * 10000)) / 100)) * 100))).toString();
        this.copperText.updateMetrics();
        this.copperText.x = ((this.copperIcon.x - this.copperText.width) + 8);
        this.copperText.y = ((this.copperIcon.height / 2) - (this.copperText.height / 2));

        this.silverIcon.x = (this.copperText.x - this.silverIcon.width);
        this.silverText.text = int(((this.credits_ - (int((this.credits_ / 10000)) * 10000)) / 100)).toString();
        this.silverText.updateMetrics();
        this.silverText.x = ((this.silverIcon.x - this.silverText.width) + 8);
        this.silverText.y = ((this.silverIcon.height / 2) - (this.silverText.height / 2));

        this.goldIcon.x = (this.silverText.x - this.goldIcon.width);
        this.goldText.text = int((this.credits_ / 10000)).toString();
        this.goldText.updateMetrics();
        this.goldText.x = ((this.goldIcon.x - this.goldText.width) + 8);
        this.goldText.y = ((this.goldIcon.height / 2) - (this.goldText.height / 2));
    }
}
}//package com.company.assembleegameclient.ui

