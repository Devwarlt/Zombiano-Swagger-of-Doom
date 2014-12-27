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
    public var w_:Number;

    public function FancyTextButton(size:int, text:String, definedWidth:int = 0) {
        this.text = new SimpleText(size, 0xE5C100);
        this.text.boldText(true);
        this.text.text = text;
        this.text.updateMetrics();

        graphics.beginFill(0x000000, 1.0);
        graphics.drawRect(0, 0, this.w_ = (((definedWidth) !=0 ) ? definedWidth : (this.text.width + 40)), this.text.height + 6);
        graphics.endFill();
        GraphicHelper.createBorder(this, 1, 0xE5C100);

        this.text.x = ((this.w_ / 2) - (this.text.width / 2) - 2);
        this.text.y = ((height / 2) - (this.text.height / 2) - 2);
        addChild(this.text);

        this.addEventListener(MouseEvent.ROLL_OVER, this.onRollOver);
        this.addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
    }

    public function enabled(_arg1:Boolean):void {
        if(mouseEnabled == _arg1) {
            return;
        }
        mouseEnabled = _arg1;
        graphics.clear();
        graphics.beginFill(_arg1 ? 0x000000 : 0x787878, 1.0);
        graphics.drawRect(0, 0, this.w_, this.text.height + 6);
        graphics.endFill();
        GraphicHelper.createBorder(this, 1, _arg1 ? 0xE5C100 : 0xffffff);
    }

    private function onRollOver(event:MouseEvent):void {
        graphics.clear();
        var gradientMatrix:Matrix = new Matrix();
        gradientMatrix.createGradientBox(this.w_, this.text.height + 6, (Math.PI / 180) * 90, 0, 0);
        graphics.beginGradientFill(GradientType.LINEAR, [0xffffff, 0x000000], [0.6, 1.0], [0, 200], gradientMatrix);
        graphics.drawRect(0, 0, this.w_, this.text.height + 6);
        graphics.endFill();
        GraphicHelper.createBorder(this, 1, 0xE5C100);
    }

    private function onRollOut(event:MouseEvent):void {
        graphics.clear();
        graphics.beginFill(0x000000, 1.0);
        graphics.drawRect(0, 0, this.w_, this.text.height + 6);
        graphics.endFill();
        GraphicHelper.createBorder(this, 1, 0xE5C100);
    }
}
}
