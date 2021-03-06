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
 * Created by Fabian on 06.12.2014.
 */
package PopUps {
import Sounds.LocalSound;
import Sounds.LocalSoundEffects;

import _05R_.GTween;

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.assembleegameclient.util.TextureRedrawer;
import com.company.ui.SimpleText;

import flash.display.Bitmap;
import flash.filters.DropShadowFilter;

public class NewItemUnlockedScreen extends PopUpScreen {

    private var unlockText:SimpleText;
    private var itemDescText:SimpleText;
    private var itemIcon:Bitmap;
    private var itemId:int;
    private var sound:LocalSound;

    public function NewItemUnlockedScreen(gameSprite:GameSprite, itemId:int, sound:LocalSound) {
        this.itemId = itemId;
        this.sound = sound;

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
        if (this.sound != null) {
            LocalSoundEffects.play(this.sound);
        }
        var tween:GTween = new GTween(this.unlockText, 0.5, {"size": 46});
        tween.onChange = updateMetrics;
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
        tween = new GTween(this.itemIcon, 0.5, {"scaleX": 0.5, "scaleY": 0.5});
        tween.onChange = updateMetrics;
        tween.onComplete = itemDescTextFadeIn;
    }

    private function itemDescTextFadeIn(tween:GTween):void {
        stage.addChild(itemDescText);
        tween = new GTween(this.itemDescText, 0.3, {"size": 32});
        tween.onChange = updateMetrics;
        tween.onComplete = waitForFadeOut;
    }

    private function waitForFadeOut(tween:GTween):void {
        tween = new GTween(null, 3);
        tween.onComplete = fadeOut;
    }

    private function fadeOut(tween:GTween):void {
        new GTween(this.itemDescText, 0.3, {"size": 0});
        new GTween(this.itemIcon, 0.3, {"scaleX": 0, "scaleY": 0});
        var textTween = new GTween(this.unlockText, 0.3, {"size": 0});
        textTween.onChange = updateMetrics;
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
