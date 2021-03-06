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

//_6e._03v

package _6e {
import AccountManagement.ui.FancyTextButton;

import flash.display.Sprite;

import flash.display.IGraphicsData;

import com.company.util.GraphicHelper;
import com.company.ui.SimpleText;
import com.company.assembleegameclient.ui.ScrollBar;
import com.company.assembleegameclient.ui.boxButton;

import flash.display.GraphicsSolidFill;
import flash.display.GraphicsStroke;
import flash.display.GraphicsPath;
import flash.display.LineScaleMode;
import flash.display.CapsStyle;
import flash.display.JointStyle;
import flash.display.Shape;
import flash.display.Graphics;

import com.company.util._sH_;

import flash.events.Event;
import flash.events.MouseEvent;

import _6e.*;

internal class _03v extends Sprite {

    public static const _lV_:int = 400;
    public static const _05N_:int = 400;
    private static const _pH_:RegExp = /((https?|ftp):((\/\/)|(\\\\))+[\w\d:#@%\/;$()~_?\+-=\\\.&]*)/g;

    private var graphicsData_:Vector.<IGraphicsData>;

    private var text_:String;
    public var w_:int;
    public var h_:int;
    private var _M_Z_:SimpleText;
    private var _017:Sprite;
    private var _gJ_:Sprite;
    private var _E_k:ScrollBar;
    private var _5Y_:FancyTextButton;
    private var _zF_:FancyTextButton;
    private var _vV_:GraphicsSolidFill;
    private var outlineFill_:GraphicsSolidFill;
    private var _0y:GraphicsStroke;
    private var path_:GraphicsPath;

    public function _03v(_arg1:String, _arg2:Boolean) {
        this._vV_ = new GraphicsSolidFill(0x63432E, 1);
        this.outlineFill_ = new GraphicsSolidFill(0xFFFFFF, 1);
        this._0y = new GraphicsStroke(2, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3, this.outlineFill_);
        this.path_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
        this.graphicsData_ = new <IGraphicsData>[_0y, _vV_, path_, GraphicHelper.END_FILL, GraphicHelper._H_B_];
        super();
        this.text_ = _arg1;
        this._017 = new Sprite();
        var _local3:Shape = new Shape();
        var _local4:Graphics = _local3.graphics;
        _local4.beginFill(0);
        _local4.drawRect(0, 0, _lV_, _05N_);
        _local4.endFill();
        this._017.addChild(_local3);
        this._017.mask = _local3;
        addChild(this._017);
        var _local5:String = _sH_._M_6(_arg1);
        _local5.replace(_pH_, ('<font color="#7777EE"><a href="$1" target="_blank">' + "$1</a></font>"));
        _local5 = _arg1;
        this._M_Z_ = new SimpleText(16, 0xB3B3B3, false, _lV_, 0, "Myriad Pro");
        this._M_Z_.border = false;
        this._M_Z_.mouseEnabled = true;
        this._M_Z_.multiline = true;
        this._M_Z_.wordWrap = true;
        this._M_Z_.htmlText = _local5;
        this._M_Z_._08S_();
        this._017.addChild(this._M_Z_);
        var _local6 = (this._M_Z_.height > 400);
        if (_local6) {
            this._E_k = new ScrollBar(16, (_05N_ - 4));
            this._E_k.x = (_lV_ + 6);
            this._E_k.y = 0;
            this._E_k._fA_(400, this._M_Z_.height);
            this._E_k.addEventListener(Event.CHANGE, this._A_E_);
            addChild(this._E_k);
        }
        this.w_ = (_lV_ + ((_local6) ? 26 : 0));
        this._5Y_ = new FancyTextButton(14, "Edit", 120);
        this._5Y_.x = 4;
        this._5Y_.y = (_05N_ + 4);
        this._5Y_.addEventListener(MouseEvent.CLICK, this._L_n);
        addChild(this._5Y_);
        this._5Y_.visible = _arg2;
        this._zF_ = new FancyTextButton(14, "Close", 120);
        this._zF_.x = ((this.w_ - this._zF_.width) - 4);
        this._zF_.y = (_05N_ + 4);
        this._zF_.addEventListener(MouseEvent.CLICK, this._of);
        addChild(this._zF_);
        this.h_ = ((_05N_ + this._zF_.height) + 8);
        graphics.clear();
        GraphicHelper._0L_6(this.path_);
        GraphicHelper.drawUI(-6, -6, (this.w_ + 12), (this.h_ + 12), 4, [1, 1, 1, 1], this.path_);
        graphics.drawGraphicsData(this.graphicsData_);
    }

    private function _A_E_(_arg1:Event):void {
        this._M_Z_.y = (-(this._E_k.getPositionInPercent()) * (this._M_Z_.height - 400));
    }

    private function _L_n(_arg1:Event):void {
        dispatchEvent(new Event(Event.CHANGE));
    }

    private function _of(_arg1:Event):void {
        dispatchEvent(new Event(Event.COMPLETE));
    }

}
}//package _6e

