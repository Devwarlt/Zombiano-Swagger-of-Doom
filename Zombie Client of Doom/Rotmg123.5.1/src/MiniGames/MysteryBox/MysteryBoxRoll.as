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
 * Created by Fabian on 21.02.2015.
 */
package MiniGames.MysteryBox {

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.util.Random;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.Event;
import flash.utils.getTimer;

public class MysteryBoxRoll extends Sprite {

    var bmp:Bitmap;

    private var rand:Random = new Random();
    private var items:Array;

    public function MysteryBoxRoll(gs:GameSprite, offer:XML) {
        graphics.beginFill(0x000000, 1.0);
        graphics.drawRect(0, 0, MysteryBox.WIDTH, gs.stage.getChildByName("MysteryBox").height - 1);
        graphics.endFill();
        bmp = new Bitmap();
        bmp.x = 200;
        bmp.y = 200;
        addChild(bmp);
        this.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        items = getKeys();
    }

    private var curItem:int = -1;

    private function onEnterFrame(event:Event):void {
        if (getTimer() % 5 == 0) {
            var item:int = items[rand.next(0, items.length - 1)];
            while (item == curItem) {
                item = items[rand.next(0, items.length - 1)];
            }
            bmp.bitmapData = ObjectLibrary.getRedrawnTextureFromType(item, 100, true, true, 5);
            curItem = item;
        }
    }

    private function getKeys():Array {
        var ret:Array = [];
        for (var key:* in ObjectLibrary.Items) {
            ret.push(key);
        }
        return ret;
    }
}
}
