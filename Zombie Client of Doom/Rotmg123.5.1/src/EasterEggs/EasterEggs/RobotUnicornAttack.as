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
 * Created by Fabian on 12.02.2015.
 */
package EasterEggs.EasterEggs {

import flash.display.DisplayObject;
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.EventDispatcher;

public class RobotUnicornAttack extends EasterEgg {

    [Embed(source="eggs/Robot-Unicorn-Attack.swf", mimeType="application/octet-stream")]
    private static var unicorn:Class;

    public function RobotUnicornAttack(dispatcher:EventDispatcher) {
        super(new unicorn(), dispatcher, "hi");
    }

    override protected function getMovie():DisplayObject {
        var movie:Sprite = new Sprite();
        var ret:Sprite = new Sprite();
        var background:Shape = new Shape();
        var mask:Shape = new Shape();

        background.graphics.beginFill(0x000000, 1.0);
        background.graphics.drawRect(0, 0, 800, 600);
        background.graphics.endFill();

        movie.addChild(super.getMovie());
        movie.mask = mask;
        movie.x = (400 - (640 / 2));
        movie.y = (300 - (480 / 2));

        mask.graphics.beginFill(0x000000, 0.0);
        mask.graphics.drawRect(movie.x, movie.y, 640, 480);
        mask.graphics.endFill();

        ret.addChild(background);
        ret.addChild(movie);

        return ret;
    }
}
}
