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

//_0D_B_._06M_

package _0D_B_ {
import com.company.assembleegameclient.map.GameMap;

import com.company.assembleegameclient.objects.Player;
import com.company.assembleegameclient.ui._return;
import com.company.assembleegameclient.ui._gV_;

import flash.events.MouseEvent;

import com.company.assembleegameclient.parameters.Parameters;

import flash.events.Event;


public class _06M_ extends Menu {

    public var map_:GameMap;
    public var _nC_:Vector.<Player>;
    public var _X_n:_0K_G_;
    public var _6t:_return;
    private var _o2:Vector.<_gV_>;

    public function _06M_(_arg1:GameMap, _arg2:Vector.<Player>) {
        var _local4:Player;
        var _local5:_gV_;
        this._o2 = new Vector.<_gV_>();
        super(0x500C00, 0xFFFFFF);
        this.map_ = _arg1;
        this._nC_ = _arg2.concat();
        var _local3:int = 4;
        if (this.map_.allowPlayerTeleport_) {
            this._X_n = new _K_h(this.map_.player_);
            this._X_n.x = 8;
            this._X_n.y = 8;
            this._X_n.addEventListener(MouseEvent.CLICK, this._L_H_);
            addChild(this._X_n);
            this._6t = new _return((width - 24), 0x310800);
            this._6t.x = 6;
            this._6t.y = 40;
            addChild(this._6t);
            _local3 = 52;
        }
        for each (_local4 in this._nC_) {
            _local5 = new _gV_(0xB3B3B3, true, _local4);
            _local5.x = 0;
            _local5.y = _local3;
            addChild(_local5);
            this._o2.push(_local5);
            _local3 = (_local3 + 32);
        }
    }

    private function _L_H_(_arg1:Event):void {
        var _local4:Player;
        var _local2:Player = this.map_.player_;
        var _local3:Player;
        for each (_local4 in this._nC_) {
            if (_local2._0D_X_(_local4)) {
                _local3 = _local4;
                break;
            }
        }
        if (_local3 != null) {
            _local2.teleportTo(_local3);
        } else {
            this.map_.gs_.textBox_.addText(Parameters.SendError, "No players are eligible for teleporting");
        }
        remove();
    }

}
}//package _0D_B_

