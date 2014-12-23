/**
 * Created by Fabian on 23.12.2014.
 */
package AccountManagement.ui {
import com.company.ui.SimpleText;
import com.company.util.GraphicHelper;

import flash.display.GradientType;

import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.geom.Matrix;

public class FancyTextButton extends Sprite {

    private var text:SimpleText;

    public function FancyTextButton(size:int, text:String) {
        this.text = new SimpleText(size, 0xE5C100);
        this.text.boldText(true);
        this.text.text = text;
        this.text.updateMetrics();

        graphics.beginFill(0x000000, 0.6);
        graphics.drawRect(0, 0, this.text.width + 40, this.text.height + 6);
        graphics.endFill();
        GraphicHelper.createBorder(this, 1, 0xE5C100);

        this.text.x = ((width / 2) - (this.text.width / 2) - 2);
        this.text.y = ((height / 2) - (this.text.height / 2) - 2);
        addChild(this.text);

        this.addEventListener(MouseEvent.ROLL_OVER, this.onRollOver);
        this.addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
    }

    private function onRollOver(event:MouseEvent):void {
        graphics.clear();
        var gradientMatrix:Matrix = new Matrix();
        gradientMatrix.createGradientBox(this.text.width + 40, this.text.height + 6, (Math.PI / 180) * 90, 0, 0);
        graphics.beginGradientFill(GradientType.LINEAR, [0xffffff, 0x000000], [0.6, 0.6], [0, 200], gradientMatrix);
        graphics.drawRect(0, 0, this.text.width + 40, this.text.height + 6);
        graphics.endFill();
        GraphicHelper.createBorder(this, 1, 0xE5C100);
    }

    private function onRollOut(event:MouseEvent):void {
        graphics.clear();
        graphics.beginFill(0x000000, 0.6);
        graphics.drawRect(0, 0, this.text.width + 40, this.text.height + 6);
        graphics.endFill();
        GraphicHelper.createBorder(this, 1, 0xE5C100);
    }
}
}
