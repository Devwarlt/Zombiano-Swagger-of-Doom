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

import com.company.ui.SimpleText;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.EventDispatcher;

public class I_Kissed_A_Girl_EasterEgg extends EasterEgg {

    [Embed(source="eggs/I_Kissed_A_Girl.swf", mimeType="application/octet-stream")]
    private static var I_Kissed_A_Girl:Class;

    public function I_Kissed_A_Girl_EasterEgg(dispatcher:EventDispatcher) {
        super(new I_Kissed_A_Girl(), dispatcher, "I kissed a girl and I liked it the taste of her cherry chapstick");
    }

    override protected function getMovie():DisplayObject {
        var text:SimpleText = new SimpleText(46, 0xffffff);
        var ret:Sprite = new Sprite();
        var movie:DisplayObject = super.getMovie();

        movie.scaleX = movie.scaleY = 1.6;

        text.boldText(true);
        text.text = "Hey, you found it, good job m8";
        text.updateMetrics();
        text.x = (400 - (text.width / 2));
        text.y = 450 + (75 - (text.height / 2));

        ret.addChild(movie);
        ret.graphics.beginFill(0, 1.0);
        ret.graphics.drawRect(0, 0, 800, 600);
        ret.graphics.endFill();
        ret.addChild(text);

        return ret;
    }
}
}
