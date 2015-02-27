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
 * Created by Fabian on 25.02.2015.
 */
package _F_1.selectChars {
import _F_1._05p;

import com.company.assembleegameclient.appengine.SavedCharsList;
import com.company.assembleegameclient.screens.charrects.CharacterRectList;

import flash.display.Shape;

import flash.display.Sprite;
import flash.events.Event;

public class CharsSprite extends Sprite {

    public static const WIDTH:int = 760;
    public static const HEIGHT:int = 430;

    private var charRectList:CharacterRectList;

    public function CharsSprite(charList:SavedCharsList, screenBase:_05p) {
        this.addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        this.charRectList = new CharacterRectList(charList, screenBase);
        this.charRectList.x = ((WIDTH / 2) - (this.charRectList.width / 2));
        addChild(this.charRectList);

        if (height > 400) {
            var mask:Shape = new Shape();
            mask.graphics.beginFill(0);
            mask.graphics.drawRect(0, 0, WIDTH, HEIGHT);
            mask.graphics.endFill();
            addChild(mask);
            super.mask = mask;
        }
    }

    public function scrollBarScroll(val:Number):void {
        if (stage) {
            this.charRectList.y = val;
        }
    }

    private function onAddedToStage(event:Event):void {
        this.charRectList.y = 0;
    }
}
}
