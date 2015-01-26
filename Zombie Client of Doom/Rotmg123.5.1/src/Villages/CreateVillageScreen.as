/**
 * Created by Fabian on 26.01.2015.
 */
package Villages {
import Frames.TextInput;

import flash.display.Sprite;

public class CreateVillageScreen extends Sprite {

    [Embed(source="pergament-gross.png")]
    private static var background:Class;

    private var villageNameTextBox:TextInput;

    public function CreateVillageScreen() {
        addChild(new background());
        this.villageNameTextBox = new TextInput("Village Name", false, "Village already exists!");
    }
}
}
