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

//_0G_l._X_R_

package _0G_l {

import flash.display.BitmapData;
import flash.geom.Point;

import _q8._9l;

import flash.utils.ByteArray;


public class _X_R_ {

    private static const WIDTH:int = 128;
    private static const HEIGHT:int = 0x0100;

    public var _yA_:Vector.<BitmapData>;

    public function _X_R_() {
        this._yA_ = new Vector.<BitmapData>();
        super();
    }

    public function _io(_arg1:BitmapData):void {
        this._yA_.push(_arg1);
    }

    public function _05W_():ByteArray {
        var _local4:BitmapData;
        var _local1:BitmapData = new BitmapData(WIDTH, HEIGHT, true, 0);
        var _local2:Point = new Point(0, 0);
        var _local3:int;
        for each (_local4 in this._yA_) {
            if ((_local2.x + _local4.width) > WIDTH) {
                _local2.y = (_local2.y + _local3);
                _local2.x = 0;
                _local3 = 0;
            }
            if ((_local2.y + _local4.height) > HEIGHT) break;
            _local1.copyPixels(_local4, _local4.rect, _local2);
            _local2.x = (_local2.x + _local4.width);
            if (_local4.height > _local3) {
                _local3 = _local4.height;
            }
        }
        return (_9l.encode(_local1));
    }

}
}//package _0G_l

