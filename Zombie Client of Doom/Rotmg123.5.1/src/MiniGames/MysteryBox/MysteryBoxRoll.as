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

    [ArrayElementType(elementType="flash.display.Bitmap")]
    private var bitmaps:Array;
    [ArrayElementType(elementType="int")]
    private var curItems:Array;
    [ArrayElementType(elementType="int")]
    private var items:Array;

    public function MysteryBoxRoll(offer:XML) {
        var req:MysteryBoxRequest = new MysteryBoxRequest();
        req.addEventListener(MysteryBoxResultEvent.MYSTERYBOX_RESULT, this.onResult);
        //req.sendBoxPurchase(0);

        switch (String(offer.Contents).split(";").length - 1) {
            case 0:
                bitmaps = [new Bitmap()];
                bitmaps[0].x = 290;
                bitmaps[0].y = 290;
                addChild(bitmaps[0]);
                curItems = [-1];
                break;
            case 1:
                bitmaps = [new Bitmap(), new Bitmap()];
                bitmaps[0].x = 250;
                bitmaps[0].y = 290;
                addChild(bitmaps[0]);
                bitmaps[1].x = 340;
                bitmaps[1].y = 290;
                addChild(bitmaps[1]);
                curItems = [-1, -1];
                break;
            case 2:
                bitmaps = [new Bitmap(), new Bitmap(), new Bitmap()];
                bitmaps[0].x = 200;
                bitmaps[0].y = 290;
                addChild(bitmaps[0]);
                bitmaps[1].x = 290;
                bitmaps[1].y = 290;
                addChild(bitmaps[1]);
                bitmaps[2].x = 390;
                bitmaps[2].y = 290;
                addChild(bitmaps[2]);
                curItems = [-1, -1, -1];
                break;
        }

        this.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        items = getKeys();
    }

    private function onEnterFrame(event:Event):void {
        if (getTimer() % 5 == 0) {
            reRoll();
        }
    }

    [ArrayElementType(elementType="int")]
    private function getKeys():Array {
        var ret:Array = [];
        for (var key:* in ObjectLibrary.Items) {
            ret.push(key);
        }
        return ret;
    }

    private function reRoll():void {
        for (var i:int = 0; i < bitmaps.length; i++) {
            var item:int = ArrayUtils.randomElement(items);
            while (item == curItems[i]) {
                item = ArrayUtils.randomElement(items);
            }
            bitmaps[i].bitmapData = ObjectLibrary.getRedrawnTextureFromType(item, 100, true, true, ObjectLibrary.Items[item].hasOwnProperty("ScaleValue") ? ObjectLibrary.Items[item].ScaleValue : 5);
            curItems[i] = item;
        }
    }

    private function onResult(event:MysteryBoxResultEvent):void {
        if (event.error) {
            var dialogBox:DialogBox = new DialogBox(event.errorMessage, "Failed to purchase", "Ok", null);
            dialogBox.addEventListener(DialogBox.BUTTON1_EVENT, this.onButton1Click);
            setNewChild(MysteryBox.NAME_SELECT_MYSTERY_BOX);
            addAdditionalChild(dialogBox);
        }
        else {
            //this.currentRoll.onSuccess(event);
        }
    }

    private function onButton1Click(event:Event):void {
        (event.target as DialogBox).parent.removeChild(event.target as DialogBox);
    }
}
}
