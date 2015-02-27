// Copyright (c) 2015, FireBite/Aceticsoft Studios Inc.
// All rights reserved.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
// ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

/**
 * Created by Fabian on 14.11.2014.
 */
package Frames {
import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.Player;
import com.company.assembleegameclient.ui._0M_Y_;

import flash.display.Sprite;

public class VisibilityBar extends Sprite {
    private var bar:_0M_Y_;
    private var player:Player;
    private var gs_:GameSprite;

    //private var color:uint;

    public function VisibilityBar(player:Player, gamesprite:GameSprite) {
        this.player = player;
        this.gs_ = gamesprite;
        bar = new _0M_Y_(450, 16, 0xE25F00, 0x473224, "Visibility");
        bar.x = -590;
        bar.y = 10;
        //bar.width = 400;
        addChild(bar);
    }

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
