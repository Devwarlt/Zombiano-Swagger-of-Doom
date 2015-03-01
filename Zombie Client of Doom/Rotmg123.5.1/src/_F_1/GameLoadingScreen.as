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

//_F_1._E_r

package _F_1 {
import flash.display.Sprite;

import com.company.ui.SimpleText;

import _sp._aJ_;

import com.company.rotmg.graphics.ScreenGraphic;

import flash.text.TextFieldAutoSize;
import flash.filters.DropShadowFilter;
import flash.events.Event;

import _qN_.Account;

public class GameLoadingScreen extends Sprite {

    private var statusText:SimpleText;
    public var completed:_aJ_;

    public function GameLoadingScreen() {
        addChild(new ScreenGraphic());
        this.statusText = new SimpleText(30, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this.statusText.boldText(true);
        this.statusText.htmlText = '<p align="center">Loading...</p>';
        this.statusText.autoSize = TextFieldAutoSize.CENTER;
        this.statusText.updateMetrics();
        this.statusText.filters = [new DropShadowFilter(0, 0, 0, 1, 4, 4)];
        addChild(this.statusText);
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        this.completed = new _aJ_();
    }

    protected function onAddedToStage(_arg1:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        stage;
        this.statusText.x = ((800 / 2) - (this.statusText.width / 2));
        this.statusText.y = 524;
        this._D_I_();
    }

    private function _D_I_():void {
        Account.load(stage, this._0L_);
    }

    private function _0L_():void {
        this.completed.dispatch();
    }

}
}//package _F_1

