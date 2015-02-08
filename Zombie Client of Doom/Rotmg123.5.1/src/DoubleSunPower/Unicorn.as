/**
 * Created by Fabian on 05.02.2015.
 */
package DoubleSunPower {

import flash.display.MovieClip;
import flash.display.Shape;
import flash.display.Sprite;

public class Unicorn extends Sprite {
    [Embed(source="Robot-Unicorn-Attack.swf")]
    private static var power:Class;

    public function Unicorn() {
        var s:Shape = new Shape();
        s.graphics.beginFill(0x000000, 1.0);
        s.graphics.drawRect(0, 0, 800, 600);
        s.graphics.endFill();
        addChild(s);
        var shape:Shape = new Shape();
        var clip:MovieClip = new power();
        clip.mask = shape;
        clip.x = (400 - (clip.width / 2));
        clip.y = (300 - (clip.height / 2));

        shape.graphics.beginFill(0x000000, 0.0);
        shape.graphics.drawRect(clip.x, clip.y, clip.width, clip.height);
        shape.graphics.endFill();
        addChild(shape);

        addChild(clip);
    }
}
}
