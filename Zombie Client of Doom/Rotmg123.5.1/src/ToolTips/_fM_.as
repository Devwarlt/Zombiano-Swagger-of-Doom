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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ToolTips._fM_

package ToolTips {
import _05H_._09A_;
import _05H_._M_K_;

import com.company.assembleegameclient.ui.Slot;

import _05H_._A_Y_;
import _05H_._zr;
import _05H_._04E_;
import _05H_._implements;
import _05H_._L_m;
import _05H_._F_o;
import _05H_._oE_;
import _05H_._J_5;
import _05H_._M_;
import _05H_._X_7;
import _05H_._vD_;
import _05H_._5q;
import _05H_._W_C_;
import _05H_._U_y;

public class _fM_ {

    private var hash:Object;

    public function _fM_() {
        var _local1:_09A_ = new _09A_();
        var _local2:_M_K_ = new _M_K_();
        this.hash = {};
        this.hash[Slot.sword_] = _local1;
        this.hash[Slot.dagger_] = _local1;
        this.hash[Slot.bow_] = _local1;
        this.hash[Slot.tome_] = new _A_Y_();
        this.hash[Slot.shield_] = new _zr();
        this.hash[Slot.leatherArmor_] = _local2;
        this.hash[Slot.heavyArmor_] = _local2;
        this.hash[Slot.wand_] = _local1;
        this.hash[Slot.spell_] = new _04E_();
        this.hash[Slot.holySeal_] = new _implements();
        this.hash[Slot.cloak_] = new _L_m();
        this.hash[Slot.robe_] = _local2;
        this.hash[Slot.quiver_] = new _F_o();
        this.hash[Slot.helm_] = new _oE_();
        this.hash[Slot.staff_] = _local1;
        this.hash[Slot.poison_] = new _J_5();
        this.hash[Slot.skull_] = new _M_();
        this.hash[Slot.trap_] = new _X_7();
        this.hash[Slot.orb_] = new _vD_();
        this.hash[Slot.prism_] = new _5q();
        this.hash[Slot.scepter_] = new _W_C_();
    }

    public function _hS_(_arg1:XML, _arg2:XML):_R_N_ {
        var _local3:int = int(_arg1.SlotType);
        var _local4:_U_y = this.hash[_local3];
        var _local5:_R_N_ = new _R_N_();
        if (_local4 != null) {
            _local4._N_Q_(_arg1, _arg2);
            _local5.text = _local4._t4;
            _local5._5n = _local4._5n;
            _local5._P_3 = _local4._P_3;
        }
        return (_local5);
    }

}
}//package ToolTips

