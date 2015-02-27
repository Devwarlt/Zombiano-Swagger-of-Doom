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
 * Created by Thelzar on 7/20/2014.
 */
package com.company.assembleegameclient.util {
import flash.display.CapsStyle;
import flash.display.JointStyle;
import flash.display.LineScaleMode;
import flash.display.Sprite;

public class ModalBackground extends Sprite {

    public static const HORIZONTAL_DIVISION:String = "HORIZONTAL_DIVISION";
    public static const VERTICAL_DIVISION:String = "VERTICAL_DIVISION";
    private static const BEVEL:int = 4;

    public function draw(_arg1:int, _arg2:int, _arg3:int = 0):void {
        var _local4:_str1119 = new _str1119(_arg1, _arg2, BEVEL);
        var _local5:_str1120 = new _str1120();
        graphics.lineStyle(1, 0xFFFFFF, 1, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3);
        switch (_arg3) {
            case 0:
                graphics.beginFill(0x500C00);
                _local5._str2527(0, 0, _local4, graphics);
                graphics.endFill();
                break;
            case 1:
                graphics.lineStyle(1, 0x500C00, 1, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3);
                graphics.beginFill(0x500C00, 1);
                _local5._str2527(1, 1, new _str1119((_arg1 - 2), 29, BEVEL), graphics);
                graphics.endFill();
                graphics.beginFill(0x500C00, 1);
                graphics.drawRect(1, 15, (_arg1 - 2), 15);
                graphics.endFill();
                graphics.lineStyle(2, 0xFFFFFF, 1, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3);
                graphics.beginFill(0x500C00, 0);
                _local5._str2527(0, 0, _local4, graphics);
                graphics.endFill();
                break;
            case 2:
                graphics.lineStyle(2, 0xFFFFFF, 1, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3);
                graphics.beginFill(0x500C00, 0);
                _local5._str2527(0, 0, _local4, graphics);
                graphics.endFill();
                break;
            default:
                throw new Error("No value has been set!");
                break;
        }
    }

    public function createRectangle(_arg1:String, _arg2:int):void {
        switch (_arg1) {
            case HORIZONTAL_DIVISION:
                this.fillRectHorizontal(_arg2);
                break;
            case VERTICAL_DIVISION:
                this.fillRectVertical(_arg2);
                break;
        }
    }

    private function fillRectHorizontal(_arg_1:int):void {
        graphics.lineStyle();
        graphics.endFill();
        graphics.moveTo(1, _arg_1);
        graphics.beginFill(0x666666, 1);
        graphics.drawRect(1, _arg_1, (width - 2), 2);
    }

    private function fillRectVertical(_arg_1:int):void {
        graphics.lineStyle();
        graphics.moveTo(_arg_1, 1);
        graphics.lineStyle(2, 0x666666);
        graphics.lineTo(_arg_1, (height - 1));
    }

    public function ModalBackground() {
    }
}
}
