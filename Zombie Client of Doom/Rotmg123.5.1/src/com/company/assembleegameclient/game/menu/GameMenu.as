/**
 * Created by Fabian on 01.01.2015.
 */
package com.company.assembleegameclient.game.menu {
import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.ui.FancyInventory;
import com.company.util.GraphicHelper;

import flash.display.Sprite;

public class GameMenu extends Sprite {
    private var inventory:FancyInventory;
    private var gs:GameSprite;

    public function GameMenu(gs:GameSprite) {
        this.gs = gs;

        graphics.beginFill(0x000000, 1.0);
        graphics.drawRect(0, 0, 100, 100);
        graphics.endFill();

        GraphicHelper.createBorder(this, 1, 0xffffff);
    }
}
}
