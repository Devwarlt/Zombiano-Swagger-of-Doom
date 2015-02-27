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

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_qD_._wo

package _qD_ {
import flash.display.Sprite;

import flash.events.MouseEvent;
import flash.events.Event;


public class _wo extends Sprite {

    public static const _sS_:String = "Stand";
    public static const WALK1:String = "Walk 1";
    public static const WALK2:String = "Walk 2";
    public static const ATTACK1:String = "Attack 1";
    public static const ATTACK2:String = "Attack 2";
    public static const _0E_y:Vector.<String> = new <String>[_sS_, WALK1, WALK2, ATTACK1, ATTACK2];

    public var _kx:Vector.<_J_B_>;
    public var selected_:_J_B_ = null;

    public function _wo() {
        var _local2:String;
        var _local3:_J_B_;
        this._kx = new Vector.<_J_B_>();
        super();
        var _local1:int;
        for each (_local2 in _0E_y) {
            _local3 = new _J_B_(_local2);
            _local3.addEventListener(MouseEvent.CLICK, this._021);
            _local3.x = _local1;
            _local1 = (_local1 + (_local3.width + 5));
            addChild(_local3);
            this._kx.push(_local3);
        }
        this.setSelected(this._kx[0]);
    }

    public function _rq():String {
        return (this.selected_.label_);
    }

    private function setSelected(_arg1:_J_B_):void {
        if (this.selected_ != null) {
            this.selected_.setSelected(false);
        }
        this.selected_ = _arg1;
        this.selected_.setSelected(true);
        dispatchEvent(new Event(Event.CHANGE));
    }

    private function _021(_arg1:MouseEvent):void {
        var _local2:_J_B_ = (_arg1.target as _J_B_);
        this.setSelected(_local2);
    }

}
}//package _qD_

