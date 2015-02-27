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

//_D_d._0I__

package _D_d {
import flash.display.Sprite;

import com.company.util.IntPoint;

import flash.display.Shape;
import flash.display.Graphics;
import flash.events.Event;

public class _0I__ extends Sprite {

    public var tiles_:Vector.<IntPoint>;
    private var _T_y:Shape;
    private var _0K_F_:_R_c;

    public function _0I__(_arg1:Vector.<IntPoint>, _arg2:String) {
        this.tiles_ = _arg1;
        this._T_y = new Shape();
        var _local3:Graphics = this._T_y.graphics;
        _local3.clear();
        _local3.beginFill(0, 0.8);
        _local3.drawRect(0, 0, 800, 600);
        _local3.endFill();
        addChild(this._T_y);
        this._0K_F_ = new _R_c(_arg2);
        this._0K_F_.addEventListener(Event.COMPLETE, this.onComplete);
        this._0K_F_.addEventListener(Event.CANCEL, this.onCancel);
        addChild(this._0K_F_);
    }

    public function _wa():String {
        if (this._0K_F_._O_w.text() == "") {
            return (null);
        }
        return (this._0K_F_._O_w.text());
    }

    public function onComplete(_arg1:Event):void {
        dispatchEvent(new Event(Event.COMPLETE));
        parent.removeChild(this);
    }

    public function onCancel(_arg1:Event):void {
        parent.removeChild(this);
    }

}
}//package _D_d

