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
 * Created by Fabian on 28.01.2015.
 */
package Villages {

import com.company.ui.SimpleText;

import flash.display.DisplayObject;
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

    public override function contains(child:DisplayObject):Boolean {
        return child && super.contains(child);
    }
}
}
