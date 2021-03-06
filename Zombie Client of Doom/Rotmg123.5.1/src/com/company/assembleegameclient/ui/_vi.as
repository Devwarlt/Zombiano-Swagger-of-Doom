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

//com.company.assembleegameclient.ui._vi

package com.company.assembleegameclient.ui {
import flash.text.engine.ElementFormat;
import flash.text.engine.FontDescription;
import flash.text.engine.FontWeight;
import flash.text.engine.FontPosture;
import flash.text.engine.FontLookup;
import flash.text.engine.RenderingMode;
import flash.text.engine.CFFHinting;

public class _vi {

    public var TextColour:ElementFormat = null;
    public var InfoColour:ElementFormat = null;
    public var ClientColour:ElementFormat = null;
    public var HelpColour:ElementFormat = null;
    public var ErrorColour:ElementFormat = null;
    public var AdminColour:ElementFormat = null;
    public var SAdminColour:ElementFormat = null;
    public var EnemyColour:ElementFormat = null;
    public var PlayerColour:ElementFormat = null;
    public var _cK_:ElementFormat = null;
    public var TellColour:ElementFormat = null;
    public var GuildColour:ElementFormat = null;

    public function _vi() {
        this.TextColour = this._yz();
        this.TextColour.color = 0xFFFFFF;
        this.InfoColour = this._yz();
        this.InfoColour.color = 0xFFFF00;
        this.ClientColour = this._yz();
        this.ClientColour.color = 0xFF;
        this.HelpColour = this._yz();
        this.HelpColour.color = 16734981;
        this.ErrorColour = this._yz();
        this.ErrorColour.color = 0xFF0000;
        this.AdminColour = this._yz();
        this.AdminColour.color = 0xFFFF00;
        this.SAdminColour = this._yz();
        this.SAdminColour.color = 0x000000;
        this.EnemyColour = this._yz();
        this.EnemyColour.color = 0xFFA800;
        this.PlayerColour = this._yz();
        this.PlayerColour.color = 0xFF00;
        this._cK_ = this._yz();
        this._cK_.color = 0x363636;
        this.TellColour = this._yz();
        this.TellColour.color = 0x00F0FF;
        this.GuildColour = this._yz();
        this.GuildColour.color = 0xA6FF5D;
    }

    private function _yz():ElementFormat {
        var _local1:ElementFormat = new ElementFormat();
        var _T_s:String = "MyriadProCFF,_sans";
        _local1.fontDescription = new FontDescription(_T_s, FontWeight.BOLD, FontPosture.NORMAL, FontLookup.EMBEDDED_CFF, RenderingMode.CFF, CFFHinting.HORIZONTAL_STEM);
        _local1.fontSize = 14;
        return (_local1);
    }

}
}//package com.company.assembleegameclient.ui

