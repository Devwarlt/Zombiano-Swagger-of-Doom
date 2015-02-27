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

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_D_H_._K_U_

package _D_H_ {
import flash.display.Sprite;

import com.company.ui.SimpleText;

import flash.filters.DropShadowFilter;
import flash.display.LineScaleMode;
import flash.display.CapsStyle;
import flash.display.JointStyle;

public class _K_U_ extends Sprite {

    public static const HEIGHT:int = 88;

    public var nameText_:SimpleText;
    public var inputText_:SimpleText;
    public var errorText_:SimpleText;

    public function _K_U_(_arg1:String) {
        this.nameText_ = new SimpleText(18, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this.nameText_.boldText(true);
        this.nameText_.text = "Name: ";
        this.nameText_.updateMetrics();
        this.nameText_.filters = [new DropShadowFilter(0, 0, 0)];
        addChild(this.nameText_);
        this.inputText_ = new SimpleText(20, 0xB3B3B3, true, 260, 30, "Myriad Pro");
        this.inputText_.x = 80;
        this.inputText_.border = false;
        this.inputText_.maxChars = 32;
        this.inputText_.restrict = "a-zA-Z0-9 ";
        this.inputText_.updateMetrics();
        this.inputText_.text = _arg1;
        addChild(this.inputText_);
        graphics.lineStyle(2, 0x454545, 1, false, LineScaleMode.NORMAL, CapsStyle.ROUND, JointStyle.ROUND);
        graphics.beginFill(0x333333, 1);
        graphics.drawRect(78, -2, 260, 30);
        graphics.endFill();
        graphics.lineStyle();
    }

    public function text():String {
        return (this.inputText_.text);
    }

}
}//package _D_H_

