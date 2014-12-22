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

    public function PopUpScreen(gameSprite:GameSprite) {
        this.gs_ = gameSprite;
        this.addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);

        if (this.gs_.map_.stage != null) {
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
    protected var gs_:GameSprite;

    protected function init():void {

    }

    protected function onAddedToStage(event:Event):void {
        this.addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }

    protected function onRemovedFromStage(event:Event):void {
        if (this.gs_.map_.stage != null) {
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
