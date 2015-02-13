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
 * Created by Fabian on 07.12.2014.
 */
package PopUps {
import com.company.assembleegameclient.game.GameSprite;

import flash.display.Sprite;
import flash.events.Event;

public class PopUpScreen extends Sprite {

    public static var CurrentPopUps:Vector.<PopUpScreen> = new Vector.<PopUpScreen>();
    public static var currentPopUp:PopUpScreen;
    protected var gs_:GameSprite;

    public function PopUpScreen(gameSprite:GameSprite) {
        this.gs_ = gameSprite;
        this.addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);

        if(this.gs_.map_.stage != null) {
            if (currentPopUp == null) {
                currentPopUp = this;
                this.gs_.map_.stage.addChild(this);
                init();
            }
            else {
                CurrentPopUps.push(this);
            }
        }
        else {
            CurrentPopUps = new Vector.<PopUpScreen>();
            currentPopUp = null;
        }
    }

    protected function init():void {

    }

    protected function onAddedToStage(event:Event):void {
        this.addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }

    protected function onRemovedFromStage(event:Event):void {
        if(this.gs_.map_.stage != null) {
            var nextPopUp:PopUpScreen;
            if ((nextPopUp = CurrentPopUps.shift()) != null) {
                currentPopUp = nextPopUp;
                this.gs_.map_.stage.addChild(nextPopUp);
                nextPopUp.init();
            }
            else {
                currentPopUp = null;
            }
        }
        else {
            CurrentPopUps = new Vector.<PopUpScreen>();
            currentPopUp = null;
        }
    }
}
}
