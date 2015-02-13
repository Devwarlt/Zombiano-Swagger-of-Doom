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
 * Created by Fabian on 05.02.2015.
 */
package DoubleSunPower {

import flash.display.MovieClip;
import flash.display.Shape;
import flash.display.Sprite;

public class Other extends Sprite {
    [Embed(source="../EasterEggs/EasterEggs/eggs/Robot-Unicorn-Attack.swf")]
    private static var power:Class;

    public function Other() {
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
