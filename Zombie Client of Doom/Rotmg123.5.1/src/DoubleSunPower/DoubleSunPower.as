/**
 * Created by Fabian on 05.02.2015.
 */
package DoubleSunPower {
import flash.display.MovieClip;
import flash.display.Sprite;

public class DoubleSunPower extends Sprite {

    [Embed(source="Doublesunpower.swf")]
    private static var power:Class;

    public function DoubleSunPower() {
        var doubleSunPowerClip:MovieClip = new power();
        doubleSunPowerClip.width = 800;
        doubleSunPowerClip.height = 600;
        addChild(doubleSunPowerClip);

        doubleSunPowerClip.addFrameScript(doubleSunPowerClip.totalFrames - 1, function onLastFrame():void
        {
            doubleSunPowerClip.stop();
            parent.removeChild(this);
        });
    }
}
}
