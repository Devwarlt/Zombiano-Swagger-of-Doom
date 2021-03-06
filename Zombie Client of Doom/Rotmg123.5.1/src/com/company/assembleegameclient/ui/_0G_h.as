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

//com.company.assembleegameclient.ui._0G_h

package com.company.assembleegameclient.ui {

import flash.display.DisplayObject;
import flash.display.Sprite;

import com.company.ui.SimpleText;

import flash.filters.DropShadowFilter;

import com.company.assembleegameclient.util.RankUtils;

public class _0G_h extends Sprite {

    public var _Q_j:Sprite = null;
    public var _0H_O_:Boolean;
    private var rank:int = -1;
    private var _A_2:SimpleText = null;

    public function _0G_h(_arg1:int, _arg2:Boolean, _arg3:Boolean) {
        this._0H_O_ = _arg2;
        if (_arg3) {
            this._A_2 = new SimpleText(((this._0H_O_) ? 18 : 16), 0xB3B3B3, false, 0, 0, "Myriad Pro");
            this._A_2.boldText(this._0H_O_);
            this._A_2.text = "Rank: ";
            this._A_2.updateMetrics();
            this._A_2.filters = [new DropShadowFilter(0, 0, 0)];
            addChild(this._A_2);
        }
        mouseEnabled = false;
        mouseChildren = false;
        this.draw(_arg1);
    }

    public function draw(_arg1:int):void {
        var _local3:DisplayObject;
        if (_arg1 == this.rank) {
            return;
        }
        this.rank = _arg1;
        if (((!((this._Q_j == null))) && (contains(this._Q_j)))) {
            removeChild(this._Q_j);
        }
        if (this.rank < 0) {
            return;
        }
        this._Q_j = new Sprite();
        var _local2:SimpleText = new SimpleText(((this._0H_O_) ? 18 : 16), 0xB3B3B3, false, 0, 0, "Myriad Pro");
        _local2.boldText(this._0H_O_);
        _local2.text = RankUtils.toLongRankString(this.rank);
        _local2.updateMetrics();
        _local2.filters = [new DropShadowFilter(0, 0, 0, 1, 4, 4, 2)];
        this._Q_j.addChild(_local2);
        _local3 = RankUtils._bl(this.rank);
        _local3.x = (_local2.width + 2);
        this._Q_j.addChild(_local3);
        _local3.y = (int(((_local2.height / 2) - (_local3.height / 2))) + 1);
        var _local4:int = (_local3.x + _local3.width);
        this._Q_j.graphics.clear();
        this._Q_j.graphics.beginFill(0, 0.4);
        this._Q_j.graphics.drawRoundRect(-2, (_local3.y - 3), (_local4 + 6), (_local3.height + 8), 12, 12);
        this._Q_j.graphics.endFill();
        addChild(this._Q_j);
        if (this._A_2 != null) {
            addChild(this._A_2);
            this._Q_j.x = this._A_2.width;
        }
    }
}
}//package com.company.assembleegameclient.ui

