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

//com.company.assembleegameclient.ui._0B_X_

package com.company.assembleegameclient.ui {
import Frames.VisibilityBar;

import flash.display.Sprite;

import com.company.assembleegameclient.game.GameSprite;

import flash.display.Shape;

import Panels._Q_V_;

import flash.events.Event;

import ServerPackets._S_M_;
import ServerPackets._Z_J_;
import ServerPackets._qe;

import com.company.util._O_m;
import com.company.assembleegameclient.objects.Player;

import flash.display.Graphics;

public class SideUI extends Sprite {

    private static const _08A_:int = 4;
    private static const _0D_Q_:int = 8;

    private var gs_:GameSprite;
    private var w_:int;
    private var h_:int;
    private var _L_C_:Boolean;
    private var background_:Shape;
    public var _F_:MiniMap = null;
    public var _02y:InventorySide;
    public var visiBar:VisibilityBar;
    public var _U_T_:_Q_V_;
    public var _6K_:_zg = null;
    private var _3S_:_return;

    public function SideUI(_arg1:GameSprite, _arg2:int, _arg3:int) {
        this._3S_ = new _return(184, 0x310800);
        super();
        this.gs_ = _arg1;
        this.w_ = _arg2;
        this.h_ = _arg3;
        this._L_C_ = false;
        mouseEnabled = true;
        mouseChildren = true;
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }

    public function initialize():void {
        this._4T_();
    }

    public function dispose():void {
        if (this._F_ != null) {
            if (contains(this._F_)) {
                removeChild(this._F_);
            }
            this._F_.dispose();
            this._F_ = null;
        }
        if (this._02y != null) {
            if (contains(this._02y)) {
                removeChild(this._02y);
            }
            this._02y = null;
        }
    }

    public function _0L_v(_arg1:_S_M_):void {
        if (this._6K_ != null) {
            return;
        }
        this._6K_ = new _zg(this.gs_, _arg1);
        this._6K_.y = 200;
        this._6K_.addEventListener(Event.CANCEL, this._05I_);
    }

    public function _ss(_arg1:_Z_J_):void {
        if (this._6K_ == null) {
            return;
        }
        this._6K_._hf(_arg1.offer_);
    }

    public function _A_a():void {
        this._0L_A_();
    }

    public function _mH_(_arg1:_qe):void {
        if (this._6K_ == null) {
            return;
        }
        this._6K_._C_D_(_arg1.myOffer_, _arg1.yourOffer_);
    }

    private function _05I_(_arg1:Event):void {
        this._0L_A_();
    }

    private function _0L_A_():void {
        if (this._6K_ != null) {
            this._6K_.removeEventListener(Event.CANCEL, this._05I_);
            _O_m._03d(this, this._6K_);
            this._6K_ = null;
        }
    }

    private function _4T_():void {
        this._F_ = new MiniMap(this.gs_.map_, (200 - (2 * _08A_)), (200 - (2 * _08A_)));
        this._F_.x = _08A_;
        this._F_.y = _08A_;
        this.gs_.map_.loadMapCache();
    }

    private function _0J_s():void {
        var _local1:Player;
        _local1 = this.gs_.map_.player_;
        this._02y = new InventorySide(this.gs_, _local1, 200, 300);
        this.visiBar = new VisibilityBar(_local1, this.gs_);
        this._02y.y = 200;
        this._U_T_ = new _Q_V_(this.gs_, _local1, 200, 100);
        this._U_T_.x = 0;
        this._U_T_.y = 500;
    }

    public function draw():void {
        if (this.gs_.map_.player_ == null) {
            return;
        }
        if (!this._L_C_) {
            this._rC_();
            _O_m._041(this, this._F_);
            this._0J_s();
            this._L_C_ = true;
        }
        this._F_.draw();
        if (this._6K_ != null) {
            this._3S_.visible = false;
            _O_m._03d(this, this._02y);
            _O_m._03d(this, this.visiBar);
            _O_m._03d(this, this._U_T_);
            _O_m._041(this, this._6K_);
        } else {
            this._3S_.visible = true;
            _O_m._041(this, this._02y);
            _O_m._041(this, this.visiBar);
            _O_m._041(this, this._U_T_);
            this._02y.draw();
            this.visiBar.draw();
            this._U_T_.draw();
        }
    }

    private function _rC_():void {
        this.background_ = new Shape();
        var _local1:Graphics = this.background_.graphics;
        _local1.clear();
        _local1.beginFill(0x3B1F14);
        _local1.drawRect(0, 0, this.w_, this.h_);
        _local1.endFill();
        addChild(this.background_);
        this._3S_.x = 8;
        this._3S_.y = 500;
        addChild(this._3S_); //Disable if adding HP/MP pot buttons
    }

    private function onEnterFrame(_arg1:Event):void {
        this.draw();
    }

    private function onAddedToStage(_arg1:Event):void {
        stage.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    private function onRemovedFromStage(_arg1:Event):void {
        stage.removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

}
}//package com.company.assembleegameclient.ui

