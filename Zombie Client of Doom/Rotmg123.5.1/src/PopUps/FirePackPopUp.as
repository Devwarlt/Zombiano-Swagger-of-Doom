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

/**
 * Created by Fabian on 26.12.2014.
 */
package PopUps {
import AccountManagement.images.AccountManagementImages;

import Sounds.LocalSound;
import Sounds.LocalSoundEffects;

import _05R_.GTween;

import com.company.assembleegameclient.game.GameSprite;
import com.company.ui.SimpleText;

import flash.display.Bitmap;
import flash.filters.DropShadowFilter;

public class FirePackPopUp extends PopUpScreen {

    private var packName:SimpleText;
    private var packIcon:Bitmap;
    private var packType:int;
    private var sound:LocalSound;

    public function FirePackPopUp(gameSprite:GameSprite, packType:int, sound:LocalSound) {
        this.packType = packType;
        this.sound = sound;

        this.packIcon = new Bitmap();
        this.packIcon.y = 20;
        this.packIcon.scaleX = 0;
        this.packIcon.scaleY = 0;
        this.packIcon.filters = [new DropShadowFilter(0, 0, 0, 1, 10, 10, 2.0)];

        this.packName = new SimpleText(32, 0xFFFFFF, false, 0, 600);
        this.packName.filters = [new DropShadowFilter(0, 0, 0, 1, 10, 10, 2.0)];
        this.packName.x = 0;
        this.packName.y = 100;
        this.packName.size = 0;

        switch (packType) {
            case 0:
                this.packIcon.bitmapData = new AccountManagementImages.bronzeFirePack().bitmapData;
                this.packName.text = "Bronze Fire Pack";
                break;
            case 1:
                this.packIcon.bitmapData = new AccountManagementImages.silverFirePack().bitmapData;
                this.packName.text = "Silver Fire Pack";
                break;
            case 2:
                this.packIcon.bitmapData = new AccountManagementImages.goldFirePack().bitmapData;
                this.packName.text = "Gold Fire Pack";
                break;
            case 3:
            default:
                this.packIcon.bitmapData = new AccountManagementImages.premiumFirePack().bitmapData;
                this.packName.text = "Premium Fire Pack";
                break;
        }

        super(gameSprite);
    }

    protected override function init():void {
        stage.addChild(packName);
        var tween:GTween = new GTween(this.packName, 0.5, { "size": 32 });
        tween._bR_ = updateMetrics;
        tween.onComplete = packIconFadeIn;
        if(this.sound != null) {
            LocalSoundEffects.play(this.sound);
        }
    }

    private function updateMetrics(tween:GTween):void {
        this.packIcon.x = 300 - (this.packIcon.width / 2);
        this.packName.y = this.packIcon.y + this.packIcon.height + 20;
        this.packName.x = 300 - (this.packName.textWidth / 2);
    }

    private function packIconFadeIn(tween:GTween):void {
        stage.addChild(packIcon);
        tween = new GTween(this.packIcon, 0.3, { "scaleX": 1.0, "scaleY": 1.0 });
        tween._bR_ = updateMetrics;
        tween.onComplete = waitForFadeOut;
    }

    private function waitForFadeOut(tween:GTween):void {
        tween = new GTween(null, 4);
        tween.onComplete = fadeOut;
    }

    private function fadeOut(tween:GTween):void {
        new GTween(this.packName, 0.3, { "size": 0 });
        var iconTween = new GTween(this.packIcon, 0.3, { "scaleX": 0, "scaleY": 0 });
        iconTween._bR_ = updateMetrics;
        iconTween.onComplete = remove;
    }

    private function remove(tween:GTween):void {
        stage.removeChild(this.packName);
        stage.removeChild(this.packIcon);
        parent.removeChild(this);
    }
}
}

