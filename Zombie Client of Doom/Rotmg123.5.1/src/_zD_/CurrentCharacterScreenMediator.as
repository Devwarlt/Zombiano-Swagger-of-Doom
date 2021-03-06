﻿// Copyright (c) 2015, FireBite/Aceticsoft Studios Inc.
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

//_zD_._xF_

package _zD_ {
import _C__.Mediator;

import _F_1.selectChars.CurrentCharacterScreen;
import _F_1._0H_2;
import _F_1._C_Q_;

import _W_D_.CharListHistory;

import _P_E_._W_2;

import _0M_m._00V_;

import _U_5._7e;
import _U_5.CharListResetDispatcher;
import _U_5.SpriteTarget;
import _U_5._dd;

import _05Z_._08i;

import _02b._fn;

import com.company.util._0A_s;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.appengine.SavedCharacter;

import _04w._07V_;

public class CurrentCharacterScreenMediator extends Mediator {

    [Inject]
    public var view:CurrentCharacterScreen;
    [Inject]
    public var _eJ_:CharListHistory;
    [Inject]
    public var _n7:_W_2;
    [Inject]
    public var beginnersPackage:_00V_;
    [Inject]
    public var _o_:_7e;
    [Inject]
    public var _0D_p:CharListResetDispatcher;
    [Inject]
    public var _0_b:SpriteTarget;
    [Inject]
    public var _T__:_dd;
    [Inject]
    public var _D_u:_08i;

    override public function initialize():void {
        this._T_Q_();
        this.view.close.add(this._of);
        this.view._n7.add(this._yk);
        this.view.newCharacter.add(this._8b);
        this.view._1V_.add(this._8b);
        this.view._O_v.add(this._08d);
        this.view._D_u.add(this._I_S_);
        this.view.initialize(this._eJ_.charList);
        if (this.beginnersPackage._li()) {
            this._n7.dispatch();
        }
        if (this.beginnersPackage.isAvailable()) {
            this.view._u_();
        }
    }

    override public function destroy():void {
        this.view.close.remove(this._of);
        this.view._n7.remove(this._yk);
        this.view.newCharacter.remove(this._8b);
        this.view._O_v.remove(this._08d);
        this.view._1V_.remove(this._8b);
        this.view._D_u.remove(this._I_S_);
    }

    private function _T_Q_():void {
        var _local2:_fn;
        var _local1:String = _0A_s._mP_();
        if (Parameters.data_.lastDailyAnalytics != _local1) {
            _local2 = new _fn();
            _local2.category = "joinDate";
            _local2._lC_ = Parameters.data_.joinDate;
            this._o_.dispatch(_local2);
            Parameters.data_.lastDailyAnalytics = _local1;
            Parameters.save();
        }
    }

    private function _8b():void {
        this._T__.dispatch(new _0H_2());
    }

    private function _yk():void {
        this._n7.dispatch();
    }

    private function _of():void {
        this._T__.dispatch(new _C_Q_());
    }

    private function _08d():void {
        this._0D_p.dispatch();
        this._0_b.dispatch(new CurrentCharacterScreen());
    }

    private function _I_S_():void {
        var _local1:SavedCharacter = this._eJ_.charList.savedChars_[0];
        this._eJ_.charId = _local1.charId();
        var _local2:_fn = new _fn();
        _local2.category = "character";
        _local2._lC_ = "select";
        _local2._9g = _local1._jp();
        _local2.value = _local1.level();
        this._o_.dispatch(_local2);
        var _local3:_07V_ = new _07V_();
        _local3._0_E_ = false;
        _local3.charId = _local1.charId();
        _local3._05d = true;
        this._D_u.dispatch(_local3);
    }

}
}//package _zD_

