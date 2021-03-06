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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// either expressed or implied, of the FreeBSD Project.// either expressed or implied, of the FreeBSD Project.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.net.PacketManager

package com.company.assembleegameclient.net {
import Achievements.BasicAchievement;

import Crafting.CraftingResultEvent;
import Crafting.LearnCraftingResultEvent;

import Frames.NotificationBox;

import Merchant.ItemSellResultEvent;

import Panels.CraftingPanel;
import Panels.TeleportPanel;

import PopUps.FirePackPopUp;
import PopUps.NewItemUnlockedScreen;

import ServerPackets.*;
import ServerPackets.AOE;
import ServerPackets.BuyResult;
import ServerPackets.Damage;
import ServerPackets.Death;
import ServerPackets.File;
import ServerPackets.Goto;
import ServerPackets.InvResult;
import ServerPackets.InvitedToGuild;
import ServerPackets.MapInfo;
import ServerPackets.NameResult;
import ServerPackets.Notification;
import ServerPackets.Pic;
import ServerPackets.ShowEffect;
import ServerPackets.Text;
import ServerPackets.Update;
import ServerPackets._0F_I_;
import ServerPackets._0F_u;
import ServerPackets._0K_U_;
import ServerPackets._0_l;
import ServerPackets._8_;
import ServerPackets._A_L_;
import ServerPackets._C_3;
import ServerPackets.FailurePacket;
import ServerPackets._I_o;
import ServerPackets._S_M_;
import ServerPackets._T_m;
import ServerPackets._T_n;
import ServerPackets._Y_F_;
import ServerPackets._Y_G_;
import ServerPackets._Z_J_;
import ServerPackets._bB_;
import ServerPackets._iD_;
import ServerPackets._ic;
import ServerPackets._qe;

import Sounds.LocalSounds;

import _015._6T_;
import _015._O_P_;

import ClientPackets.*;
import ClientPackets.BuyPacket;
import ClientPackets.CreatePacket;
import ClientPackets.RequestTeleportPacket;
import ClientPackets.UsePortalPacket;
import ClientPackets.ChangeVillageRankPacket;
import ClientPackets.AcceptTradePacket;
import ClientPackets.HelloPacket;
import ClientPackets.EditAccountListPacket;
import ClientPackets.InvDropPacket;
import ClientPackets.EscapePacket;
import ClientPackets.JoinVillagePacket;
import ClientPackets.ShootAckPacket;
import ClientPackets.PlayerShootPacket;
import ClientPackets.ChangeTradePacket;
import ClientPackets.InvSwapPacket;
import ClientPackets.RequestTradePacket;
import ClientPackets.EnemyHitPacket;
import ClientPackets.GroundDamagePacket;
import ClientPackets.PlayerHitPacket;
import ClientPackets.CreateVillagePacket;
import ClientPackets.VillageInvitePacket;
import ClientPackets.MovePacket;
import ClientPackets.CheckCreditsPacket;
import ClientPackets.AoeAckPacket;
import ClientPackets.UseItemPacket;
import ClientPackets.SquareHitPacket;
import ClientPackets.PongPacket;
import ClientPackets.OtherHitPacket;
import ClientPackets.SetConditionPacket;
import ClientPackets.GotoAckPacket;
import ClientPackets.ChooseNamePacket;
import ClientPackets.PlayerTextPacket;
import ClientPackets.LoadPacket;
import ClientPackets.VillageRemovePacket;
import ClientPackets.CancelTradePacket;

import _05R_.GTween;

import Effects.FlowEffect;
import Effects.StreamEffect;
import Effects.TeleportEffect;
import Effects.ThrowEffect;
import Effects._040;
import Effects._0H_T_;
import Effects._0I_o;
import Effects._0S_;
import Effects._9h;
import Effects._C_e;
import Effects.Effect;
import Effects._Q_s;
import Effects._l2;
import Effects._mn;
import Effects._pK_;

import _0L_C_._02d;
import _0L_C_._aZ_;

import _0M_H_._W_O_;
import _0M_H_._sN_;

import _8Q_._1l;

import _9R_._3E_;
import _9R_._D_X_;
import _9R_.VillageResultEvent;
import _9R_._j_;

import _G_A_._8P_;

import Panels.TradePanel;
import Panels.InviteGuildPanel;

import _U_5._06a;
import _U_5._zz;

import _qN_.Account;

import Sounds.UrlSoundEffects;
import Sounds.Music;

import _yY_._pz;

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.map.GameMap;
import com.company.assembleegameclient.map._pf;
import com.company.assembleegameclient.net.messages.data.ObjectStatusData;
import com.company.assembleegameclient.net.messages.data.StatData;
import com.company.assembleegameclient.net.messages.data.ObjectStatus;
import com.company.assembleegameclient.net.messages.data._iZ_;
import com.company.assembleegameclient.objects.Container;
import com.company.assembleegameclient.objects.GameObject;
import com.company.assembleegameclient.objects.NameChanger;
import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.assembleegameclient.objects.Player;
import com.company.assembleegameclient.objects.Portal;
import com.company.assembleegameclient.objects.Projectile;
import com.company.assembleegameclient.objects.SellableObject;
import com.company.assembleegameclient.objects._T_f;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.ui._B_N_;
import com.company.assembleegameclient.util.Currency;
import com.company.assembleegameclient.util._wW_;
import com.company.net.GameServer;
import com.company.net.TCPServerConnection;
import com.company.net.UDPServerConnection;
import com.company.net.Packet;
import com.company.util.PointUtil;
import com.company.util.Random;
import com.hurlant.crypto.rsa.RSAKey;
import com.hurlant.util.Base64;
import com.hurlant.util.der.PEM;

import flash.display.BitmapData;
import flash.events.ErrorEvent;
import flash.events.Event;
import flash.events.TimerEvent;
import flash.geom.Point;
import flash.net.FileReference;
import flash.utils.ByteArray;
import flash.utils.Timer;
import flash.utils.getTimer;

public class PacketManager {

    public static const FAILURE:int = 0;
    public static const CREATE_SUCCESS:int = 31;
    public static const CREATE:int = 36;
    public static const PLAYERSHOOT:int = 38;
    public static const MOVE:int = 7;
    public static const PLAYERTEXT:int = 69;
    public static const TEXT:int = 25;
    public static const _lE_:int = 13;
    public static const DAMAGE:int = 47;
    public static const UPDATE:int = 26;
    public static const _F_3:int = 11;
    public static const NOTIFICATION:int = 63;
    public static const _29:int = 62;
    public static const INVSWAP:int = 65;
    public static const USEITEM:int = 30;
    public static const _0E_H_:int = 56;
    public static const HELLO:int = 17;
    public static const GOTO:int = 52;
    public static const INVDROP:int = 35;
    public static const INVRESULT:int = 4;
    public static const RECONNECT:int = 39;
    public static const PING:int = 6;
    public static const PONG:int = 16;
    public static const MAPINFO:int = 60;
    public static const LOAD:int = 45;
    public static const PIC:int = 28;
    public static const SETCONDITION:int = 10;
    public static const REQUESTTELEPORT:int = 49;
    public static const USEPORTAL:int = 3;
    public static const DEATH:int = 41;
    public static const BUY:int = 50;
    public static const BUYRESULT:int = 27;
    public static const AOE_:int = 68;
    public static const GROUNDDAMAGE:int = 64;
    public static const PLAYERHIT:int = 24;
    public static const ENEMYHIT:int = 76;
    public static const AOEACK:int = 59;
    public static const SHOOTACK:int = 22;
    public static const OTHERHIT:int = 66;
    public static const SQUAREHIT:int = 51;
    public static const GOTOACK:int = 14;
    public static const EDITACCOUNTLIST:int = 53;
    public static const ACCOUNTLIST:int = 46;
    public static const QUESTOBJID:int = 34;
    public static const CHOOSENAME:int = 33;
    public static const NAMERESULT:int = 20;
    public static const CREATEGUILD:int = 15;
    public static const _0F_w:int = 58;
    public static const GUILDREMOVE:int = 78;
    public static const GUILDINVITE:int = 8;
    public static const ALLYSHOOT:int = 74;
    public static const _0_k:int = 19;
    public static const REQUESTTRADE:int = 21;
    public static const TRADEREQUESTED:int = 61;
    public static const TRADESTART:int = 67;
    public static const CHANGETRADE:int = 37;
    public static const TRADECHANGED:int = 23;
    public static const ACCEPTTRADE:int = 57;
    public static const CANCELTRADE:int = 1;
    public static const TRADEDONE:int = 12;
    public static const TRADEACCEPTED:int = 18;
    public static const CLIENTSTAT:int = 75;
    public static const CHECKCREDITS:int = 48;
    public static const ESCAPE:int = 42;
    public static const FILE:int = 55;
    public static const INVITEDTOGUILD:int = 77;
    public static const JOINGUILD:int = 5;
    public static const CHANGEGUILDRANK:int = 40;
    public static const PLAYSOUND:int = 44;
    public static const GLOBAL_NOTIFICATION:int = 9;
    public static const SWITCHMUSIC:int = 83;
    public static const CRAFT:int = 84;
    public static const LEARNCRAFTINGRECIPE:int = 82;
    public static const VISIBULLET:int = 80;
    public static const NOTIFICATION_BOX:int = 81;
    public static const SPRINT:int = 85;
    public static const TELEPORTREQUEST:int = 86;
    public static const WEATHERPROPERTIES:int = 87;
    public static const RESKIN:int = 88;
    public static const UNLOCK:int = 89;
    public static const GETGIFT:int = 90;
    public static const ACHIEVEMENTUNLOCKED:int = 91;
    public static const SELLITEM:int = 92;
    private static const _vb:Vector.<uint> = new <uint>[14802908, 0xFFFFFF, 0x545454];
    private static const _Z_y:Vector.<uint> = new <uint>[5644060, 16549442, 13484223];
    private static const _0A_F_:Vector.<uint> = new <uint>[2493110, 61695, 13880567];
    private static const _pS_:Vector.<uint> = new <uint>[0x3E8A00, 10944349, 13891532];

    private static var _0L_b:int = int.MIN_VALUE;//-2147483648

    public var gs_:GameSprite;
    public var server_:Server;
    public var gameId_:int;
    public var _96:Boolean;
    public var charId_:int;
    public var keyTime_:int;
    public var key_:ByteArray;
    public var _2B_:String;
    public var lastTickId_:int = -1;
    public var _0l:_17 = null;
    public var serverConn:GameServer = null;
    private var _5z:int = -1;
    private var _P_A_:Boolean = true;
    public var outstandingBuy_:_W_v = null;
    private var _7G_:Random = null;
    private var _0c:Timer;

    public function PacketManager(_arg1:GameSprite, _arg2:Server, _arg3:int, _arg4:Boolean, _arg5:int, _arg6:int, _arg7:ByteArray, _arg8:String) {
        this.gs_ = _arg1;
        this.server_ = _arg2;
        this.gameId_ = _arg3;
        this._96 = _arg4;
        this.charId_ = _arg5;
        this.keyTime_ = _arg6;
        this.key_ = _arg7;
        this._2B_ = _arg8;
        this.serverConn = _arg2.isUDP ? new TCPServerConnection(false) : new TCPServerConnection(false);
        this.serverConn.registerPacket(FAILURE, FailurePacket, this._nc);
        this.serverConn.registerPacket(CREATE_SUCCESS, _T_n, this._cw);
        this.serverConn.registerPacket(CREATE, CreatePacket, null);
        this.serverConn.registerPacket(PLAYERSHOOT, PlayerShootPacket, null);
        this.serverConn.registerPacket(MOVE, MovePacket, null);
        this.serverConn.registerPacket(PLAYERTEXT, PlayerTextPacket, null);
        this.serverConn.registerPacket(TEXT, Text, this._A_i);
        this.serverConn.registerPacket(_lE_, _T_m, this._C_i);
        this.serverConn.registerPacket(DAMAGE, Damage, this._0A_K_);
        this.serverConn.registerPacket(UPDATE, Update, this._mC_);
        this.serverConn.registerPacket(_F_3, Packet, null);
        this.serverConn.registerPacket(NOTIFICATION, Notification, this._L_x);
        this.serverConn.registerPacket(NOTIFICATION_BOX, NotificationBoxPacket, this.notificationBox);
        this.serverConn.registerPacket(GLOBAL_NOTIFICATION, _iD_, this._nG_);
        this.serverConn.registerPacket(_29, _0_l, this._02H_);
        this.serverConn.registerPacket(INVSWAP, InvSwapPacket, null);
        this.serverConn.registerPacket(USEITEM, UseItemPacket, null);
        this.serverConn.registerPacket(_0E_H_, ShowEffect, this._V_z);
        this.serverConn.registerPacket(HELLO, HelloPacket, null);
        this.serverConn.registerPacket(GOTO, Goto, this._gk);
        this.serverConn.registerPacket(INVDROP, InvDropPacket, null);
        this.serverConn.registerPacket(INVRESULT, InvResult, this._I_I_);
        this.serverConn.registerPacket(RECONNECT, _8_, this._X_3);
        this.serverConn.registerPacket(PING, _0F_I_, this._94);
        this.serverConn.registerPacket(PONG, PongPacket, null);
        this.serverConn.registerPacket(MAPINFO, MapInfo, this._ju);
        this.serverConn.registerPacket(LOAD, LoadPacket, null);
        this.serverConn.registerPacket(PIC, Pic, this._F_E_);
        this.serverConn.registerPacket(SETCONDITION, SetConditionPacket, null);
        this.serverConn.registerPacket(SPRINT, SprintPacket, null);
        this.serverConn.registerPacket(REQUESTTELEPORT, RequestTeleportPacket, null);
        this.serverConn.registerPacket(USEPORTAL, UsePortalPacket, null);
        this.serverConn.registerPacket(DEATH, Death, this._038);
        this.serverConn.registerPacket(BUY, BuyPacket, null);
        this.serverConn.registerPacket(BUYRESULT, BuyResult, this._cN_);
        this.serverConn.registerPacket(AOE_, AOE, this._06y);
        this.serverConn.registerPacket(GROUNDDAMAGE, GroundDamagePacket, null);
        this.serverConn.registerPacket(PLAYERHIT, PlayerHitPacket, null);
        this.serverConn.registerPacket(ENEMYHIT, EnemyHitPacket, null);
        this.serverConn.registerPacket(AOEACK, AoeAckPacket, null);
        this.serverConn.registerPacket(SHOOTACK, ShootAckPacket, null);
        this.serverConn.registerPacket(OTHERHIT, OtherHitPacket, null);
        this.serverConn.registerPacket(SQUAREHIT, SquareHitPacket, null);
        this.serverConn.registerPacket(GOTOACK, GotoAckPacket, null);
        this.serverConn.registerPacket(EDITACCOUNTLIST, EditAccountListPacket, null);
        this.serverConn.registerPacket(ACCOUNTLIST, _0K_U_, this._0J_R_);
        this.serverConn.registerPacket(QUESTOBJID, _Y_F_, this._fF_);
        this.serverConn.registerPacket(CHOOSENAME, ChooseNamePacket, null);
        this.serverConn.registerPacket(NAMERESULT, NameResult, this._0D_s);
        this.serverConn.registerPacket(CREATEGUILD, CreateVillagePacket, null);
        this.serverConn.registerPacket(_0F_w, _ic, this._Z_g);
        this.serverConn.registerPacket(GUILDREMOVE, VillageRemovePacket, null);
        this.serverConn.registerPacket(GUILDINVITE, VillageInvitePacket, null);
        this.serverConn.registerPacket(ALLYSHOOT, _I_o, this._P_F_);
        this.serverConn.registerPacket(_0_k, _C_3, this._0K_7);
        this.serverConn.registerPacket(REQUESTTRADE, RequestTradePacket, null);
        this.serverConn.registerPacket(TRADEREQUESTED, _Y_G_, this._G_r);
        this.serverConn.registerPacket(TRADESTART, _S_M_, this._47);
        this.serverConn.registerPacket(CHANGETRADE, ChangeTradePacket, null);
        this.serverConn.registerPacket(TRADECHANGED, _Z_J_, this._0D_U_);
        this.serverConn.registerPacket(ACCEPTTRADE, AcceptTradePacket, null);
        this.serverConn.registerPacket(CANCELTRADE, CancelTradePacket, null);
        this.serverConn.registerPacket(TRADEDONE, _A_L_, this._2d);
        this.serverConn.registerPacket(TRADEACCEPTED, _qe, this._087);
        this.serverConn.registerPacket(CLIENTSTAT, _0F_u, this._oA_);
        this.serverConn.registerPacket(CHECKCREDITS, CheckCreditsPacket, null);
        this.serverConn.registerPacket(ESCAPE, EscapePacket, null);
        this.serverConn.registerPacket(FILE, File, this._J_0);
        this.serverConn.registerPacket(INVITEDTOGUILD, InvitedToGuild, this._cS_);
        this.serverConn.registerPacket(JOINGUILD, JoinVillagePacket, null);
        this.serverConn.registerPacket(CHANGEGUILDRANK, ChangeVillageRankPacket, null);
        this.serverConn.registerPacket(PLAYSOUND, _bB_, this._A_C_);
        this.serverConn.registerPacket(CRAFT, CraftPacket, null);
        this.serverConn.registerPacket(VISIBULLET, Visibullet, null);
        this.serverConn.registerPacket(SWITCHMUSIC, SwitchMusic, this.switchMusic);
        this.serverConn.registerPacket(TELEPORTREQUEST, TeleportRequest, this.teleportRequested);
        this.serverConn.registerPacket(WEATHERPROPERTIES, WeatherPropertiesPacket, this.weatherProps);
        this.serverConn.registerPacket(LEARNCRAFTINGRECIPE, LearnCraftingRecipe, null);
        this.serverConn.registerPacket(RESKIN, ReskinPacket, null);
        this.serverConn.registerPacket(UNLOCK, UnlockedPacket, this.unlockedSomething);
        this.serverConn.registerPacket(GETGIFT, GetGiftPacket, null);
        this.serverConn.registerPacket(ACHIEVEMENTUNLOCKED, AchievementUnlockedPacket, this.onAchievementUnlock);
        this.serverConn.registerPacket(SELLITEM, SellItemPacket, null);
        this.serverConn.addEventListener(Event.CONNECT, this._ux);
        this.serverConn.addEventListener(Event.CLOSE, this._of);
        this.serverConn.addEventListener(ErrorEvent.ERROR, this.onError);
    }

    public function connect():void {
        this.gs_.textBox_.addText(Parameters.SendClient, ("Connecting to " + this.server_.name_));
        this.serverConn.connect(this.server_.host_, this.server_.port_);
    }

    public function getNextDamage(_arg1:uint, _arg2:uint):uint {
        return (this._7G_.next(_arg1, _arg2));
    }

    public function _9G_():void {
        if (this._0l == null) {
            this._0l = new _17();
        }
    }

    public function _rT_():void {
        if (this._0l != null) {
            this._0l = null;
        }
    }

    private function _sM_():void {
        _zz.instance.dispatch();
    }

    private function create():void {
        var _local1:CreatePacket = (this.serverConn.createPacketFromID(CREATE) as CreatePacket);
        _local1.objectType_ = Parameters.data_.playerObjectType;
        this.serverConn.sendPacket(_local1);
    }

    private function load():void {
        var _local1:LoadPacket = (this.serverConn.createPacketFromID(LOAD) as LoadPacket);
        _local1.skinId_ = this.charId_;
        this.serverConn.sendPacket(_local1);
    }

    public function playerShoot(_arg1:int, _arg2:Projectile):void {
        var _local3:PlayerShootPacket = (this.serverConn.createPacketFromID(PLAYERSHOOT) as PlayerShootPacket);
        _local3.time_ = _arg1;
        _local3.bulletId_ = _arg2.bulletId_;
        _local3.containerType_ = _arg2.containerType_;
        _local3.startingPos_.x_ = _arg2.x_;
        _local3.startingPos_.y_ = _arg2.y_;
        _local3.angle_ = _arg2.angle_;
        this.serverConn.sendPacket(_local3);
    }

    public function playerHit(_arg1:int, _arg2:int):void {
        var _local3:PlayerHitPacket = (this.serverConn.createPacketFromID(PLAYERHIT) as PlayerHitPacket);
        _local3.bulletId_ = _arg1;
        _local3.objectId_ = _arg2;
        this.serverConn.sendPacket(_local3);
    }

    public function reskin(_arg1:int):void {
        var rs:ReskinPacket = (this.serverConn.createPacketFromID(RESKIN) as ReskinPacket);
        rs.skinId = _arg1;
        this.serverConn.sendPacket(rs);
    }

    public function enemyHit(_arg1:int, _arg2:int, _arg3:int, _arg4:Boolean):void {
        var _local5:EnemyHitPacket = (this.serverConn.createPacketFromID(ENEMYHIT) as EnemyHitPacket);
        _local5.time_ = _arg1;
        _local5.bulletId_ = _arg2;
        _local5.targetId_ = _arg3;
        _local5.kill_ = _arg4;
        this.serverConn.sendPacket(_local5);
    }

    public function otherHit(_arg1:int, _arg2:int, _arg3:int, _arg4:int):void {
        var _local5:OtherHitPacket = (this.serverConn.createPacketFromID(OTHERHIT) as OtherHitPacket);
        _local5.time_ = _arg1;
        _local5.bulletId_ = _arg2;
        _local5.objectId_ = _arg3;
        _local5.targetId_ = _arg4;
        this.serverConn.sendPacket(_local5);
    }

    public function squareHit(_arg1:int, _arg2:int, _arg3:int):void {
        var _local4:SquareHitPacket = (this.serverConn.createPacketFromID(SQUAREHIT) as SquareHitPacket);
        _local4.time_ = _arg1;
        _local4.bulletId_ = _arg2;
        _local4.objectId_ = _arg3;
        this.serverConn.sendPacket(_local4);
    }

    public function _H_q(_arg1:int, _arg2:Number, _arg3:Number):void {
        var _local4:AoeAckPacket = (this.serverConn.createPacketFromID(AOEACK) as AoeAckPacket);
        _local4.time_ = _arg1;
        _local4.position_.x_ = _arg2;
        _local4.position_.y_ = _arg3;
        this.serverConn.sendPacket(_local4);
    }

    public function groundDamage(_arg1:int, _arg2:Number, _arg3:Number):void {
        var _local4:GroundDamagePacket = (this.serverConn.createPacketFromID(GROUNDDAMAGE) as GroundDamagePacket);
        _local4.time_ = _arg1;
        _local4.position_.x_ = _arg2;
        _local4.position_.y_ = _arg3;
        this.serverConn.sendPacket(_local4);
    }

    public function _eC_(_arg1:int):void {
        var _local2:ShootAckPacket = (this.serverConn.createPacketFromID(SHOOTACK) as ShootAckPacket);
        _local2.time_ = _arg1;
        this.serverConn.sendPacket(_local2);
    }

    public function playerText(_arg1:String):void {
        var _local2:PlayerTextPacket = (this.serverConn.createPacketFromID(PLAYERTEXT) as PlayerTextPacket);
        _local2.text_ = _arg1;
        this.serverConn.sendPacket(_local2);
    }

    public function _P_a(_arg1:int, _arg2:Number, _arg3:Number, _arg4:int, _arg5:int, _arg6:int, _arg7:int, _arg8:int, _arg9:int):void {
        var _local10:InvSwapPacket = (this.serverConn.createPacketFromID(INVSWAP) as InvSwapPacket);
        _local10.time_ = _arg1;
        _local10.position_.x_ = _arg2;
        _local10.position_.y_ = _arg3;
        _local10.slotObject1_.objectId_ = _arg4;
        _local10.slotObject1_.slotId_ = _arg5;
        _local10.slotObject1_.objectType_ = _arg6;
        _local10.slotObject2_.objectId_ = _arg7;
        _local10.slotObject2_.slotId_ = _arg8;
        _local10.slotObject2_.objectType_ = _arg9;
        this.serverConn.sendPacket(_local10);
    }

    public function _8q(_arg1:int, _arg2:int, _arg3:int):void {
        var _local4:InvDropPacket = (this.serverConn.createPacketFromID(INVDROP) as InvDropPacket);
        _local4.slotObject_.objectId_ = _arg1;
        _local4.slotObject_.slotId_ = _arg2;
        _local4.slotObject_.objectType_ = _arg3;
        this.serverConn.sendPacket(_local4);
    }

    public function useItem(_arg1:int, _arg2:int, _arg3:int, _arg4:int, _arg5:Number, _arg6:Number):void {
        var _local7:UseItemPacket = (this.serverConn.createPacketFromID(USEITEM) as UseItemPacket);
        _local7.time_ = _arg1;
        _local7.slotObject_.objectId_ = _arg2;
        _local7.slotObject_.slotId_ = _arg3;
        _local7.slotObject_.objectType_ = _arg4;
        _local7.itemUsePos_.x_ = _arg5;
        _local7.itemUsePos_.y_ = _arg6;
        this.serverConn.sendPacket(_local7);
    }

    public function sprintStart(_arg1:Boolean):void {
        var _local1:SprintPacket = (this.serverConn.createPacketFromID(SPRINT) as SprintPacket);
        _local1.sprintStart = _arg1;
        this.serverConn.sendPacket(_local1);
    }

    public function learnCraftingRecipe(_arg1:int, _arg2:int, _arg3:int):void {
        var _local1:LearnCraftingRecipe = (this.serverConn.createPacketFromID(LEARNCRAFTINGRECIPE) as LearnCraftingRecipe);
        _local1._itemId = _arg1;
        _local1._slotId = _arg2;
        _local1._recipeId = _arg3;
        this.serverConn.sendPacket(_local1);
    }

    public function _6v(_arg1:uint, _arg2:Number):void {
        var _local3:SetConditionPacket = (this.serverConn.createPacketFromID(SETCONDITION) as SetConditionPacket);
        _local3.conditionEffect_ = _arg1;
        _local3.conditionDuration_ = _arg2;
        this.serverConn.sendPacket(_local3);
    }

    public function getGift(itemId:int, del:Boolean):void {
        var pkt:GetGiftPacket = this.serverConn.createPacketFromID(GETGIFT) as GetGiftPacket;
        pkt.itemId = itemId;
        pkt.del = del;
        this.serverConn.sendPacket(pkt);
    }

    public function move(_arg1:int, _arg2:Player):void {
        var _local7:int;
        var _local8:int;
        var _local3:Number = -1;
        var _local4:Number = -1;
        if (((!((_arg2 == null))) && (!(_arg2.isPaused())))) {
            _local3 = _arg2.x_;
            _local4 = _arg2.y_;
        }
        var _local5:MovePacket = (this.serverConn.createPacketFromID(MOVE) as MovePacket);
        _local5.tickId_ = _arg1;
        _local5.time_ = this.gs_.lastUpdate_;
        _local5.newPosition_.x_ = _local3;
        _local5.newPosition_.y_ = _local4;
        var _local6:int = this.gs_.moveRecords_.lastClearTime_;
        _local5.records_.length = 0;
        if ((((_local6 >= 0)) && (((_local5.time_ - _local6) > 125)))) {
            _local7 = Math.min(10, this.gs_.moveRecords_.records_.length);
            _local8 = 0;
            while (_local8 < _local7) {
                if (this.gs_.moveRecords_.records_[_local8].time_ >= (_local5.time_ - 25)) break;
                _local5.records_.push(this.gs_.moveRecords_.records_[_local8]);
                _local8++;
            }
        }
        this.gs_.moveRecords_.clear(_local5.time_);
        this.serverConn.sendPacket(_local5);
        _arg2._01w();
    }

    public function teleportRequest(_arg1:int):void {
        var _local2:RequestTeleportPacket = (this.serverConn.createPacketFromID(REQUESTTELEPORT) as RequestTeleportPacket);
        _local2.objectId_ = _arg1;
        this.serverConn.sendPacket(_local2);
    }

    public function usePortal(_arg1:int):void {
        var _local2:UsePortalPacket = (this.serverConn.createPacketFromID(USEPORTAL) as UsePortalPacket);
        _local2.objectId_ = _arg1;
        this.serverConn.sendPacket(_local2);
    }

    public function buy(_arg1:int):void {
        if (this.outstandingBuy_ != null) {
            return;
        }
        var _local2:SellableObject = this.gs_.map_.goDict_[_arg1];
        if (_local2 == null) {
            return;
        }
        var _local3:Boolean;
        if (_local2.currency_ == Currency.GOLD) {
            _local3 = ((((this.gs_.charList_.converted_) || ((this.gs_.map_.player_.credits_ > 100)))) || ((_local2.price_ > this.gs_.map_.player_.credits_)));
        }
        this.outstandingBuy_ = new _W_v(_local2.soldObjectInternalName(), _local2.price_, _local2.currency_, _local3);
        var _local4:BuyPacket = (this.serverConn.createPacketFromID(BUY) as BuyPacket);
        _local4.objectId_ = _arg1;
        this.serverConn.sendPacket(_local4);
    }

    public function _S__(_arg1:int):void {
        var _local2:GotoAckPacket = (this.serverConn.createPacketFromID(GOTOACK) as GotoAckPacket);
        _local2.time_ = _arg1;
        this.serverConn.sendPacket(_local2);
    }

    public function _eH_(_arg1:int, _arg2:Boolean, _arg3:int):void {
        var _local4:EditAccountListPacket = (this.serverConn.createPacketFromID(EDITACCOUNTLIST) as EditAccountListPacket);
        _local4.accountListId_ = _arg1;
        _local4.add_ = _arg2;
        _local4.objectId_ = _arg3;
        this.serverConn.sendPacket(_local4);
    }

    public function _K_Q_(_arg1:String):void {
        var _local2:ChooseNamePacket = (this.serverConn.createPacketFromID(CHOOSENAME) as ChooseNamePacket);
        _local2.name_ = _arg1;
        this.serverConn.sendPacket(_local2);
    }

    public function createVillage(_arg1:String):void {
        var _local2:CreateVillagePacket = (this.serverConn.createPacketFromID(CREATEGUILD) as CreateVillagePacket);
        _local2.name_ = _arg1;
        this.serverConn.sendPacket(_local2);
    }

    public function guildRemove(_arg1:String):void {
        var _local2:VillageRemovePacket = (this.serverConn.createPacketFromID(GUILDREMOVE) as VillageRemovePacket);
        _local2.name_ = _arg1;
        this.serverConn.sendPacket(_local2);
    }

    public function _H_X_(_arg1:String):void {
        var _local2:VillageInvitePacket = (this.serverConn.createPacketFromID(GUILDINVITE) as VillageInvitePacket);
        _local2.name_ = _arg1;
        this.serverConn.sendPacket(_local2);
    }

    public function requestTrade(_arg1:String):void {
        var _local2:RequestTradePacket = (this.serverConn.createPacketFromID(REQUESTTRADE) as RequestTradePacket);
        _local2.name_ = _arg1;
        this.serverConn.sendPacket(_local2);
    }

    public function _rQ_(_arg1:Vector.<Boolean>):void {
        var _local2:ChangeTradePacket = (this.serverConn.createPacketFromID(CHANGETRADE) as ChangeTradePacket);
        _local2.offer_ = _arg1;
        this.serverConn.sendPacket(_local2);
    }

    public function _E_i(_arg1:Vector.<Boolean>, _arg2:Vector.<Boolean>):void {
        var _local3:AcceptTradePacket = (this.serverConn.createPacketFromID(ACCEPTTRADE) as AcceptTradePacket);
        _local3.myOffer_ = _arg1;
        _local3.yourOffer_ = _arg2;
        this.serverConn.sendPacket(_local3);
    }

    public function __set():void {
        this.serverConn.sendPacket(this.serverConn.createPacketFromID(CANCELTRADE));
    }

    public function _0J_l():void {
        this.serverConn.sendPacket(this.serverConn.createPacketFromID(CHECKCREDITS));
    }

    public function _M_6():void {
        if (this._5z == -1) {
            return;
        }
        this.serverConn.sendPacket(this.serverConn.createPacketFromID(ESCAPE));
    }

    public function joinGuild(_arg1:String):void {
        var _local2:JoinVillagePacket = (this.serverConn.createPacketFromID(JOINGUILD) as JoinVillagePacket);
        _local2.guildName_ = _arg1;
        this.serverConn.sendPacket(_local2);
    }

    public function _k8(_arg1:String, _arg2:int):void {
        var _local3:ChangeVillageRankPacket = (this.serverConn.createPacketFromID(CHANGEGUILDRANK) as ChangeVillageRankPacket);
        _local3.name_ = _arg1;
        _local3.guildRank_ = _arg2;
        this.serverConn.sendPacket(_local3);
    }

    public function sellItem(slotId:int):void {
        var packet:SellItemPacket = (this.serverConn.createPacketFromID(SELLITEM) as SellItemPacket);
        packet.slotId = slotId;
        this.serverConn.sendPacket(packet);
    }

    private function _J_X_(_arg1:String):String {
        var _local2:RSAKey = PEM.readRSAPublicKey(Parameters.RSAKey);
        var _local3:ByteArray = new ByteArray();
        _local3.writeUTFBytes(_arg1);
        var _local4:ByteArray = new ByteArray();
        _local2.encrypt(_local3, _local4, _local3.length);
        return (Base64.encodeByteArray(_local4));
    }

    private function _ux(_arg1:Event):void {
        this.gs_.textBox_.addText(Parameters.SendClient, "Connected!");
        var _local2:HelloPacket = (this.serverConn.createPacketFromID(HELLO) as HelloPacket);
        _local2.Copyright = Parameters.COPYRIGHT;
        _local2.buildVersion_ = Parameters.clientVersion;
        _local2.gameId_ = this.gameId_;
        _local2.guid_ = this._J_X_(Account._get().guid());
        _local2.password_ = this._J_X_(Account._get().password());
        _local2.secret_ = this._J_X_(Account._get().secret());
        _local2.keyTime_ = this.keyTime_;
        _local2.key_.length = 0;
        if (this.key_ != null) {
            _local2.key_.writeBytes(this.key_);
        }
        _local2.mapInfo = (((this._2B_ == null)) ? "" : this._2B_);
        _local2.entrytag = Account._get().entrytag();
        _local2.gameNetwork = Account._get().gameNetwork();
        _local2.gameNetworkUserId = Account._get().gameNetworkUserId();
        _local2.playPlatform = Account._get().playPlatform();
        this.serverConn.sendPacket(_local2);
    }

    private function _cw(_arg1:_T_n):void {
        this._5z = _arg1.objectId_;
        this.charId_ = _arg1.charId_;
        this.gs_.initialize();
        this._96 = false;
    }

    private function _0A_K_(_arg1:Damage):void {
        var _local5:int;
        var _local2:GameMap = this.gs_.map_;
        var _local3:Projectile;
        if ((((_arg1.objectId_ >= 0)) && ((_arg1.bulletId_ > 0)))) {
            _local5 = Projectile._61(_arg1.objectId_, _arg1.bulletId_);
            _local3 = (_local2._cl[_local5] as Projectile);
            if (((!((_local3 == null))) && (!(_local3._ko._0C_c)))) {
                _local2.removeObj(_local5);
            }
        }
        var _local4:GameObject = _local2.goDict_[_arg1.targetId_];
        if (_local4 != null) {
            _local4.damage(-1, _arg1.damageAmount_, _arg1.effects_, _arg1.kill_, _local3);
        }
    }

    private function _C_i(_arg1:_T_m):void {
        var _local2 = (_arg1.ownerId_ == this._5z);
        var _local3:GameObject = this.gs_.map_.goDict_[_arg1.ownerId_];
        if ((((_local3 == null)) || (_local3._aE_))) {
            if (_local2) {
                this._eC_(-1);
            }
            return;
        }
        var _local4:Projectile = (_wW_._B_1(Projectile) as Projectile);
        _local4.reset(_arg1.containerType_, 0, _arg1.ownerId_, _arg1.bulletId_, _arg1.angle_, this.gs_.lastUpdate_);
        _local4._T_j(_arg1.damage_);
        this.gs_.map_.addObj(_local4, _arg1.startingPos_.x_, _arg1.startingPos_.y_);
        if (_local2) {
            this._eC_(this.gs_.lastUpdate_);
        }
    }

    private function _P_F_(_arg1:_I_o):void {
        var _local2:GameObject = this.gs_.map_.goDict_[_arg1.ownerId_];
        if ((((_local2 == null)) || (_local2._aE_))) {
            return;
        }
        var _local3:Projectile = (_wW_._B_1(Projectile) as Projectile);
        _local3.reset(_arg1.containerType_, 0, _arg1.ownerId_, _arg1.bulletId_, _arg1.angle_, this.gs_.lastUpdate_);
        _local3._T_j(_arg1.dmg_);
        this.gs_.map_.addObj(_local3, _local2.x_, _local2.y_);
        var xml = ObjectLibrary.Items[_arg1.containerType_];
        if (Parameters.data_.playAllyShootSound && xml.hasOwnProperty("OldSound")) {
            var dist:Number = Math.floor(PointUtil._bm(this.gs_.map_.player_.x_, this.gs_.map_.player_.y_, _local2.x_, _local2.y_)) - 1000;
            UrlSoundEffects.play(xml.OldSound, dist * (-0.001), true, true);
        }
        _local2.setAttack(_arg1.containerType_, _arg1.angle_);
    }

    private function _0K_7(_arg1:_C_3):void {
        var _local4:Projectile;
        var _local5:Number;
        var _local2:GameObject = this.gs_.map_.goDict_[_arg1.ownerId_];
        if ((((_local2 == null)) || (_local2._aE_))) {
            this._eC_(-1);
            return;
        }
        var _local3:int;
        while (_local3 < _arg1.numShots_) {
            _local4 = (_wW_._B_1(Projectile) as Projectile);
            _local5 = (_arg1.angle_ + (_arg1.angleInc_ * _local3));
            _local4.reset(_local2.objectType_, _arg1.bulletType_, _arg1.ownerId_, ((_arg1.bulletId_ + _local3) % 0x0100), _local5, this.gs_.lastUpdate_);
            _local4._T_j(_arg1.damage_);
            this.gs_.map_.addObj(_local4, _arg1.startingPos_.x_, _arg1.startingPos_.y_);
            _local3++;
        }
        this._eC_(this.gs_.lastUpdate_);
        _local2.setAttack(_local2.objectType_, (_arg1.angle_ + (_arg1.angleInc_ * ((_arg1.numShots_ - 1) / 2))));
    }

    private function weatherProps(_arg1:WeatherPropertiesPacket):void {
        if (this.gs_.map_.weatherBackground_ == null) {
            this.gs_.map_.changeWeather(_arg1._weather);
        }
        switch (_arg1._type) {
            case WeatherPropertiesPacket.ADD_PARTICLES:
                if (this.gs_.map_.weatherBackground_ != null) {
                    var _local1:GTween = new GTween(this.gs_.map_.weatherBackground_, 5, {"particlesAmount": _arg1._particles});
                }
                break;
            case WeatherPropertiesPacket.REMOVE_PARTICLES:
                if (this.gs_.map_.weatherBackground_ != null) {
                    var _local1:GTween = new GTween(this.gs_.map_.weatherBackground_, 5, {"particlesAmount": -(_arg1._particles)});
                }
                break;
            case WeatherPropertiesPacket.CHANGE_WEATHER:
                this.gs_.map_.changeWeather(_arg1._weather);
                break;
            case WeatherPropertiesPacket.PARTICLE_DIRECTION:
                //Todo: Implement this (too lazy atm) :3
                break;
            case WeatherPropertiesPacket.WIND_SPEED:
                gs_.map_.weatherBackground_.changeWind(_arg1._windSpeed[0], _arg1._windSpeed[1]);
                break;
        }

        if (_arg1._atmosphere != "") {
            gs_.map_.atmosphere_.switchTo(_arg1._atmosphere, _arg1._currentTime);
        }
    }

    private function teleportRequested(_arg1:TeleportRequest):void {
        if (Parameters.data_.showTeleportRequest) {
            this.gs_.sideUI._U_T_._j(new TeleportPanel(this.gs_, _arg1));
        }
        this.gs_.textBox_.addText("", ((((_arg1.name_ + " wants to ") + 'teleport to you.  Type "/teleport ') + _arg1.name_) + '" to accept.'));
    }

    private function _G_r(_arg1:_Y_G_):void {
        if (Parameters.data_.showTradePopup) {
            this.gs_.sideUI._U_T_._j(new TradePanel(this.gs_, _arg1.name_));
        }
        this.gs_.textBox_.addText("", ((((_arg1.name_ + " wants to ") + 'trade with you.  Type "/trade ') + _arg1.name_) + '" to trade.'));
    }

    private function _47(_arg1:_S_M_):void {
        this.gs_.sideUI._0L_v(_arg1);
    }

    private function _0D_U_(_arg1:_Z_J_):void {
        this.gs_.sideUI._ss(_arg1);
    }

    private function _2d(_arg1:_A_L_):void {
        this.gs_.sideUI._A_a();
        this.gs_.textBox_.addText("", _arg1.description_);
    }

    private function _087(_arg1:_qe):void {
        this.gs_.sideUI._mH_(_arg1);
    }

    private function _lu(_arg1:ObjectStatus):void {
        var _local2:GameMap = this.gs_.map_;
        var _local3:GameObject = ObjectLibrary._075(_arg1.objectType_);
        if (_local3 == null) {
            return;
        }
        var _local4:ObjectStatusData = _arg1.stats;
        _local3.setObjectId(_local4.objectId_);
        _local2.addObj(_local3, _local4.pos_.x_, _local4.pos_.y_);
        if (_local3.objectId_ == this._5z) {
            _local2.player_ = (_local3 as Player);
        }
        this._9s(_local4, 0, -1);
        if (((((_local3.props_.static_) && (_local3.props_.occupySquare_))) && (!(_local3.props_._ia)))) {
            this.gs_.sideUI._F_._0A_R_(_local3.x_, _local3.y_, _local3);
        }
    }

    private function _mC_(_arg1:Update):void {
        var _local3:int;
        var _local4:_iZ_;
        var _local2:Packet = this.serverConn.createPacketFromID(_F_3);
        this.serverConn.sendPacket(_local2);
        _local3 = 0;
        while (_local3 < _arg1.tiles_.length) {
            _local4 = _arg1.tiles_[_local3];
            this.gs_.map_.setGroundTile(_local4.x_, _local4.y_, _local4.type_);
            this.gs_.sideUI._F_.setGroundTile(_local4.x_, _local4.y_, _local4.type_);
            _local3++;
        }
        _local3 = 0;
        while (_local3 < _arg1.newObjs_.length) {
            this._lu(_arg1.newObjs_[_local3]);
            _local3++;
        }
        _local3 = 0;
        while (_local3 < _arg1.drops_.length) {
            this.gs_.map_.removeObj(_arg1.drops_[_local3]);
            _local3++;
        }
    }

    private function notificationBox(_arg1:NotificationBoxPacket):void {
        this.gs_.addChild(new NotificationBox(_arg1, this.gs_));
    }

    private function _L_x(_arg1:Notification):void {
        var _local2:GameObject = this.gs_.map_.goDict_[_arg1.objectId_];
        if (_local2 != null) {
            this.gs_.map_.mapOverlay_.addChild(new _O_P_(_local2, _arg1.text_, _arg1.color_, 2000));
            if ((((_local2 == this.gs_.map_.player_)) && ((_arg1.text_ == "Quest Complete!")))) {
                this.gs_.map_.quest_.completed();
            }
        }
    }

    private function _nG_(_arg1:_iD_):void {
        switch (_arg1.text) {
            case "yellow":
                _sN_.instance.dispatch(_1l._0v);
                return;
            case "red":
                _sN_.instance.dispatch(_1l._05c);
                return;
            case "green":
                _sN_.instance.dispatch(_1l._h2);
                return;
            case "purple":
                _sN_.instance.dispatch(_1l._M_C_);
                return;
            case "showKeyUI":
                _W_O_.instance.dispatch();
                return;
            case "beginnersPackage":
                return;
        }
    }

    private function _02H_(_arg1:_0_l):void {
        var _local3:ObjectStatusData;
        if (this._0l != null) {
            this._0l._06m();
        }
        this.gs_.map_.atmosphere_.tick(_arg1.dateTime_);
        var _local2:GameMap = this.gs_.map_;
        this.move(_arg1.tickId_, _local2.player_);
        for each (_local3 in _arg1.statuses_) {
            this._9s(_local3, _arg1.tickTime_, _arg1.tickId_);
        }
        this.lastTickId_ = _arg1.tickId_;
    }

    private function _V_z(_arg1:ShowEffect):void {
        var _local3:GameObject;
        var _local4:Effect;
        var _local5:Point;
        var _local6:Point;
        var _local2:GameMap = this.gs_.map_;
        switch (_arg1.effectType_) {
            case ShowEffect._x0:
                _local3 = _local2.goDict_[_arg1.targetObjectId_];
                if (_local3 == null) break;
                _local2.addObj(new _0H_T_(_local3, _arg1.color_), _local3.x_, _local3.y_);
                return;
            case ShowEffect._0A_T_:
                _local2.addObj(new TeleportEffect(), _arg1.pos1_.x_, _arg1.pos1_.y_);
                return;
            case ShowEffect._04t:
                _local4 = new StreamEffect(_arg1.pos1_, _arg1.pos2_, _arg1.color_);
                _local2.addObj(_local4, _arg1.pos1_.x_, _arg1.pos1_.y_);
                return;
            case ShowEffect._hn:
                _local3 = _local2.goDict_[_arg1.targetObjectId_];
                _local5 = (((_local3) != null) ? new Point(_local3.x_, _local3.y_) : _arg1.pos2_._6g());
                _local4 = new ThrowEffect(_local5, _arg1.pos1_._6g(), _arg1.color_);
                _local2.addObj(_local4, _local5.x, _local5.y);
                return;
            case ShowEffect._e8:
                _local3 = _local2.goDict_[_arg1.targetObjectId_];
                if (_local3 == null) break;
                _local4 = new _Q_s(_local3, _arg1.pos1_.x_, _arg1.color_);
                _local2.addObj(_local4, _local3.x_, _local3.y_);
                return;
            case ShowEffect._X_k:
                _local3 = _local2.goDict_[_arg1.targetObjectId_];
                if (_local3 == null) break;
                _local4 = new _l2(_local3, _arg1.color_);
                _local2.addObj(_local4, _local3.x_, _local3.y_);
                return;
            case ShowEffect._4C_:
                _local3 = _local2.goDict_[_arg1.targetObjectId_];
                if (_local3 == null) break;
                _local4 = new _0I_o(_local3, _arg1.pos1_, _arg1.color_);
                _local2.addObj(_local4, _arg1.pos1_.x_, _arg1.pos1_.y_);
                return;
            case ShowEffect._each_:
                _local3 = _local2.goDict_[_arg1.targetObjectId_];
                if (_local3 == null) break;
                _local4 = new _C_e(_local3, _arg1.pos1_, _arg1.pos2_, _arg1.color_);
                _local2.addObj(_local4, _arg1.pos1_.x_, _arg1.pos1_.y_);
                return;
            case ShowEffect._ow:
                _local3 = _local2.goDict_[_arg1.targetObjectId_];
                if (_local3 == null) break;
                _local4 = new FlowEffect(_arg1.pos1_, _local3, _arg1.color_);
                _local2.addObj(_local4, _arg1.pos1_.x_, _arg1.pos1_.y_);
                return;
            case ShowEffect._010:
                _local3 = _local2.goDict_[_arg1.targetObjectId_];
                if (_local3 == null) break;
                _local4 = new _040(_local3, _arg1.pos1_.x_, _arg1.color_);
                _local2.addObj(_local4, _local3.x_, _local3.y_);
                return;
            case ShowEffect._eY_:
                _local3 = _local2.goDict_[_arg1.targetObjectId_];
                if (_local3 == null) break;
                _local4 = new _9h(_local3, _arg1.pos1_, _arg1.color_, _arg1.pos2_.x_);
                _local2.addObj(_local4, _local3.x_, _local3.y_);
                return;
            case ShowEffect._dP_:
                _local3 = _local2.goDict_[_arg1.targetObjectId_];
                if (_local3 == null) break;
                _local4 = new _0S_(_local3, _arg1.pos1_, _arg1.pos2_, _arg1.color_);
                _local2.addObj(_local4, _arg1.pos1_.x_, _arg1.pos1_.y_);
                return;
            case ShowEffect._L_3:
                _local3 = _local2.goDict_[_arg1.targetObjectId_];
                if (_local3 == null) break;
                _local4 = new _mn(_local3, _arg1.pos1_, _arg1.pos2_.x_, _arg1.color_);
                _local2.addObj(_local4, _local3.x_, _local3.y_);
                return;
            case ShowEffect._Z_u:
                this.gs_._on._uE_();
                return;
            case ShowEffect._0_1:
                _local3 = _local2.goDict_[_arg1.targetObjectId_];
                if (_local3 == null) break;
                _local3._B_t = new _T_f(getTimer(), _arg1.color_, _arg1.pos1_.x_, _arg1.pos1_.y_);
                return;
            case ShowEffect._g8:
                _local5 = _arg1.pos1_._6g();
                _local6 = _arg1.pos2_._6g();
                _local4 = new _pz(_arg1.pos2_._6g(), _arg1.pos1_._6g());
                _local2.addObj(_local4, _local5.x, _local5.y);
                return;
        }
    }

    private function _gk(_arg1:Goto):void {
        this._S__(this.gs_.lastUpdate_);
        var _local2:GameObject = this.gs_.map_.goDict_[_arg1.objectId_];
        if (_local2 == null) {
            return;
        }
        _local2._gk(_arg1.pos_.x_, _arg1.pos_.y_, this.gs_.lastUpdate_);
    }

    private function _066(_arg1:GameObject, _arg2:Vector.<StatData>, _arg3:Boolean):void {
        var _local4:StatData;
        for each (_local4 in _arg2) {
            switch (_local4._0F_4) {
                case StatData._0I_1:
                    _arg1.maxHP_ = _local4._h;
                    break;
                case StatData._V_A_:
                    _arg1.HP_ = _local4._h;
                    break;
                case StatData._g0:
                    _arg1.size_ = _local4._h;
                    break;
                case StatData.MAX_HUNGER:
                    (_arg1 as Player).maxMP_ = _local4._h;
                    break;
                case StatData.HUNGER:
                    (_arg1 as Player).MP_ = _local4._h;
                    break;
                case StatData._K_P_:
                    (_arg1 as Player)._7V_ = _local4._h;
                    break;
                case StatData._0_8:
                    (_arg1 as Player).exp_ = _local4._h;
                    break;
                case StatData._70:
                    _arg1.level_ = _local4._h;
                    break;
                case StatData._0R_:
                    (_arg1 as Player).attack_ = _local4._h;
                    break;
                case StatData._sw:
                    _arg1.defense_ = _local4._h;
                    break;
                case StatData._00l:
                    (_arg1 as Player).speed_ = _local4._h;
                    break;
                case StatData._0J_z:
                    (_arg1 as Player).dexterity_ = _local4._h;
                    break;
                case StatData._S_2:
                    (_arg1 as Player).vitality_ = _local4._h;
                    break;
                case StatData._0G_F_:
                    (_arg1 as Player).wisdom_ = _local4._h;
                    break;
                case StatData._x_:
                    _arg1._9B_ = _local4._h;
                    break;
                case StatData.INVENTORY_0_STAT:
                case StatData.INVENTORY_1_STAT:
                case StatData.INVENTORY_2_STAT:
                case StatData.INVENTORY_3_STAT:
                case StatData.INVENTORY_4_STAT:
                case StatData.INVENTORY_5_STAT:
                case StatData.INVENTORY_6_STAT:
                case StatData.INVENTORY_7_STAT:
                case StatData.INVENTORY_8_STAT:
                case StatData.INVENTORY_9_STAT:
                case StatData.INVENTORY_10_STAT:
                case StatData.INVENTORY_11_STAT:
                    if (!CraftingPanel.terminalOpen) {
                        _arg1.equipment_[(_local4._0F_4 - StatData.INVENTORY_0_STAT)] = _local4._h;
                    }
                    break;

                case StatData.Backpack1_0:
                case StatData.Backpack1_1:
                case StatData.Backpack1_2:
                case StatData.Backpack1_3:
                case StatData.Backpack1_4:
                case StatData.Backpack1_5:
                case StatData.Backpack1_6:
                case StatData.Backpack1_7:
                    if (!CraftingPanel.terminalOpen && _arg1.backpack1 != null) {
                        _arg1.backpack1[(_local4._0F_4 - StatData.Backpack1_0)] = _local4._h;
                    }
                    break;

                case StatData.Backpack2_0:
                case StatData.Backpack2_1:
                case StatData.Backpack2_2:
                case StatData.Backpack2_3:
                case StatData.Backpack2_4:
                case StatData.Backpack2_5:
                case StatData.Backpack2_6:
                case StatData.Backpack2_7:
                    if (!CraftingPanel.terminalOpen && _arg1.backpack2 != null) {
                        _arg1.backpack2[(_local4._0F_4 - StatData.Backpack2_0)] = _local4._h;
                    }
                    break;
                case StatData.HasBackpack1:
                    if (_arg1.backpack1 == null && _local4._h == 1) {
                        _arg1.backpack1 = new <int>[-1, -1, -1, -1, -1, -1, -1, -1];
                    }
                    break;
                case StatData.HasBackpack2:
                    if (_arg1.backpack2 == null && _local4._h == 1) {
                        _arg1.backpack2 = new <int>[-1, -1, -1, -1, -1, -1, -1, -1];
                    }
                    break;
                case StatData._s9:
                    if ((_arg1 as Player).oldRank != -1) {
                        (_arg1 as Player).oldRank = (_arg1 as Player).rank;
                        (_arg1 as Player).rank = _local4._h;

                        if ((_arg1 as Player).rank > (_arg1 as Player).oldRank) {
                            (_arg1 as Player).promote();
                        }
                    }
                    else {
                        (_arg1 as Player).oldRank = _local4._h;
                        (_arg1 as Player).rank = _local4._h;
                    }
                    break;
                case StatData._hK_:
                    if (_arg1.name_ != _local4._3x) {
                        _arg1.name_ = _local4._3x;
                        _arg1._U_g = null;
                    }
                    break;
                case StatData.TEX1_STAT:
                    _arg1.setTex1(_local4._h);
                    break;
                case StatData.TEX2_STAT:
                    _arg1.setTex2(_local4._h);
                    break;
                case StatData._K_u:
                    //(_arg1 as Merchant).setMerchandiseType(_local4._h);
                    break;
                case StatData._Q_c:
                    (_arg1 as Player)._F_S_(_local4._h);
                    break;
                case StatData._h1:
                    (_arg1 as SellableObject).setPrice(_local4._h);
                    break;
                case StatData._1m:
                    (_arg1 as Portal)._09S_ = !((_local4._h == 0));
                    break;
                case StatData._Z_N_:
                    (_arg1 as Player).accountId_ = _local4._h;
                    break;
                case StatData._0M_V_:
                    (_arg1 as Player)._Q_7 = _local4._h;
                    break;
                case StatData._06_:
                    (_arg1 as SellableObject)._gF_(_local4._h);
                    break;
                case StatData._3y:
                    _arg1._O_l = _local4._h;
                    break;
                case StatData._e7:
                    //(_arg1 as Merchant)._1I_ = _local4._h;
                    //(_arg1 as Merchant)._z5 = 0;
                    break;
                case StatData._ud:
                    //(_arg1 as Merchant)._gt = _local4._h;
                    //(_arg1 as Merchant)._z5 = 0;
                    break;
                case StatData._V_c:
                    //(_arg1 as Merchant)._S_I_ = _local4._h;
                    //(_arg1 as Merchant)._z5 = 0;
                    break;
                case StatData._H_I_:
                    (_arg1 as SellableObject).setRankReq(_local4._h);
                    break;
                case StatData._P_z:
                    (_arg1 as Player)._P_7 = _local4._h;
                    break;
                case StatData._vc:
                    (_arg1 as Player)._0D_G_ = _local4._h;
                    break;
                case StatData._06o:
                    (_arg1 as Player)._05s = _local4._h;
                    break;
                case StatData._07D_:
                    (_arg1 as Player)._07f = _local4._h;
                    break;
                case StatData._7F_:
                    (_arg1 as Player)._065 = _local4._h;
                    break;
                case StatData._rx:
                    (_arg1 as Player)._pP_ = _local4._h;
                    break;
                case StatData._wT_:
                    (_arg1 as Player)._B_e = _local4._h;
                    break;
                case StatData._0M_9:
                    (_arg1 as Player)._cu = _local4._h;
                    break;
                case StatData._0E_c:
                    (_arg1 as Container)._75(_local4._h);
                    break;
                case StatData._4z:
                    (_arg1 as NameChanger)._Y__(_local4._h);
                    break;
                case StatData._m0:
                    (_arg1 as Player).nameChosen = !((_local4._h == 0));
                    _arg1._U_g = null;
                    break;
                case StatData.KILLS:
                    (_arg1 as Player).kills = _local4._h;
                    break;
                case StatData._dR_:
                    (_arg1 as Player)._n8 = _local4._h;
                    break;
                case StatData.PREMIUM:
                    (_arg1 as Player).premium = _local4._h != 0;
                    break;
                case StatData._hi:
                    if (!_arg3) {
                        (_arg1 as Player)._0F_ = _local4._h;
                    }
                    break;
                case StatData._0F_5:
                    _arg1._5w(_local4._h);
                    break;
                case StatData._07q:
                    (_arg1 as Player)._Y_C_(_local4._3x);
                    break;
                case StatData._L_i:
                    (_arg1 as Player).guildRank_ = _local4._h;
                    break;
                case StatData._5J_:
                    (_arg1 as Player)._R_4 = _local4._h;
                    break;
                case StatData._bk:
                    (_arg1 as Player)._gz = _local4._h;
                    break;
                case StatData.SKIN_STAT:
                    _arg1.setSkin(_local4._h);
                    break;
                case StatData.PVP_STAT:
                    _arg1.pvp_ = _local4._h != 0;
                    break;
                case StatData.TEAM_STAT:
                    _arg1.team_ = _local4._h;
                    break;
                case StatData.ABILITYCOOLDOWN:
                    (_arg1 as Player).abilityCooldownSec = _local4._h;
                    break;
                case StatData.VISIBILITYRANGE:
                    (_arg1 as Player).visibilityRange = _local4._h;
                    break;
                case StatData.EFFECT_STAT:
                    (_arg1 as Player).setEffect(_local4._3x);
                    break;

                //Todo: add ammo statdata here (for guns)
            }
        }
    }

    private function _9s(_arg1:ObjectStatusData, _arg2:int, _arg3:int):void {
        var _local8:int;
        var _local9:int;
        var _local10:Array;
        var _local4:GameMap = this.gs_.map_;
        var _local5:GameObject = _local4.goDict_[_arg1.objectId_];
        if (_local5 == null) {
            return;
        }
        var _local6 = (_arg1.objectId_ == this._5z);
        if (((!((_arg2 == 0))) && (!(_local6)))) {
            _local5._0I_u(_arg1.pos_.x_, _arg1.pos_.y_, _arg2, _arg3);
        }
        var _local7:Player = (_local5 as Player);
        if (_local7 != null) {
            _local8 = _local7.level_;
            _local9 = _local7.exp_;
        }
        this._066(_local5, _arg1._086, _local6);
        if (((!((_local7 == null))) && (!((_local8 == -1))))) {
            if (_local7.level_ > _local8) {
                if (_local6) {
                    //_local10 = this.gs_.charList_._B_7(_local7.objectType_, _local7.level_);
                    //_local7._ut(!((_local10.length == 0)));
                } else {
                    _local7._x1("Level Up!");
                }
            } else {
                if (_local7.exp_ > _local9) {
                    _local7._0I_I_((_local7.exp_ - _local9));
                }
            }
        }
    }

    private function _A_i(_arg1:Text):void {
        var _local6:Player = this.gs_.map_.player_;
        var _local3:GameObject;
        var _local4:Vector.<uint>;
        var _local2:String = _arg1.text_;
        var _local5:Boolean = (_arg1.numStars_ == -1 || _arg1.objectId_ == -1);
        if ((_arg1.numStars_ < Parameters.data_.chatStarRequirement) && !(nameCheck(_arg1.name_, _local6)) && !(_local5) && !(this.chatCheck(_arg1.recipient_)) && _arg1.name_.charAt(0) != "@") {
            return;
        }
        if ((((((_arg1.cleanText_.length > 0)) && (!((_arg1.objectId_ == this._5z))))) && (Parameters.data_.filterLanguage))) {
            _local2 = _arg1.cleanText_;
        }
        if (_arg1.objectId_ >= 0) {
            _local3 = this.gs_.map_.goDict_[_arg1.objectId_];
            if (_local3 != null) {
                _local4 = _vb;
                if (_local3.props_.isEnemy_) {
                    _local4 = _Z_y;
                } else {
                    if (_arg1.recipient_ == Parameters.SendGuild) {
                        _local4 = _pS_;
                    } else {
                        if (_arg1.recipient_ != "") {
                            _local4 = _0A_F_;
                        }
                    }
                }
                this.gs_.map_.mapOverlay_.addSpeechBalloon(new _6T_(_local3, _local2, _local4[0], 1, _local4[1], 1, _local4[2], _arg1.bubbleTime_, false, true));
            }
        }
        if (!Parameters.data_.hidePlayerChat) {
            this.gs_.textBox_._ro(_arg1.name_, _arg1.objectId_, _arg1.numStars_, _arg1.recipient_, _local2, _arg1.premium);
        }
    }

    private function nameCheck(_arg1:String, _arg2:Player):Boolean {
        if (_arg2 == null) return false;
        var _local1:String = _arg1;
        var _local2:String = _arg2.name_;
        if (_local1 == _local2) {
            return true;
        }
        return false;
    }

    private function chatCheck(_arg1:String):Boolean {
        return (_arg1.length > 0 && (_arg1.charAt(0) == "*" || _arg1.charAt(0) == "#" || _arg1.charAt(0) == "@"));
    }

    private function _I_I_(_arg1:InvResult):void {
        if (_arg1.result_ != 0) {
            this._v6();
        }
    }

    private function _v6():void {
        UrlSoundEffects.play("error");
        this.gs_.sideUI._02y._e9.refresh();
        this.gs_.sideUI._02y.equips_.refresh();
        this.gs_.sideUI._U_T_.redraw();
    }

    private function _X_3(_arg1:_8_):void {
        var _local2:_j_ = new _j_(new Server(_arg1.name_, _arg1.host_ != "" ? _arg1.host_ : this.server_.host_, _arg1.host_ != "" ? _arg1.port_ : this.server_.port_), _arg1.gameId_, this._96, this.charId_, _arg1.keyTime_, _arg1.key_);
        this.gs_.dispatchEvent(_local2);
    }

    private function _94(_arg1:_0F_I_):void {
        var _local2:PongPacket = (this.serverConn.createPacketFromID(PONG) as PongPacket);
        _local2.serial_ = _arg1.serial_;
        _local2.time_ = getTimer();
        this.serverConn.sendPacket(_local2);
    }

    private function _7N_(_arg1:String):void {
        var _local2:XML = XML(_arg1);
        _pf._nY_(_local2);
        ObjectLibrary._nY_(_local2);
    }

    private function _ju(_arg1:MapInfo):void {
        var _local2:String;
        var _local3:String;
        for each (_local2 in _arg1.clientXML_) {
            this._7N_(_local2);
        }
        for each (_local3 in _arg1.extraXML_) {
            this._7N_(_local3);
        }
        this.gs_._S_z(_arg1);
        this._7G_ = new Random(_arg1.fp_);
        if (this._96) {
            this.create();
        } else {
            this.load();
        }
    }

    private function _F_E_(_arg1:Pic):void {
        this.gs_.addChild(new _B_N_(_arg1.bitmapData_));
    }

    private function _038(_arg1:Death):void {
        this.gs_.stage;
        this.gs_.stage;
        Sounds.Music.reload("Death");
        var _local2:BitmapData = new BitmapData(800, 600);
        _local2.draw(this.gs_);
        _arg1.background = _local2;
        if (this.gs_._3c) {
            return;
        }
        _8P_._V_O_().getInstance(_06a).dispatch(_arg1);
    }

    private function _cN_(_arg1:BuyResult):void {
        this.outstandingBuy_ = null;
        switch (_arg1.result_) {
            case BuyResult._7a:
                this.gs_.stage.addChild(new _02d());
                return;
            case BuyResult._0I_C_:
                this.gs_.stage.addChild(new _aZ_());
                return;
            case BuyResult.craft:
                this.gs_.dispatchEvent(new CraftingResultEvent(_arg1.resultString_));
                return;
            case BuyResult.learnCrafting:
                this.gs_.dispatchEvent(new LearnCraftingResultEvent(_arg1.resultString_));
                return;
            case BuyResult.sellItemResult:
                this.gs_.dispatchEvent(new ItemSellResultEvent(_arg1.resultString_));
                return;
            default:
                this.gs_.textBox_.addText((((_arg1.result_ == BuyResult._dV_)) ? Parameters.SendInfo : Parameters.SendError), _arg1.resultString_);
        }
    }

    private function _0J_R_(_arg1:_0K_U_):void {
        if (_arg1.accountListId_ == 0) {
            this.gs_.map_.party_.setStars(_arg1);
        }
        if (_arg1.accountListId_ == 1) {
            this.gs_.map_.party_.setIgnores(_arg1);
        }
    }

    private function _fF_(_arg1:_Y_F_):void {
        this.gs_.map_.quest_.setObject(_arg1.objectId_);
    }

    private function _06y(_arg1:AOE):void {
        var _local5:int;
        var _local6:Vector.<uint>;
        var _local2:Player = this.gs_.map_.player_;
        if (_local2 == null) {
            this._H_q(this.gs_.lastUpdate_, 0, 0);
            return;
        }
        var _local3:_pK_ = new _pK_(_arg1.pos_._6g(), _arg1.radius_, 0xFF0000);
        this.gs_.map_.addObj(_local3, _arg1.pos_.x_, _arg1.pos_.y_);
        if (((_local2._0C_4()) || (_local2.isPaused()))) {
            this._H_q(this.gs_.lastUpdate_, _local2.x_, _local2.y_);
            return;
        }
        var _local4 = (_local2._F_Y_(_arg1.pos_) < _arg1.radius_);
        if (_local4) {
            _local5 = GameObject._C_f(_arg1.damage_, _local2.defense_, false, _local2._9B_);
            _local6 = null;
            if (_arg1.effect_ != 0) {
                _local6 = new Vector.<uint>();
                _local6.push(_arg1.effect_);
            }
            _local2.damage(_arg1.origType_, _local5, _local6, false, null);
        }
        this._H_q(this.gs_.lastUpdate_, _local2.x_, _local2.y_);
    }

    private function _0D_s(_arg1:NameResult):void {
        this.gs_.dispatchEvent(new _3E_(_arg1));
    }

    private function _Z_g(_arg1:_ic):void {
        this.gs_.textBox_.addText(Parameters.SendError, _arg1.errorText_);
        this.gs_.dispatchEvent(new VillageResultEvent(_arg1.success_, _arg1.errorText_));
    }

    private function _oA_(_arg1:_0F_u):void {
        Account._get().reportIntStat(_arg1.name_, _arg1.value_);
    }

    private function _J_0(_arg1:File):void {
        new FileReference().save(_arg1.file_, _arg1.filename_);
    }

    private function _cS_(_arg1:InvitedToGuild):void {
        if (Parameters.data_.showGuildInvitePopup) {
            this.gs_.sideUI._U_T_._j(new InviteGuildPanel(this.gs_, _arg1.name_, _arg1.guildName_));
        }
        this.gs_.textBox_.addText("", (((((("You have been invited by " + _arg1.name_) + " to join the guild ") + _arg1.guildName_) + '.\n  If you wish to join type "/join ') + _arg1.guildName_) + '"'));
    }

    private function _A_C_(_arg1:_bB_):void {
        var _local2:GameObject = this.gs_.map_.goDict_[_arg1.ownerId_];
        if (_local2 == null) {
            return;
        }
        _local2._05M_(_arg1.soundId_);
    }

    private function _of(_arg1:Event):void {
        if (this._5z != -1) {
            this.gs_.dispatchEvent(new Event(Event.COMPLETE));
            return;
        }
        if (this._P_A_) {
            this._P_p(1);
            this.gs_.textBox_.addText(Parameters.SendError, "Connection failed!  Retrying...");
        }
    }

    private function _P_p(_arg1:int):void {
        this._0c = new Timer((_arg1 * 1000), 1);
        this._0c.addEventListener(TimerEvent.TIMER_COMPLETE, this._F_z);
        this._0c.start();
    }

    private function _F_z(_arg1:TimerEvent):void {
        this.connect();
    }

    private function onError(_arg1:ErrorEvent):void {
        this.gs_.textBox_.addText(Parameters.SendError, _arg1.text);
    }

    private function _nc(_arg1:FailurePacket):void {
        switch (_arg1.errorId_) {
            case FailurePacket.UPDATE_CLIENT:
                this._ee(_arg1);
                return;
            case FailurePacket._C_w:
                this._0H_6(_arg1);
                return;
            case FailurePacket._oo:
                this._0K_Z_(_arg1);
                return;
            default:
                this._0M_G_(_arg1);
        }
    }

    private function _0K_Z_(_arg1:FailurePacket):void {
        this.gs_.textBox_.addText(Parameters.SendError, _arg1.errorDescription_);
        this.gs_.map_.player_.nextTeleportAt_ = 0;
    }

    private function _0H_6(_arg1:FailurePacket):void {
        this.gs_.textBox_.addText(Parameters.SendError, _arg1.errorDescription_);
        this._P_A_ = false;
        this.gs_.dispatchEvent(new Event(Event.COMPLETE));
    }

    private function _ee(_arg1:FailurePacket):void {
        this.gs_.dispatchEvent(new _D_X_(_arg1.errorDescription_));
    }

    private function _0M_G_(_arg1:FailurePacket):void {
        this.gs_.textBox_.addText(Parameters.SendError, _arg1.errorDescription_);
    }

    public function craftItems(_arg1:int, _arg2:String, _arg3:Vector.<int>):void {
        var _loc2_:CraftPacket = this.serverConn.createPacketFromID(CRAFT) as CraftPacket;
        _loc2_.objectId_ = _arg1;
        _loc2_.recipeString_ = _arg2;
        _loc2_.slots = _arg3;
        this.serverConn.sendPacket(_loc2_);
    }

    private function switchMusic(_arg1:SwitchMusic):void {
        Sounds.Music.reload(_arg1.music_, true);
    }

    private function onAchievementUnlock(packet:AchievementUnlockedPacket):void {
        switch (packet.type) {
            case 0:
                new BasicAchievement(this.gs_, packet.title, packet.description);
                break;
            case 1:
                throw new ArgumentError("Not Implemented yet");
                break;
        }
    }

    private function unlockedSomething(packet:UnlockedPacket):void {
        switch (packet.type) {
            case 0:
                new NewItemUnlockedScreen(this.gs_, packet.itemId, LocalSounds.UX_InGame_Unlock_Item);
                break;
            case 1:
                new FirePackPopUp(this.gs_, packet.itemId, LocalSounds.UX_InGame_Unlock_FirePack);
                break;
        }
    }
}
}//package com.company.assembleegameclient.net

