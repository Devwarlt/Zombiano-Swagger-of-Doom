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
 * Created by Fabian on 23.12.2014.
 */
package AccountManagement.ui {
import com.company.ui.SimpleText;
import com.company.util.GraphicHelper;

import flash.display.GradientType;

import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.geom.Matrix;

public class FancyTextButton extends Sprite {

    private var text:SimpleText;
    public var w_:Number;

    public function FancyTextButton(size:int, text:String, definedWidth:int = 0) {
        this.text = new SimpleText(size, 0xE5C100);
        this.text.boldText(true);
        this.text.text = text;
        this.text.updateMetrics();

        graphics.beginFill(0x000000, 1.0);
        graphics.drawRect(0, 0, this.w_ = (((definedWidth) !=0 ) ? definedWidth : (this.text.width + 40)), this.text.height + 6);
        graphics.endFill();
        GraphicHelper.createBorder(this, 1, 0xE5C100);

        this.text.x = ((this.w_ / 2) - (this.text.width / 2) - 2);
        this.text.y = ((height / 2) - (this.text.height / 2) - 2);
        addChild(this.text);

        this.addEventListener(MouseEvent.ROLL_OVER, this.onRollOver);
        this.addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
    }

    public function get text_():String {
        return this.text.text;
    }

    public function boldText(val:Boolean):void {
        this.text.boldText(val);
    }

    public function enabled(_arg1:Boolean):void {
        if(mouseEnabled == _arg1) {
            return;
        }
        mouseEnabled = _arg1;
        graphics.clear();
        graphics.beginFill(_arg1 ? 0x000000 : 0x2E2E2E, 1.0);
        graphics.drawRect(0, 0, this.w_, this.text.height + 6);
        graphics.endFill();
        GraphicHelper.createBorder(this, 1, _arg1 ? 0xE5C100 : 0xffffff);
    }

    private function onRollOver(event:MouseEvent):void {
        if(!mouseEnabled) return;
        graphics.clear();
        var gradientMatrix:Matrix = new Matrix();
        gradientMatrix.createGradientBox(this.w_, this.text.height + 6, (Math.PI / 180) * 90, 0, 0);
        graphics.beginGradientFill(GradientType.LINEAR, [0xffffff, 0x000000], [0.6, 1.0], [0, 200], gradientMatrix);
        graphics.drawRect(0, 0, this.w_, this.text.height + 6);
        graphics.endFill();
        GraphicHelper.createBorder(this, 1, 0xE5C100);
    }

    private function onRollOut(event:MouseEvent):void {
        if(!mouseEnabled) return;
        graphics.clear();
        graphics.beginFill(0x000000, 1.0);
        graphics.drawRect(0, 0, this.w_, this.text.height + 6);
        graphics.endFill();
        GraphicHelper.createBorder(this, 1, 0xE5C100);
    }
}
}
