/**
 * Created by Fabian on 06.12.2014.
 */
package PopUps {
import _05R_.GTween;

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.assembleegameclient.objects._Z_H_;
import com.company.assembleegameclient.util.TextureRedrawer;
import com.company.ui.SimpleText;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.filters.DropShadowFilter;

public class NewItemUnlockedScreen extends PopUpScreen {

    private var unlockText:SimpleText;
    private var itemDescText:SimpleText;
    private var itemIcon:Bitmap;
    private var itemId:int;

    public function NewItemUnlockedScreen(gameSprite:GameSprite, itemId:int) {
        this.itemId = itemId;

        super(gameSprite);
    }

    protected override function init():void {
        this.unlockText = new SimpleText(46, 0xFFFFFF, false, 0, 600);
        this.unlockText.text = "You've unlocked a new item.";
        this.unlockText.filters = [new DropShadowFilter(0, 0, 0, 1, 10, 10, 2.0)];
        this.unlockText.x = 0;
        this.unlockText.y = 50;
        this.unlockText.size = 0;

        var itemXml:XML = ObjectLibrary.Items[itemId];

        this.itemIcon = new Bitmap();
        this.itemIcon.bitmapData = TextureRedrawer.resize(ObjectLibrary._V_a[itemId].getTexture(), null, 300, false, 0, 0, itemXml.hasOwnProperty("ScaleValue") ? itemXml.ScaleValue : 5);
        this.itemIcon.y = 110;
        this.itemIcon.scaleX = 0;
        this.itemIcon.scaleY = 0;
        this.itemIcon.filters = [new DropShadowFilter(0, 0, 0, 1, 10, 10, 2.0)];

        this.itemDescText = new SimpleText(32, 0xFFFFFF, false, 0, 600);
        this.itemDescText.text = itemXml.hasOwnProperty("DisplayId") ? itemXml.DisplayId : itemXml.@id;
        this.itemDescText.filters = [new DropShadowFilter(0, 0, 0, 1, 10, 10, 2.0)];
        this.itemDescText.x = 0;
        this.itemDescText.y = 200;
        this.itemDescText.size = 0;

        stage.addChild(unlockText);
        var tween:GTween = new GTween(this.unlockText, 0.5, { "size": 46 });
        tween._bR_ = updateMetrics;
        tween.onComplete = iconFadeIn;
    }

    private function updateMetrics(tween:GTween):void {
        this.unlockText.x = 300 - (this.unlockText.textWidth / 2);
        this.itemIcon.x = 300 - (this.itemIcon.width / 2);
        this.itemDescText.y = this.itemIcon.y + this.itemIcon.height + 20;
        this.itemDescText.x = 300 - (this.itemDescText.textWidth / 2);
    }

    private function iconFadeIn(tween:GTween):void {
        stage.addChild(itemIcon);
        tween = new GTween(this.itemIcon, 0.5, { "scaleX": 0.5, "scaleY": 0.5 });
        tween._bR_ = updateMetrics;
        tween.onComplete = itemDescTextFadeIn;
    }

    private function itemDescTextFadeIn(tween:GTween):void {
        stage.addChild(itemDescText);
        tween = new GTween(this.itemDescText, 0.3, { "size": 32 });
        tween._bR_ = updateMetrics;
        tween.onComplete = waitForFadeOut;
    }

    private function waitForFadeOut(tween:GTween):void {
        tween = new GTween(null, 10);
        tween.onComplete = fadeOut;
    }

    private function fadeOut(tween:GTween):void {
        var descTween = new GTween(this.itemDescText, 0.3, { "size": 0 });
        var iconTween = new GTween(this.itemIcon, 0.3, { "scaleX": 0, "scaleY": 0 });
        var textTween = new GTween(this.unlockText, 0.3, { "size": 0 });
        textTween._bR_ = updateMetrics;
        textTween.onComplete = remove;
    }

    private function remove(tween:GTween):void {
        stage.removeChild(this.itemDescText);
        stage.removeChild(this.itemIcon);
        stage.removeChild(this.unlockText);
        parent.removeChild(this);
    }
}
}
