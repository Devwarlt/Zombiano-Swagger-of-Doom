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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// either expressed or implied, of the FreeBSD Project.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_sP_._07x

package _sP_ {
import _F_1._H_o;

import flash.display.Sprite;

import com.company.assembleegameclient.game.GameSprite;
import com.company.rotmg.graphics.ScreenGraphic;

import flash.events.MouseEvent;
import flash.events.Event;

import com.company.assembleegameclient.objects.Player;

import _9R_.VillageResultEvent;

import _0L_C_.DialogBox;

import flash.events.KeyboardEvent;

public class _07x extends Sprite {

    private var gs_:GameSprite;
    private var _P_t:_if;
    private var _0Q_:_H_o;

    public function _07x(_arg1:GameSprite) {
        this.gs_ = _arg1;
        graphics.clear();
        graphics.beginFill(0x2B2B2B, 0.8);
        graphics.drawRect(0, 0, 800, 600);
        graphics.endFill();
        this._wk();
        addChild(new ScreenGraphic());
        this._0Q_ = new _H_o("continue", 36, false);
        this._0Q_.addEventListener(MouseEvent.CLICK, this._0B_Z_);
        addChild(this._0Q_);
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }

    private function _wk():void {
        var _local1:Player = this.gs_.map_.player_;
        this._P_t = new _if(50, 0, (((_local1 == null)) ? "" : _local1.name_), _local1.guildRank_);
        this._P_t.addEventListener(_k6.SET_RANK, this._R_Y_);
        this._P_t.addEventListener(_k6.REMOVE_MEMBER, this._B_P_);
        addChild(this._P_t);
    }

    private function _03C_():void {
        this._P_t.removeEventListener(_k6.SET_RANK, this._R_Y_);
        this._P_t.removeEventListener(_k6.REMOVE_MEMBER, this._B_P_);
        removeChild(this._P_t);
    }

    private function _R_Y_(_arg1:_k6):void {
        this._03C_();
        this.gs_.addEventListener(VillageResultEvent.VILLAGE_RESULT, this._C_L_);
        this.gs_.packetManager._k8(_arg1.name_, _arg1._S_e);
    }

    private function _C_L_(_arg1:VillageResultEvent):void {
        this.gs_.removeEventListener(VillageResultEvent.VILLAGE_RESULT, this._C_L_);
        if (!_arg1.success_) {
            this._L_I_(_arg1.errorText_);
        } else {
            this._wk();
        }
    }

    private function _B_P_(_arg1:_k6):void {
        this._03C_();
        this.gs_.addEventListener(VillageResultEvent.VILLAGE_RESULT, this._X_s);
        this.gs_.packetManager.guildRemove(_arg1.name_);
    }

    private function _X_s(_arg1:VillageResultEvent):void {
        this.gs_.removeEventListener(VillageResultEvent.VILLAGE_RESULT, this._X_s);
        if (!_arg1.success_) {
            this._L_I_(_arg1.errorText_);
        } else {
            this._wk();
        }
    }

    private function _L_I_(_arg1:String):void {
        var _local2:DialogBox = new DialogBox(_arg1, "Error", "Ok", null);
        _local2.addEventListener(DialogBox.BUTTON1_EVENT, this._K__);
        stage.addChild(_local2);
    }

    private function _K__(_arg1:Event):void {
        var _local2:DialogBox = (_arg1.currentTarget as DialogBox);
        stage.removeChild(_local2);
        this._wk();
    }

    private function _0B_Z_(_arg1:MouseEvent):void {
        this.close();
    }

    private function onAddedToStage(_arg1:Event):void {
        stage;
        this._0Q_.x = ((800 / 2) - (this._0Q_.width / 2));
        this._0Q_.y = 524;
        stage.addEventListener(KeyboardEvent.KEY_DOWN, this._0A_Y_, false, 1);
        stage.addEventListener(KeyboardEvent.KEY_UP, this._H_H_, false, 1);
    }

    private function onRemovedFromStage(_arg1:Event):void {
        stage.removeEventListener(KeyboardEvent.KEY_DOWN, this._0A_Y_, false);
        stage.removeEventListener(KeyboardEvent.KEY_UP, this._H_H_, false);
    }

    private function _0A_Y_(_arg1:KeyboardEvent):void {
        _arg1.stopImmediatePropagation();
    }

    private function _H_H_(_arg1:KeyboardEvent):void {
        _arg1.stopImmediatePropagation();
    }

    private function close():void {
        stage.focus = null;
        parent.removeChild(this);
    }

}
}//package _sP_

