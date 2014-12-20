/**
 * Created by Fabian on 20.12.2014.
 */
package AccountManagement.tabHolders {
import AccountManagement.AccountManagementBody;
import AccountManagement.ui.TabButton;

public class FpcPacksHolder extends TabHolder {

    public function FpcPacksHolder(parent:AccountManagementBody) {
        super(parent);
    }

    public override function initialize(tab:TabButton):void {
        super.tab = tab;
    }
}
}

import AccountManagement.images.AccountManagementImages;

import flash.display.Bitmap;
import flash.display.Sprite;

class fpcPackHolder extends Sprite {
    public static const WIDTH:int = 180;
    public static const HEIGHT:int = 180;

    public function fpcPackHolder(image:Bitmap) {
        image.x = ((WIDTH / 2) - (image.width / 2));
        image.y = ((HEIGHT / 2) - (image.height / 2));
        addChild(image);
    }

    public function getInfo():Sprite {
        return new Sprite();
    }
}

class nextArrow extends Sprite {
    public static const WIDTH:int = 40;
    public static const HEIGHT:int = 450;

    public function nextArrow() {
        graphics.beginFill(0x000000, 0.4);
        graphics.drawRect(0, 0, WIDTH, HEIGHT);
        graphics.endFill();

        var arrow:Bitmap = AccountManagementImages.nextArrow(1.0);
        arrow.x = ((WIDTH / 2) - (arrow.width / 2));
        arrow.y = ((HEIGHT / 2) - (arrow.height / 2));
        addChild(arrow);
    }
}

class prevArrow extends Sprite {
    public static const WIDTH:int = 40;
    public static const HEIGHT:int = 450;

    public function prevArrow() {
        graphics.beginFill(0x000000, 0.4);
        graphics.drawRect(0, 0, WIDTH, HEIGHT);
        graphics.endFill();

        var arrow:Bitmap = AccountManagementImages.prevArrow(1.0);
        arrow.x = (((WIDTH / 2) - (arrow.width / 2)) + arrow.width);
        arrow.y = ((HEIGHT / 2) - (arrow.height / 2));
        addChild(arrow);
    }
}