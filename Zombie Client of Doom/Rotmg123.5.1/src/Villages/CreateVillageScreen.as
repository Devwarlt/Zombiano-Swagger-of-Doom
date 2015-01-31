/**
 * Created by Fabian on 26.01.2015.
 */
package Villages {
import AccountManagement.ui.FancyTextButton;

import Frames.TextInput;

import _9R_.VillageResultEvent;

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.ui.SimpleText;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;

public class CreateVillageScreen extends Sprite {

    [Embed(source="createVillageBackground.png")]
    private static var background:Class;

    private var villageNameTextBox:TextInput;
    private var createButton:FancyTextButton;
    private var gs:GameSprite;

    public function CreateVillageScreen(gs:GameSprite) {
        this.gs = gs;
        addChild(new background());

        graphics.beginFill(0x000000, 0.8);
        graphics.drawRect(0, 0, 800, 600);
        graphics.endFill();

        var createNewVillageText:SimpleText = new SimpleText(56, 0xffffff);
        createNewVillageText.text = "Create a new Village";
        createNewVillageText.updateMetrics();
        createNewVillageText.x = (400 - (createNewVillageText.width / 2));
        createNewVillageText.y = 130;
        createNewVillageText.filters = [new DropShadowFilter()];
        addChild(createNewVillageText);

        this.villageNameTextBox = new TextInput("Village Name:", false, "");
        this.villageNameTextBox.setWidth(300);
        this.villageNameTextBox.x = (400 - (this.villageNameTextBox.width / 2));
        this.villageNameTextBox.y = createNewVillageText.y + createNewVillageText.height + 20;
        addChild(this.villageNameTextBox);

        var infoText:SimpleText = new SimpleText(18, 0xffffff);
        infoText.text = "Maximum 20 characters";
        infoText.updateMetrics();
        infoText.x = this.villageNameTextBox.x;
        infoText.y = this.villageNameTextBox.y + this.villageNameTextBox.height + 5;
        infoText.filters = [new DropShadowFilter()];
        addChild(infoText);

        infoText = new SimpleText(18, 0xffffff);
        infoText.text = "No numbers or punctuation";
        infoText.updateMetrics();
        infoText.x = this.villageNameTextBox.x;
        infoText.y = this.villageNameTextBox.y + this.villageNameTextBox.height + 25;
        infoText.filters = [new DropShadowFilter()];
        addChild(infoText);

        infoText = new SimpleText(18, 0xffffff);
        infoText.text = "Racism or profanity gets your village banned";
        infoText.updateMetrics();
        infoText.x = this.villageNameTextBox.x;
        infoText.y = this.villageNameTextBox.y + this.villageNameTextBox.height + 45;
        infoText.filters = [new DropShadowFilter()];
        addChild(infoText);

        this.createButton = new FancyTextButton(30, "Create", 200);
        this.createButton.x = 150;
        this.createButton.y = (this.villageNameTextBox.y + (this.villageNameTextBox.height + 100));
        this.createButton.addEventListener(MouseEvent.CLICK, this.onCreate);
        addChild(this.createButton);

        var closeBtn:FancyTextButton = new FancyTextButton(30, "Cancel", 200);
        closeBtn.x = 450;
        closeBtn.y = (this.villageNameTextBox.y + (this.villageNameTextBox.height + 100));
        closeBtn.addEventListener(MouseEvent.CLICK, this.onRemove);
        addChild(closeBtn);

        this.gs.stage.addEventListener(KeyboardEvent.KEY_DOWN, this.onCreate, false, 1);
        this.addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }

    private function onCreate(event:Event):void {
        if(event is KeyboardEvent) {
            event.stopImmediatePropagation();
            if((event as KeyboardEvent).keyCode != Parameters.data_.interact) return;
        }
        this.createButton.enabled(false);
        this.gs.addEventListener(VillageResultEvent.VILLAGE_RESULT, this.onVillageResult);
        this.gs.packetManager.createVillage(this.villageNameTextBox.text());
    }

    private function onVillageResult(event:VillageResultEvent):void {
        this.gs.removeEventListener(VillageResultEvent.VILLAGE_RESULT, this.onVillageResult);
        if(event.success_) {
            parent.removeChild(this);
            return;
        }
        this.createButton.enabled(true);
        this.villageNameTextBox.setErrorText(event.errorText_);
    }

    private function onRemove(event:MouseEvent):void {
        parent.removeChild(this);
    }

    private function onRemovedFromStage(event:Event):void {
        this.gs.stage.removeEventListener(KeyboardEvent.KEY_DOWN, this.onCreate);
    }
}
}
