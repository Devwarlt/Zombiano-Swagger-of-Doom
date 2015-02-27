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

//com.company.assembleegameclient.ui._L_N_

package com.company.assembleegameclient.ui {
import flash.display.Sprite;
import flash.display.Bitmap;

import com.company.ui.SimpleText;

import flash.filters.DropShadowFilter;

import com.company.util._O_m;
import com.company.assembleegameclient.util._07E_;

public class _L_N_ extends Sprite {

    private var name_:String;
    private var _S_e:int;
    private var _5U_:Bitmap;
    private var guildName_:SimpleText;

    public function _L_N_(_arg1:String, _arg2:int, _arg3:int = 0) {
        this._5U_ = new Bitmap(null);
        this._5U_.y = -8;
        this._5U_.x = -8;
        this._5U_.scaleX = 0.1;
        this._5U_.scaleY = 0.1;
        var _local4:int = (((_arg3 == 0)) ? 0 : (_arg3 - (this._5U_.width - 16)));
        this.guildName_ = new SimpleText(16, 0xFFFFFF, false, _local4, 0, "Myriad Pro");
        this.guildName_.filters = [new DropShadowFilter(0, 0, 0)];
        this.guildName_.x = 24;
        this.draw(_arg1, _arg2);
    }

    public function draw(_arg1:String, _arg2:int):void {
        if ((((this.name_ == _arg1)) && ((_arg2 == _arg2)))) {
            return;
        }
        this.name_ = _arg1;
        this._S_e = _arg2;
        if ((((this.name_ == null)) || ((this.name_ == "")))) {
            _O_m._03d(this, this._5U_);
            _O_m._03d(this, this.guildName_);
        } else {
            this._5U_.bitmapData = _07E_._wS_(this._S_e, 10);
            this._5U_.scaleX = 0.1;
            this._5U_.scaleY = 0.1;
            _O_m._041(this, this._5U_);
            this.guildName_.text = this.name_;
            this.guildName_._08S_();
            _O_m._041(this, this.guildName_);
        }
    }

}
}//package com.company.assembleegameclient.ui

