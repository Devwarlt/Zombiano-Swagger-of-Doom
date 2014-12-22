/**
 * Created by Fabian on 23.11.2014.
 */
package Panels {
import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.ui.boxButton;
import com.company.ui.SimpleText;

import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
import flash.text.TextFieldAutoSize;

public class DoubleButtonPanel extends Panel {

    private var displayText:SimpleText;
    private var button1:boxButton;
    private var button2:boxButton;

    public function DoubleButtonPanel(_arg1:GameSprite, text:String, button1Text:String, button2Text:String) {
        super(_arg1);
        this.displayText = new SimpleText(18, 0xFFFFFF, false, WIDTH, 0, "Myriad Pro");
        this.displayText.boldText(true);
        this.displayText.htmlText = (('<p align="center">' + text+ "</p>"));
        this.displayText.wordWrap = true;
        this.displayText.multiline = true;
        this.displayText.autoSize = TextFieldAutoSize.CENTER;
        this.displayText.filters = [new DropShadowFilter(0, 0, 0)];
        this.displayText.y = 6;

        this.button1 = new boxButton(16, button1Text);
        this.button1.x = ((WIDTH / 4) - (this.button1.width / 2));
        this.button1.y = ((HEIGHT - this.button1.height) - 4);
        this.button1.addEventListener(MouseEvent.CLICK, this.onButton1Click);

        this.button2 = new boxButton(16, button2Text);
        this.button2.x = (((3 * WIDTH) / 4) - (this.button2.width / 2));
        this.button2.y = ((HEIGHT - this.button2.height) - 4);
        this.button2.addEventListener(MouseEvent.CLICK, this.onButton2Click);

        addChild(this.displayText);
        addChild(this.button1);
        addChild(this.button2);
    }

    protected function onButton1Click(param1:MouseEvent):void{
    }

    protected function onButton2Click(param1:MouseEvent):void{
    }
}
}