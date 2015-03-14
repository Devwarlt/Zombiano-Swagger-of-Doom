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

//_F_1._05p

package _F_1 {
import _9R_._B_w;
import _9R_._W_h;

import ToolTips.RankToolTip;

import _qN_.Account;
import _qN_._9j;
import _qN_._F_m;

import _sp.Signal;

import _zD_.CurrentCharacterScreenMediator;

import com.company.assembleegameclient.appengine.SavedCharsList;
import com.company.assembleegameclient.ui._0G_h;
import com.company.assembleegameclient.ui._L_N_;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

public class _05p extends Sprite {

    public var tooltip:Signal;
    public var _03I_:Signal;
    private var _dS_:Sprite;
    private var _tW_:Sprite;
    private var _wi:Sprite;
    private var _0B_b:String;
    private var _58:int;
    private var rank:int;
    private var _H_W_:Class;
    private var _B_D_:_0G_h;
    private var _I_Q_:_L_N_;
    private var _0_4:_9j;
    private var _06e:Boolean;
    private var charList:SavedCharsList;

    public function _05p(_arg1:Class) {
        this.tooltip = new Signal();
        this._03I_ = new Signal(Class);
        this._H_W_ = _arg1;
        this._0H_D_();
        this._fQ_();
    }

    private function _fQ_():void {
        this._0_4 = Account._get().newAccountText();
        this._0_4.addEventListener(_F_m.ACCOUNT_TEXT_EVENT, this._0L__);
        this._wi.addChild(this._0_4);
    }

    private function _0H_D_():void {
        addChild((this._dS_ = new Sprite()));
        addChild((this._tW_ = new Sprite()));
        addChild((this._wi = new Sprite()));
    }

    public function _m2(_arg1:String, _arg2:int):void {
        this._0B_b = _arg1;
        this._58 = _arg2;
        this._09T_();
    }

    private function _09T_():void {
        this._I_Q_ = new _L_N_(this._0B_b, this._58);
        this._I_Q_.x = 92;
        this._I_Q_.y = 6;
        this._tW_.addChild(this._I_Q_);
    }

    public function _0I_v(_arg1:int):void {
        this.rank = _arg1;
        this._0H_l();
    }

    private function _0H_l():void {
        this._B_D_ = new _0G_h(this.rank, true, false);
        this._B_D_.x = 36;
        this._B_D_.y = 4;
        this._B_D_.mouseEnabled = true;
        this._B_D_.addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        this._B_D_.addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
        this._dS_.addChild(this._B_D_);
    }

    public function initialize(_arg1:SavedCharsList):void {
        this.charList = _arg1;
        if (this._06e) {
            return;
        }
        this._06e = true;
        this._m2(_arg1.guildName_, _arg1.guildRank_);
        this._0I_v(_arg1.rank);
        stage;
        this._0_4.x = ((800 - this._0_4.width) - 10);
        this._0_4.y = 2;
        stage.addEventListener(_B_w.MONEY_CHANGED, this._L_u);
        stage.addEventListener(_W_h.ACCOUNT_CHANGED, this._sU_);
    }

    protected function onMouseOver(_arg1:MouseEvent):void {
        this.tooltip.dispatch(new RankToolTip(this.rank));
    }

    protected function onRollOut(_arg1:MouseEvent):void {
        this.tooltip.dispatch(null);
    }

    public function destroy():void {
        stage.removeEventListener(_B_w.MONEY_CHANGED, this._L_u);
        stage.removeEventListener(_W_h.ACCOUNT_CHANGED, this._sU_);
    }

    private function _L_u(_arg1:Event):void {
        if (this._H_W_) {
            this._03I_.dispatch(this._H_W_);
        }
    }

    private function _sU_(_arg1:Event):void {
        if (this._H_W_ != null) {
            this._03I_.dispatch(this._H_W_);
        }
    }

    protected function onAccountComplete(_arg1:Event):void {
        var _local2:Sprite = (_arg1.currentTarget as Sprite);
        _local2.removeEventListener(Event.COMPLETE, this.onAccountComplete);
        removeChild(_local2);
        this._0_4.refresh();
        stage;
        this._0_4.x = ((800 - this._0_4.width) - 10);
        if (this._H_W_ != null) {
            this._03I_.dispatch(this._H_W_);
        }
    }

    protected function _0L__(_arg1:_F_m):void {
        if (_arg1._Q_j == null) {
            this._0_4.refresh();
            stage;
            this._0_4.x = ((800 - this._0_4.width) - 10);
            this._03I_.dispatch(this._H_W_);
        } else {
            _arg1._Q_j.addEventListener(Event.COMPLETE, this.onAccountComplete);
            addChild(_arg1._Q_j);
        }
    }

    public function _0j():void {
        var _local1:Sprite = Account._get().newAccountManagement();
        if (_local1 == null) {
            return;
        }
        _local1.addEventListener(Event.COMPLETE, this.onAccountComplete);
        addChild(_local1);
    }
}
}//package _F_1

