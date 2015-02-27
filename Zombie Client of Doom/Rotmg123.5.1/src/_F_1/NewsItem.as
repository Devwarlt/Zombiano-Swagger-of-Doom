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

//_F_1._0B_m

package _F_1 {
import flash.display.Sprite;

import _sp._aJ_;

import flash.display.Bitmap;

import com.company.ui.SimpleText;

import flash.filters.DropShadowFilter;
import flash.events.MouseEvent;
import flash.display.BitmapData;
import flash.net.navigateToURL;
import flash.net.URLRequest;

public class NewsItem extends Sprite {

    public static const WIDTH:int = 430;
    public static const HEIGHT:int = 52;
    public static const _3Q_:uint = 0xB3B3B3;
    public static const _00O_:uint = 0xFFC800;

    public var _H_r:_aJ_;
    public var _5U_:Bitmap;
    public var _P_V_:SimpleText;
    public var taglineText_:SimpleText;
    public var _Y_0:SimpleText;
    public var link:String;
    public var accountId:int;

    public function NewsItem(_arg1:BitmapData, _arg2:String, _arg3:String, _arg4:String, _arg5:int, _arg6:int) {
        this._H_r = new _aJ_(int);
        super();
        this.link = _arg4;
        this.accountId = _arg6;
        buttonMode = true;
        useHandCursor = true;
        tabEnabled = false;
        this._5U_ = new Bitmap();
        this._5U_.bitmapData = _arg1;
        this._5U_.x = 12;
        this._5U_.y = (((HEIGHT / 2) - (_arg1.height / 2)) - 3);
        addChild(this._5U_);
        this._P_V_ = new SimpleText(18, _3Q_, false, 0, 0, "Myriad Pro");
        this._P_V_.text = _arg2;
        this._P_V_.updateMetrics();
        this._P_V_.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this._P_V_.x = 73;
        addChild(this._P_V_);
        this.taglineText_ = new SimpleText(14, _3Q_, false, 0, 0, "Myriad Pro");
        this.taglineText_.text = _arg3;
        this.taglineText_.updateMetrics();
        this.taglineText_.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this.taglineText_.x = 73;
        this.taglineText_.y = 24;
        addChild(this.taglineText_);
        this._Y_0 = new SimpleText(16, _3Q_, false, 0, 0, "Myriad Pro");
        this._Y_0.text = this._06P_(_arg5);
        this._Y_0.updateMetrics();
        this._Y_0.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this._Y_0.x = (WIDTH - this._Y_0.width);
        addChild(this._Y_0);
        addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
        addEventListener(MouseEvent.MOUSE_DOWN, this.onMouseDown);
    }

    protected function onMouseOver(_arg1:MouseEvent):void {
        this._P_V_.setColor(_00O_);
        this.taglineText_.setColor(_00O_);
        this._Y_0.setColor(_00O_);
    }

    protected function onRollOut(_arg1:MouseEvent):void {
        this._P_V_.setColor(_3Q_);
        this.taglineText_.setColor(_3Q_);
        this._Y_0.setColor(_3Q_);
    }

    protected function onMouseDown(_arg1:MouseEvent):void {
        var _local2:Array = this.link.split(":", 2);
        switch (_local2[0]) {
            case "fame":
                this._H_r.dispatch(int(_local2[1]));
                return;
            case "http":
            case "https":
            default:
                navigateToURL(new URLRequest(this.link), "_blank");
        }
    }

    private function _06P_(_arg1:int):String {
        var _local2:Number = (new Date().time / 1000);
        var _local3:int = (_local2 - _arg1);
        if (_local3 <= 0) {
            return ("now");
        }
        if (_local3 < 60) {
            return ((_local3 + " secs"));
        }
        if (_local3 < (60 * 60)) {
            return ((int((_local3 / 60)) + " mins"));
        }
        if (_local3 < ((60 * 60) * 24)) {
            return ((int((_local3 / (60 * 60))) + " hours"));
        }
        return ((int((_local3 / ((60 * 60) * 24))) + " days"));
    }

}
}//package _F_1

