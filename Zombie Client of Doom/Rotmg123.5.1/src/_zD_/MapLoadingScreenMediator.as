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

//_zD_._jT_

package _zD_ {
import _C__.Mediator;

import _F_1.MapLoadingScreen;

import _W_D_.CharListHistory;

import _04w._07V_;

import _U_5._D_L_;

import com.company.assembleegameclient.appengine.SavedCharacter;
import com.company.assembleegameclient.util._lJ_;
import com.company.assembleegameclient.util._J_H_;

import flash.display.BitmapData;

import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.assembleegameclient.util._0B_c;
import com.company.assembleegameclient.util.TextureRedrawer;

import ServerPackets.MapInfo;

public class MapLoadingScreenMediator extends Mediator {

    [Inject]
    public var view:MapLoadingScreen;
    [Inject]
    public var _eJ_:CharListHistory;
    [Inject]
    public var _bK_:_07V_;

    override public function initialize():void {
        _D_L_.getInstance().addOnce(this._07R_);
    }

    private function _07R_(_arg1:MapInfo):void {
        var _local2:SavedCharacter;
        var _local3:int;
        var _local4:XML;
        var _local5:_lJ_;
        var _local6:_J_H_;
        var _local7:int;
        var _local8:int;
        var _local9:BitmapData;
        var _local10:BitmapData;
        _local2 = null;
        for each (_local2 in this._eJ_.charList.savedChars_) {
            if (this._eJ_.charId == _local2.charId()) break;
        }
        if (_local2) {
            _local3 = int(_local2._iJ_.ObjectType);
            _local4 = ObjectLibrary.Items[_local3];
            var _skin:int = (_local2 != null ? _local2.skin() : -1);
            _local5 = _0B_c._J_v(String(_local4.AnimatedTexture.File), int(_local4.AnimatedTexture.Index));
            if (_skin != -1) {
                var _skinx:XML = ObjectLibrary.Items[_local2.skin()];
                if (_skinx != null)
                    _local5 = _0B_c._J_v(String(_skinx.AnimatedTexture.File), int(_skinx.AnimatedTexture.Index));
            }
            _local6 = _local5.imageFromDir(_lJ_.RIGHT, _lJ_._m1, 0);
            _local7 = (((_local2) != null) ? _local2.tex1() : 0);
            _local8 = (((_local2) != null) ? _local2.tex2() : 0);
            _local9 = TextureRedrawer.resize(_local6.image_, _local6.mask_, 100, false, _local7, _local8);
            _local6 = _local5.imageFromDir(_lJ_.RIGHT, _lJ_._m1, 0.5);
            _local7 = (((_local2) != null) ? _local2.tex1() : 0);
            _local8 = (((_local2) != null) ? _local2.tex2() : 0);
            _local10 = TextureRedrawer.resize(_local6.image_, _local6.mask_, 100, false, _local7, _local8);
        }
        this.view.display(_arg1.name_, 0, _local9, _local10, _arg1.backgroundImage_);
    }

}
}//package _zD_

