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

//com.company.assembleegameclient.screens.charrects.CharacterRect

package com.company.assembleegameclient.screens.charrects {
import flash.display.Sprite;
import flash.display.Shape;
import flash.events.MouseEvent;
import flash.display.Graphics;

public class CharacterRect extends Sprite {

    public static const WIDTH:int = 320;
    public static const HEIGHT:int = 60;

    private var color_:uint;
    private var overColor_:uint;
    private var box_:Shape;

    public function CharacterRect(_arg1:uint, _arg2:uint) {
        this.color_ = _arg1;
        this.overColor_ = _arg2;
        this.box_ = new Shape();
        this.drawBox(false);
        addChild(this.box_);
        addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
    }

    protected function onMouseOver(_arg1:MouseEvent):void {
        this.drawBox(true);
    }

    protected function onRollOut(_arg1:MouseEvent):void {
        this.drawBox(false);
    }

    private function drawBox(_arg1:Boolean):void {
        var _local2:Graphics = this.box_.graphics;
        _local2.clear();
        _local2.beginFill(_arg1 ? this.overColor_ : this.color_);
        _local2.drawRect(0, 0, WIDTH, HEIGHT);
        _local2.endFill();
    }

}
}//package com.company.assembleegameclient.screens.charrects

