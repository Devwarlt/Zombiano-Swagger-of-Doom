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

//com.company.assembleegameclient.appengine._vt

package com.company.assembleegameclient.appengine {
import flash.display.BitmapData;

import com.company.util.AssetLibrary;
import com.company.assembleegameclient.util.TextureRedrawer;

public class NewsItemStruct {

    public var icon:BitmapData;
    public var _O_k:String;
    public var _03P_:String;
    public var _qh:String;
    public var _W_e:int;

    public function NewsItemStruct(_arg1:String, _arg2:String, _arg3:String, _arg4:String, _arg5:int) {
        switch (_arg1) {
            case "fame":
                this.icon = getFameIcon();
                break;
            case "news":
            default:
                this.icon = getNewsIcon();
        }
        this._O_k = _arg2;
        this._03P_ = _arg3;
        this._qh = _arg4;
        this._W_e = _arg5;
    }

    private static function getNewsIcon():BitmapData {
        var _local1:BitmapData = AssetLibrary._xK_("lofiInterface2", 4);
        return (TextureRedrawer.redraw(_local1, 80, true, 0, 0));
    }

    private static function getFameIcon():BitmapData {
        var _local1:BitmapData = AssetLibrary._xK_("lofiObj3", 224);
        return (TextureRedrawer.redraw(_local1, 80, true, 0, 0));
    }

}
}//package com.company.assembleegameclient.appengine

