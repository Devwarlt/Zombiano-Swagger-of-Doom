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

//ToolTips.EquipmentToolTip

package ToolTips {


import _ke._U_c;

import com.company.assembleegameclient.net.messages.data.StatData;
import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.assembleegameclient.objects.Player;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.ui._return;
import com.company.ui.SimpleText;
import com.company.util.BitmapUtil;
import com.company.util.Keys;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.filters.DropShadowFilter;
import flash.text.StyleSheet;

public class EquipmentToolTip extends ToolTip {

    private static const _be:int = 230;
    private static const _K_z:String = ".in { margin-left:10px; text-indent: -10px; }";
    private static const fontName:String = "Myriad Pro";
    private static const fontSize:int = 16;

    private var _5U_:Bitmap;
    private var _P_V_:SimpleText;
    private var _V_0:SimpleText;
    private var credits:SimpleText;
    private var rank_:SimpleText;
    private var _C_G_:SimpleText;
    private var line1_:_return;
    private var _f8:SimpleText;
    private var line2_:_return;
    private var _tF_:SimpleText;
    private var player_:Player;
    private var _Y_X_:Boolean = false;
    private var objectType_:int;
    private var curItemXML:XML = null;
    private var _I_z:XML = null;
    private var _uW_:_fM_;
    private var _0G_J_:Boolean;
    private var _Q_O_:Vector.<Restriction>;
    private var _a2:Vector.<Effect>;
    private var _0A_f:int;
    private var _sJ_:int;
    private var _J_9:String;
    private var _G_H_:uint;
    private var _bs:Boolean;
    private var _02N_:int;
    private var _gE_:_R_N_;

    public function EquipmentToolTip(_arg1:int, _arg2:Player, _arg3:int, _arg4:String, _arg5:uint = 1, _arg6:Boolean = false) {
        var _local9:uint;
        this.player_ = _arg2;
        this._J_9 = _arg4;
        this._G_H_ = _arg5;
        this._bs = _arg6;
        this._0G_J_ = (_arg2 != null ? ObjectLibrary._d1(_arg1, _arg2) : false);
        var _local7:uint = ((((this._0G_J_) || ((this.player_ == null)))) ? 0x452200 : 5578255);
        var _local8:uint = ((((this._0G_J_) || ((_arg2 == null)))) ? 0x9B9B9B : 10965039);
        super(_local7, 1, _local8, 1, true);
        this._uW_ = new _fM_();
        this.objectType_ = _arg1;
        this._I_z = ObjectLibrary.Items[_arg1];
        this._Y_X_ = this.player_ != null ? ObjectLibrary._01j(this.objectType_, this.player_) : false;
        this._a2 = new Vector.<Effect>();
        this._sJ_ = _arg3;
        this._0A_f = int(this._I_z.SlotType);
        if (this.player_ == null) {
            this.curItemXML = this._I_z;
        } else {
            if (this._Y_X_) {
                _local9 = 0;
                while (_local9 < 4) {
                    if ((((this._0A_f == this.player_._9A_[_local9])) && (!((this.player_.equipment_[_local9] == -1))))) {
                        this.curItemXML = ObjectLibrary.Items[this.player_.equipment_[_local9]];
                        break;
                    }
                    _local9++;
                }
            }
        }
        this._0B_C_();
        this._0D_6();
        this._07X_();
        this._ev();
        this._case_();
        this.extraToolData_();
        this._U_I_();
        this._eS_();
        this._R_H_();
        this._jY_();
        this._S_F_();
        this._K_6();
        this._ff();
        this._i5();
        this._02u();
        this._V_Y_();
        this.addCredits();
    }

    private static function _N_W_(_arg1:Vector.<Restriction>):String {
        var _local4:Restriction;
        var _local5:String;
        var _local2 = "";
        var _local3:Boolean = true;
        for each (_local4 in _arg1) {
            if (!_local3) {
                _local2 = (_local2 + "\n");
            } else {
                _local3 = false;
            }
            _local5 = (((('<font color="#' + _local4.color_.toString(16)) + '">') + _local4.text_) + "</font>");
            if (_local4.bold_) {
                _local5 = (("<b>" + _local5) + "</b>");
            }
            _local2 = (_local2 + _local5);
        }
        return (_local2);
    }

    private function _02c():Boolean {
        return (((this._Y_X_) && ((this.curItemXML == null))));
    }

    private function _0B_C_():void {
        var _local1:XML = ObjectLibrary.Items[this.objectType_];
        var _local2:int = 5;
        if (_local1.hasOwnProperty("ScaleValue")) {
            _local2 = _local1.ScaleValue;
        }
        var _local3:BitmapData = ObjectLibrary.getRedrawnTextureFromType(this.objectType_, 60, true, true, _local2);
        _local3 = BitmapUtil._Y_d(_local3, 4, 4, (_local3.width - 8), (_local3.height - 8));
        this._5U_ = new Bitmap(_local3);
        addChild(this._5U_);
    }

    private function addCredits():void {
        if (this._I_z.hasOwnProperty("ThanksTo")) {
            this.credits = new SimpleText(fontSize - 2, 0xFFFFFF, false, width - 20, 0, fontName);
            this.credits.wordWrap = true;
            this.credits.multiline = true;
            var type:String = String(XML(this._I_z.ThanksTo).attribute("type")) != "" ? this._I_z.ThanksTo.@type : "item";
            this.credits.text = "Special thanks to:\n" + this._I_z.ThanksTo + "\nfor this " + type + ".";
            this.credits.updateMetrics();
            this.credits.y = height + 10;
            this.credits.x = 10;
            addChild(this.credits);
        }
    }

    private function _07X_():void {
        this._V_0 = new SimpleText(fontSize + 2, 0xFFFFFF, false, 30, 0, fontName);
        this.rank_ = new SimpleText(fontSize + 2, 0xFFFFFF, false, 30, 0, fontName);
        this._P_V_.boldText(true);
        this._V_0.y = ((this._5U_.height / 2) - (this._P_V_._I_x / 2));
        this._V_0.x = (_be - 30);
        this.rank_.y = ((this._5U_.height / 2) - (this._P_V_._I_x / 2) + this._V_0.y);
        this.rank_.x = (_be - 30);
        if (!this._I_z.hasOwnProperty("Consumable") && !this._tO_()) {
            if (this._I_z.hasOwnProperty("Tier")) {
                this._V_0.text = ("T" + this._I_z.Tier);
            }
            else if (this._I_z.hasOwnProperty("Recipe")) {
                this._V_0.setColor(0x0000FF);
                this._V_0.text = "CR";
            }
            else if (this._I_z.hasOwnProperty("Material")) {
                this._V_0.setColor(0xF2FF00);
                this._V_0.text = "CM";
            }
            else if (this._I_z.hasOwnProperty("CraftingItem")) {
                this._V_0.setColor(0x00FF04);
                this._V_0.text = "OC";
            }
            else {
                this._V_0.setColor(9055202);
                this._V_0.text = "UT";
            }
            this._V_0.updateMetrics();
            addChild(this._V_0);
        }
    }

    private function _tO_():Boolean {
        var activateTags:XMLList;
        activateTags = this._I_z.Activate.(text() == "PermaPet");
        return ((activateTags.length() >= 1));
    }

    private function _0D_6():void {
        var _local1:int = ((((this._0G_J_) || ((this.player_ == null)))) ? 0xFFFFFF : 16549442);
        this._P_V_ = new SimpleText(fontSize + 2, _local1, false, (((_be - this._5U_.width) - 4) - 30), 0, fontName);
        this._P_V_.boldText(true);
        this._P_V_.wordWrap = true;
        this._P_V_.text = ObjectLibrary._0D_N_[this.objectType_];
        this._P_V_.updateMetrics();
        this._P_V_.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
        this._P_V_.x = (this._5U_.width + 4);
        this._P_V_.y = ((this._5U_.height / 2) - (this._P_V_._I_x / 2));
        addChild(this._P_V_);
    }

    private function _i5():void {
        this._02N_ = ((this._C_G_.y + this._C_G_.height) + 8);
        if (((!((this._a2.length == 0))) || (!((this._gE_.text == ""))))) {
            this.line1_ = new _return((_be - 12), 0x310800);
            this.line1_.x = 8;
            this.line1_.y = this._02N_;
            addChild(this.line1_);
            this._f8 = new SimpleText(fontSize, 0xB3B3B3, false, ((_be - this._5U_.width) - 4), 0, fontName);
            this._f8.wordWrap = true;
            this._f8.htmlText = (this._gE_.text + this._41(this._a2));
            this._f8._08S_();
            this._f8.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
            this._f8.x = 4;
            this._f8.y = (this.line1_.y + 8);
            addChild(this._f8);
            this._02N_ = ((this._f8.y + this._f8.height) + 8);
        }
    }

    private function _U_I_():void {
        if (((this._I_z.hasOwnProperty("NumProjectiles")) && (!((this._gE_._5n.hasOwnProperty(this._I_z.NumProjectiles.toXMLString()) == true))))) {
            this._a2.push(new Effect("Shots", this._I_z.NumProjectiles));
        }
        if (this._I_z.hasOwnProperty("Recipe")) {
            this._a2.push(new Effect("Crafting item", this._I_z.Recipe));
        }
    }

    private function _ff():void {
        var _local1:int;
        var _local2:String;
        var _local3:String;
        var _local4:int;
        if (this._I_z.hasOwnProperty("FameBonus")) {
            _local1 = int(this._I_z.FameBonus);
            _local2 = (_local1 + "%");
            _local3 = ((this._0G_J_) ? _0J_n._rJ_ : _0J_n._iF_);
            if (((!((this.curItemXML == null))) && (this.curItemXML.hasOwnProperty("FameBonus")))) {
                _local4 = int(this.curItemXML.FameBonus.text());
                _local3 = _0J_n._qy((_local1 - _local4));
            }
            this._a2.push(new Effect("Fame Bonus", _0J_n._M_w(_local2, _local3)));
        }
    }

    private function _K_6():void {
        if ((this._I_z.hasOwnProperty("MpCost") || this._I_z.hasOwnProperty("MpEndCost")) && !this._gE_._5n[this._I_z.MpCost[0].toXMLString()]) {
            if (this._I_z.hasOwnProperty("MpEndCost"))
                this._a2.push(new Effect("MP Cost", this._I_z.MpEndCost));
            else
                this._a2.push(new Effect("MP Cost", this._I_z.MpCost));
        }
    }

    private function _S_F_():void {
        if (this._I_z.hasOwnProperty("Doses")) {
            this._a2.push(new Effect("Doses", this._I_z.Doses));
        }
    }

    private function extraToolData_():void {
        var _local1:XMLList;
        var _local2:XML;
        var _local3:String;
        var _local4:String;
        var _local5:String;
        if (this._I_z.hasOwnProperty("ExtraTooltipData")) {
            _local1 = this._I_z.ExtraTooltipData.EffectInfo;
            for each (_local2 in _local1) {
                _local3 = _local2.attribute("name");
                _local4 = _local2.attribute("description");
                if (_local3) {
                    this._a2.push(new Effect(_local3, _local4));
                }
                if (_local4) {
                    this._a2.push(new Effect(_local3, _local4));
                }
            }
        }
    }

    private function _eS_():void {
        var _local1:XML;
        var _local2:int;
        var _local3:int;
        var _local4:Number;
        var _local5:XML;
        if (((this._I_z.hasOwnProperty("Projectile")) && ((this._gE_._5n.hasOwnProperty(this._I_z.Projectile.toXMLString()) == false)))) {
            _local1 = XML(this._I_z.Projectile);
            _local2 = int(_local1.MinDamage);
            _local3 = int(_local1.MaxDamage);
            this._a2.push(new Effect("Damage", (((_local2 == _local3)) ? _local2 : ((_local2 + " - ") + _local3)).toString()));
            _local4 = ((Number(_local1.Speed) * Number(_local1.LifetimeMS)) / 10000);
            this._a2.push(new Effect("Range", _0J_n._A_l(_local4)));
            if (this._I_z.Projectile.hasOwnProperty("MultiHit")) {
                this._a2.push(new Effect("", "Shots hit multiple targets"));
            }
            if (this._I_z.Projectile.hasOwnProperty("PassesCover")) {
                this._a2.push(new Effect("", "Shots pass through obstacles"));
            }
            for each (_local5 in _local1.ConditionEffect) {
                if (this._gE_._5n[_local5.toXMLString()] == null) {
                    this._a2.push(new Effect("Shot Effect", (((this._I_z.Projectile.ConditionEffect + " for ") + this._I_z.Projectile.ConditionEffect.@duration) + " secs")));
                }
            }
        }
    }

    private function _R_H_():void {
        var _local1:XML;
        var _local2:String;
        var _local3:int;
        var _local4:int;
        for each (_local1 in this._I_z.Activate) {
            if (this._gE_._5n[_local1.toXMLString()] != true) {
                var _local6 = _local1.toString();
                switch (_local6) {
                    case "ConditionEffectAura":
                        this._a2.push(new Effect("Party Effect", (("Within " + _local1.@range) + " sqrs")));
                        this._a2.push(new Effect("", (((("  " + _local1.@effect) + " for ") + _local1.@duration) + " secs")));
                        break;
                    case "ConditionEffectSelf":
                        this._a2.push(new Effect("Effect on Self", ""));
                        this._a2.push(new Effect("", (((("  " + _local1.@effect) + " for ") + _local1.@duration) + " secs")));
                        break;
                    case "Heal":
                        this._a2.push(new Effect("", (("+" + _local1.@amount) + " HP")));
                        break;
                    case "HealNova":
                        this._a2.push(new Effect("Party Heal", (((_local1.@amount + " HP at ") + _local1.@range) + " sqrs")));
                        break;
                    case "Magic":
                        this._a2.push(new Effect("", (("+" + _local1.@amount) + " MP")));
                        break;
                    case "MagicNova":
                        this._a2.push(new Effect("Fill Party Magic", (((_local1.@amount + " MP at ") + _local1.@range) + " sqrs")));
                        break;
                    case "RequestTeleport":
                        this._a2.push(new Effect("", "RequestTeleport to Target"));
                        break;
                    case "VampireBlast":
                        this._a2.push(new Effect("Steal", (((_local1.@totalDamage + " HP within ") + _local1.@radius) + " sqrs")));
                        break;
                    case "Trap":
                        this._a2.push(new Effect("Trap", (((_local1.@totalDamage + " HP within ") + _local1.@radius) + " sqrs")));
                        this._a2.push(new Effect("", (((("  " + ((_local1.hasOwnProperty("@condEffect")) ? _local1.@condEffect : "Slowed")) + " for ") + ((_local1.hasOwnProperty("@condDuration")) ? _local1.@condDuration : "5")) + " secs")));
                        break;
                    case "StasisBlast":
                        this._a2.push(new Effect("Stasis on Group", (_local1.@duration + " secs")));
                        break;
                    case "Decoy":
                        this._a2.push(new Effect("Decoy", (_local1.@duration + " secs")));
                        break;
                    case "Lightning":
                        this._a2.push(new Effect("Lightning", ""));
                        this._a2.push(new Effect("", ((((" " + _local1.@totalDamage) + " to ") + _local1.@maxTargets) + " targets")));
                        break;
                    case "PoisonGrenade":
                        this._a2.push(new Effect("Poison Grenade", ""));
                        this._a2.push(new Effect("", ((((((" " + _local1.@totalDamage) + " HP over ") + _local1.@duration) + " secs within ") + _local1.@radius) + " sqrs\n")));
                        break;
                    case "RemoveNegativeConditions":
                        this._a2.push(new Effect("", "Removes negative conditions"));
                        break;
                    case "RemoveNegativeConditionsSelf":
                        this._a2.push(new Effect("", "Removes negative conditions"));
                        break;
                    case "IncrementStat":
                        _local3 = int(_local1.@stat);
                        _local4 = int(_local1.@amount);
                        if (((!((_local3 == StatData._V_A_))) && (!((_local3 == StatData.HUNGER))))) {
                            _local2 = ("Permanently increases " + StatData._W_H_(_local3));
                        } else {
                            _local2 = ((("+" + _local4) + " ") + StatData._W_H_(_local3));
                        }
                        this._a2.push(new Effect("", _local2));
                        break;
                }
            }
        }
    }

    private function _jY_():void {
        var _local1:XML;
        var _local3:String;
        var _local2:Boolean = true;
        for each (_local1 in this._I_z.ActivateOnEquip) {
            if (_local2) {
                this._a2.push(new Effect("On Equip", ""));
                _local2 = false;
            }
            _local3 = this._gE_._P_3[_local1.toXMLString()];
            if (_local3 != null) {
                this._a2.push(new Effect("", (_local3)));
            } else {
                if (_local1.toString() == "IncrementStat") {
                    this._a2.push(new Effect("", this.statHandler(_local1)));
                }
            }
        }
    }

    private function statHandler(_arg1:XML):String {
        var _local2:int = int(_arg1.@stat);
        var _local3:int = int(_arg1.@amount);
        var _local4:String = (_local3 > -1) ? "+" : "";
        return ('<font color="' + textColour(_arg1) + '">' + (_local4 + String(_local3) + " ") + StatData._W_H_(_local2) + '</font>');
    }

    private function textColour(activateXML:XML):String {
        var match:XML;
        var otherAmount:int;
        var stat:int = int(activateXML.@stat);
        var amount:int = int(activateXML.@amount);
        var textColor:String = ((this._0G_J_) ? "#00FF00" : "#FFFF8F");
        var otherMatches:XMLList;
        if (this.curItemXML != null) {
            otherMatches = this.curItemXML.ActivateOnEquip.(@stat == stat);
        }
        if (((!((otherMatches == null))) && ((otherMatches.length() == 1)))) {
            match = XML(otherMatches[0]);
            otherAmount = int(match.@amount);
            textColor = _0J_n._qy((amount - otherAmount));
        }
        if (amount < 0) {
            textColor = "#FF0000";
        }
        return (textColor);
    }

    private function _B_3():void {
        if (!this._I_z.hasOwnProperty("Material")) {
            this._Q_O_.push(new Restriction("Must be equipped to use", 0xB3B3B3, false));

            if (((this._bs) || ((this._J_9 == _U_c.CURRENT_PLAYER)))) {
                this._Q_O_.push(new Restriction("Double-Click to equip", 0xB3B3B3, false));
            } else {
                this._Q_O_.push(new Restriction("Double-Click to take", 0xB3B3B3, false));
            }
        }
    }

    private function _V_X_():void {
        this._Q_O_.push(new Restriction((("Press [" + Keys.KeyNames[Parameters.data_.useSpecial]) + "] in world to use"), 0xFFFFFF, false));
    }

    private function _vK_():void {
        this._Q_O_.push(new Restriction("Consumed with use", 0xB3B3B3, false));
        if (((this._bs) || ((this._J_9 == _U_c.CURRENT_PLAYER)))) {
            this._Q_O_.push(new Restriction("Double-Click or Shift-Click on item to use", 0xFFFFFF, false));
        } else {
            this._Q_O_.push(new Restriction("Double-Click to take & Shift-Click to use", 0xFFFFFF, false));
        }
    }

    private function _6C_():void {
        this._Q_O_.push(new Restriction("Can be used multiple times", 0xB3B3B3, false));
        this._Q_O_.push(new Restriction("Double-Click or Shift-Click on item to use", 0xFFFFFF, false));
    }

    private function _02u():void {
        var _local2:XML;
        var _local3:Boolean;
        var _local4:int;
        var _local5:int;
        this._Q_O_ = new Vector.<Restriction>();
        if (this._I_z.hasOwnProperty("VaultItem") && !(this._sJ_ == -1) && !(this._sJ_ == ObjectLibrary._pb["Vault Chest"])) {
            this._Q_O_.push(new Restriction("Store this item in your Vault to avoid losing it!", 16549442, true));
        }
        if (this._I_z.hasOwnProperty("Material") && !(this._sJ_ == ObjectLibrary._pb["Item Forge"])) {
            this._Q_O_.push(new Restriction("Crafting Material,\n   Look at your crafting book in your safe for more information.", 16549442, true));
        }
        if (this._I_z.hasOwnProperty("Soulbound")) {
            this._Q_O_.push(new Restriction("Soulbound", 0xB3B3B3, false));
        }
        if (this._0G_J_) {
            if (this._I_z.hasOwnProperty("Usable")) {
                this._V_X_();
                this._B_3();
            } else {
                if (this._I_z.hasOwnProperty("Consumable")) {
                    this._vK_();
                } else {
                    if (this._I_z.hasOwnProperty("InvUse")) {
                        this._6C_();
                    } else {
                        this._B_3();
                    }
                }
            }
        } else {
            if (this.player_ != null) {
                this._Q_O_.push(new Restriction(("Not usable by " + ObjectLibrary._0D_N_[this.player_.objectType_]), 16549442, true));
            }
        }
        var _local1:Vector.<String> = ObjectLibrary._7S_(this.objectType_);
        if (_local1 != null) {
            this._Q_O_.push(new Restriction(("Usable by: " + _local1.join(", ")), 0xB3B3B3, false));
        }
        for each (_local2 in this._I_z.EquipRequirement) {
            _local3 = ObjectLibrary._get(_local2, this.player_);
            if (_local2.toString() == "Stat") {
                _local4 = int(_local2.@stat);
                _local5 = int(_local2.@value);
                this._Q_O_.push(new Restriction("Requires " + StatData._W_H_(_local4) + " of " + _local5, (_local3 ? 0xB3B3B3 : 16549442), !_local3));
            }
        }
    }

    private function _V_Y_():void {
        var _local1:StyleSheet;
        if (this._Q_O_.length != 0) {
            this.line2_ = new _return((_be - 12), 0x310800);
            this.line2_.x = 8;
            this.line2_.y = this._02N_;
            addChild(this.line2_);
            _local1 = new StyleSheet();
            _local1.parseCSS(_K_z);
            this._tF_ = new SimpleText(fontSize, 0xB3B3B3, false, (_be - 4), 0, fontName);
            this._tF_.styleSheet = _local1;
            this._tF_.wordWrap = true;
            this._tF_.htmlText = (("<span class='in'>" + _N_W_(this._Q_O_)) + "</span>");
            this._tF_._08S_();
            this._tF_.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
            this._tF_.x = 4;
            this._tF_.y = (this.line2_.y + 8);
            addChild(this._tF_);
        }
    }

    private function _ev():void {
        this._C_G_ = new SimpleText(fontSize, 0xB3B3B3, false, _be, 0, fontName);
        this._C_G_.wordWrap = true;
        this._C_G_.text = String(this._I_z.Description);
        this._C_G_.updateMetrics();
        this._C_G_.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
        this._C_G_.x = 4;
        this._C_G_.y = (this._5U_.height + 2);
        addChild(this._C_G_);
    }

    private function _case_():void {
        if (this.curItemXML != null) {
            this._gE_ = this._uW_._hS_(this._I_z, this.curItemXML);
        } else {
            this._gE_ = new _R_N_();
        }
    }

    private function _41(_arg1:Vector.<Effect>):String {
        var _local4:Effect;
        var _local5:String;
        var _local2 = "";
        var _local3:Boolean = true;
        for each (_local4 in _arg1) {
            _local5 = "#FFFF8F";
            if (!_local3) {
                _local2 = (_local2 + "\n");
            } else {
                _local3 = false;
            }
            if (_local4.name_ != "") {
                _local2 = (_local2 + (_local4.name_ + ": "));
            }
            if (this._02c()) {
                _local5 = "#00ff00";
            }
            _local2 = (_local2 + (((('<font color="' + _local5) + '">') + _local4.value_) + "</font>"));
        }
        return (_local2);
    }

}
}//package ToolTips

class Effect {

    public var name_:String;
    public var value_:String;

    public function Effect(name:String, value:String) {
        this.name_ = name;
        this.value_ = value;
    }
}
class Restriction {

    public var text_:String;
    public var color_:uint;
    public var bold_:Boolean;

    public function Restriction(_arg1:String, _arg2:uint, _arg3:Boolean) {
        this.text_ = _arg1;
        this.color_ = _arg2;
        this.bold_ = _arg3;
    }
}

