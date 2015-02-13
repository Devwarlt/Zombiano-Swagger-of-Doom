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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// either expressed or implied, of the FreeBSD Project.// either expressed or implied, of the FreeBSD Project.

/**
 * Created by Fabian on 12.11.2014.
 */
package com.company.assembleegameclient.ui {
import _sp._aJ_;

import com.embeds.EmbeddedAssets_btnEmbed_;

import flash.display.Sprite;
import flash.events.MouseEvent;

public class xButton extends Sprite {

    private static var buttonSprite:Class = EmbeddedAssets_btnEmbed_;
    public var event:_aJ_ = new _aJ_();
    public var disabled:Boolean = false;

    public function xButton() {
        addChild(new buttonSprite());
        buttonMode = true;
        addEventListener(MouseEvent.CLICK, this.onButtonClick);
    }

    public function disable():void {
        this.disabled = true;
        removeEventListener(MouseEvent.CLICK, this.onButtonClick);
    }

    private function onButtonClick(_arg1:MouseEvent):void {
        if (!this.disabled) {
            this.event.dispatch();
            removeEventListener(MouseEvent.CLICK, this.onButtonClick);
        }
    }
}
}
