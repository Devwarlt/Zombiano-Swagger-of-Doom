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

//_02t._R_f

package _02t {
import flash.display.Sprite;
import flash.display.Shape;

import com.company.assembleegameclient.ui.PlaySoundsButton;

public class _R_f extends Sprite {

    private var map:_pM_;
    private var mapMask:Shape;
    private var playSoundsButton:PlaySoundsButton;

    public function _R_f() {
        this.map = new _pM_();
        addChild(this.map);
        this.mapMask = new Shape();
        this.mapMask.graphics.beginFill(0x2B2B2B, 0.8);
        this.mapMask.graphics.drawRect(0, 0, 800, 600);
        this.mapMask.graphics.endFill();
        addChild(this.mapMask);
        this.playSoundsButton = new PlaySoundsButton();
        this.playSoundsButton.x = 2;
        addChild(this.playSoundsButton);
    }
}
}//package _02t

