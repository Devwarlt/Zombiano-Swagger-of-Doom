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
import _F_1.News;

import com.company.assembleegameclient.appengine.SavedCharsList;

import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;

public class NewsSprite extends Sprite {

    public static const WIDTH:int = 760;
    public static const HEIGHT:int = 430;

    public var news:News;

    public function NewsSprite(charList:SavedCharsList) {
        this.addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        this.news = new News(charList);
        this.news.x = ((WIDTH / 2) - (this.news.width / 2));
        addChild(this.news);
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
            this.news.y = val;
        }
    }

    private function onAddedToStage(event:Event):void {
        this.news.y = 0;
    }
}
}
