// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//Panels.SimpleButtonPanel

package Panels {
import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.ui.boxButton;
import com.company.ui.SimpleText;

import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
import flash.text.TextFieldAutoSize;

public class SimpleButtonPanel extends Panel {

    public function SimpleButtonPanel(_arg1:GameSprite, _arg2:String, _arg3:String) {
        super(_arg1);
        this.text = new SimpleText(18, 0xFFFFFF, false, WIDTH, 0, "Myriad Pro");
        this.text.boldText(true);
        this.text.htmlText = (('<p align="center">' + _arg2) + "</p>");
        this.text.wordWrap = true;
        this.text.multiline = true;
        this.text.autoSize = TextFieldAutoSize.CENTER;
        this.text.filters = [new DropShadowFilter(0, 0, 0)];
        this.text.y = 6;
        addChild(this.text);
        this.button = new boxButton(16, _arg3);
        this.button.addEventListener(MouseEvent.CLICK, this.onButtonClick);
        this.button.x = ((WIDTH / 2) - (this.button.width / 2));
        this.button.y = ((HEIGHT - this.button.height) - 4);
        addChild(this.button);
    }
    protected var text:SimpleText;
    protected var button:boxButton;

    protected function onButtonClick(_arg1:MouseEvent):void {
    }

}
}//package Panels

