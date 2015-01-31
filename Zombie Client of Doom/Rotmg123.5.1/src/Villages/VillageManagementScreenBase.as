/**
 * Created by Fabian on 28.01.2015.
 */
package Villages {

import com.company.ui.SimpleText;
import flash.display.Sprite;

public class VillageManagementScreenBase extends Sprite {
    public static const WIDTH:int = 600;
    public static const HEIGHT:int = 500;

    public function VillageManagementScreenBase() {
    }

    public function initialize():void {
        var text:SimpleText = new SimpleText(46, 0xffffff);
        text.text = "Nothing to see here.";
        text.updateMetrics();
        text.x = ((WIDTH / 2) - (text.textWidth / 2));
        text.y = ((HEIGHT / 2) - (text.textHeight / 2));
        addChild(text);
    }
}
}
