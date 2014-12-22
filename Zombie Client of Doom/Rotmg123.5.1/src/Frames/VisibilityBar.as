/**
 * Created by Fabian on 14.11.2014.
 */
package Frames {
import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.Player;
import com.company.assembleegameclient.ui._0M_Y_;

import flash.display.Sprite;

public class VisibilityBar extends Sprite {
    public function VisibilityBar(player:Player, gamesprite:GameSprite) {
        this.player = player;
        this.gs_ = gamesprite;
        bar = new _0M_Y_(450, 16, 0xE25F00, 0x473224, "Visibility");
        bar.x = -590;
        bar.y = 10;
        //bar.width = 400;
        addChild(bar);
    }
    private var bar:_0M_Y_;
    private var player:Player;

    //private var color:uint;
    private var gs_:GameSprite;

    public function draw():void {
        if (!player.map_.showDisplays_ && this.player.visibilityRange != -1)
            bar.visible = true;
        else
            bar.visible = false;

        //var other = this.player.visibilityRange % 255;
        //color = MoreColorUtil._nL_(112, other, other);
        //bar.color_ = color;

        bar.draw(this.player.visibilityRange, Player.MAX_VISIBILITY, 0, 0);
    }
}
}
