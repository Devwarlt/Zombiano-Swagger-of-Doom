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

//com.company.assembleegameclient.net.messages.data.StatData

package com.company.assembleegameclient.net.messages.data {
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

public class StatData {

    public static const _0I_1:int = 0;
    public static const _V_A_:int = 1;
    public static const _g0:int = 2;
    public static const MAX_HUNGER:int = 3;
    public static const HUNGER:int = 4;
    public static const _K_P_:int = 5;
    public static const _0_8:int = 6;
    public static const _70:int = 7;
    public static const _0R_:int = 20;
    public static const _sw:int = 21;
    public static const _00l:int = 22;
    public static const INVENTORY_0_STAT:int = 8;
    public static const INVENTORY_1_STAT:int = 9;
    public static const INVENTORY_2_STAT:int = 10;
    public static const INVENTORY_3_STAT:int = 11;
    public static const INVENTORY_4_STAT:int = 12;
    public static const INVENTORY_5_STAT:int = 13;
    public static const INVENTORY_6_STAT:int = 14;
    public static const INVENTORY_7_STAT:int = 15;
    public static const INVENTORY_8_STAT:int = 16;
    public static const INVENTORY_9_STAT:int = 17;
    public static const INVENTORY_10_STAT:int = 18;
    public static const INVENTORY_11_STAT:int = 19;
    public static const _S_2:int = 26;
    public static const _0G_F_:int = 27;
    public static const _0J_z:int = 28;
    public static const _x_:int = 29;
    public static const _s9:int = 30;
    public static const _hK_:int = 31;
    public static const TEX1_STAT:int = 32;
    public static const TEX2_STAT:int = 33;
    public static const _K_u:int = 34;
    public static const _Q_c:int = 35;
    public static const _h1:int = 36;
    public static const _1m:int = 37;
    public static const _Z_N_:int = 38;
    public static const _0M_V_:int = 39;
    public static const _06_:int = 40;
    public static const _3y:int = 41;
    public static const _e7:int = 42;
    public static const _ud:int = 43;
    public static const _V_c:int = 44;
    public static const _H_I_:int = 45;
    public static const _P_z:int = 46;
    public static const _vc:int = 47;
    public static const _06o:int = 48;
    public static const _07D_:int = 49;
    public static const _7F_:int = 50;
    public static const _rx:int = 51;
    public static const _wT_:int = 52;
    public static const _0M_9:int = 53;
    public static const _0E_c:int = 54;
    public static const _4z:int = 55;
    public static const _m0:int = 56;
    public static const KILLS:int = 57;
    public static const _dR_:int = 58;
    public static const PREMIUM:int = 59;
    public static const _hi:int = 60;
    public static const _0F_5:int = 61;
    public static const _07q:int = 62;
    public static const _L_i:int = 63;
    public static const _5J_:int = 64;
    public static const _bk:int = 65;
    public static const SKIN_STAT:int = 66;
    public static const PVP_STAT:int = 67;
    public static const TEAM_STAT:int = 68;
    public static const ABILITYCOOLDOWN:int = 69;
    public static const VISIBILITYRANGE:int = 70;

    public static const Backpack1_0:int = 71;
    public static const Backpack1_1:int = 72;
    public static const Backpack1_2:int = 73;
    public static const Backpack1_3:int = 74;
    public static const Backpack1_4:int = 75;
    public static const Backpack1_5:int = 76;
    public static const Backpack1_6:int = 77;
    public static const Backpack1_7:int = 78;
    public static const Backpack2_0:int = 79;
    public static const Backpack2_1:int = 80;
    public static const Backpack2_2:int = 81;
    public static const Backpack2_3:int = 82;
    public static const Backpack2_4:int = 83;
    public static const Backpack2_5:int = 84;
    public static const Backpack2_6:int = 85;
    public static const Backpack2_7:int = 86;
    public static const HasBackpack1:int = 87;
    public static const HasBackpack2:int = 88;
    public static const EFFECT_STAT:int = 89;

    public var _0F_4:uint = 0;
    public var _h:int;
    public var _3x:String;

    public static function _W_H_(_arg1:int):String {
        switch (_arg1) {
            case _0I_1:
                return ("Maximum HP");
            case _V_A_:
                return ("Health");
            case _g0:
                return ("Size");
            case MAX_HUNGER:
                return ("Maximum Hunger");
            case HUNGER:
                return ("Hunger");
            case _0_8:
                return ("XP");
            case _70:
                return ("Level");
            case _0R_:
                return ("Attack");
            case _sw:
                return ("Defense");
            case _00l:
                return ("Speed");
            case _S_2:
                return ("Vitality");
            case _0G_F_:
                return ("Wisdom");
            case _0J_z:
                return ("Dexterity");
        }
        return ("Unknown Stat");
    }

    public function _I_3():Boolean {
        switch (this._0F_4) {
            case _hK_:
            case _07q:
            case EFFECT_STAT:
                return (true);
        }
        return (false);
    }

    public function parseFromInput(_arg1:IDataInput):void {
        this._0F_4 = _arg1.readUnsignedByte();
        if (!this._I_3()) {
            this._h = _arg1.readInt();
        } else {
            this._3x = _arg1.readUTF();
        }
    }

    public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeByte(this._0F_4);
        if (!this._I_3()) {
            _arg1.writeInt(this._h);
        } else {
            _arg1.writeUTF(this._3x);
        }
    }

    public function toString():String {
        if (!this._I_3()) {
            return ((((("[" + this._0F_4) + ": ") + this._h) + "]"));
        }
        return ((((("[" + this._0F_4) + ': "') + this._3x) + '"]'));
    }

}
}//package com.company.assembleegameclient.net.messages.data

