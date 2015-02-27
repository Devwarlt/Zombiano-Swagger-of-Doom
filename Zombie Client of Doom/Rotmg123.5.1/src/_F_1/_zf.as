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

//_F_1._zf

package _F_1 {
import _0L_C_.DialogBox;

import flash.display.Sprite;

import com.company.ui.SimpleText;

import _02t._R_f;

import com.company.rotmg.graphics.ScreenGraphic;

import flash.text.TextFieldAutoSize;
import flash.filters.DropShadowFilter;

public class _zf extends Sprite {

    private var text:SimpleText;

    public function _zf() {
        addChild(new _R_f());
        addChild(new ScreenGraphic());
        this.text = new SimpleText(30, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this.text.y = 526;
        this.text.boldText(true);
        this.text.htmlText = '<p align="center">Loading...</p>';
        this.text.autoSize = TextFieldAutoSize.CENTER;
        this.text.updateMetrics();
        this.text.filters = [new DropShadowFilter(0, 0, 0, 1, 4, 4)];
        addChild(this.text);
    }

    public function _02C_(_arg1:String):void {
        if (_arg1.search("AC.BAN") > -1) {
            addChild(new DialogBox(_arg1.replace("AC.BAN", ""), "Banned :(", null, null));
            this.text.htmlText = "Account has been banned.";
        }
        else {
            this.text.htmlText = _arg1;
        }
        this.text.x = ((800 - this.text.width) * 0.5);
    }

}
}//package _F_1

