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

import _0L_C_.DialogBox;

import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.assembleegameclient.util.ArrayUtils;
import com.company.util.Random;

import flash.display.Bitmap;
import flash.events.Event;
import flash.utils.getTimer;

public class MysteryBoxRoll extends MysteryBoxChild {

    private var bmp:Bitmap;

    private var rand:Random = new Random();
    private var items:Vector.<int>;

    public function MysteryBoxRoll(offer:XML) {
        var req:MysteryBoxRequest = new MysteryBoxRequest();
        req.addEventListener(MysteryBoxResultEvent.MYSTERYBOX_RESULT, this.onResult);
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
            roll();
        }
    }

    private function getKeys():Vector.<int> {
        var ret:Vector.<int> = new Vector.<int>();
        for (var key:* in ObjectLibrary.Items) {
            ret.push(key);
        }
        return ret;
    }

    private function roll():void {
        var item:int = ArrayUtils.randomElement(items);
        while (item == curItem) {
            item = ArrayUtils.randomElement(items);
        }
        bmp.bitmapData = ObjectLibrary.getRedrawnTextureFromType(item, 100, true, true, 5);
        curItem = item;
    }

    private function onResult(event:MysteryBoxResultEvent):void {
        if (event.error) {
            addAdditionalChild(new DialogBox(event.errorMessage, "Failed to purchase", "Ok", null));
        }
        else {
            //this.currentRoll.onSuccess(event);
        }
    }
}
}
