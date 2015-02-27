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

//_lo._nR_

package _lo {
import flash.events.Event;
import flash.display.DisplayObjectContainer;

import _s3._yp;

public class _nR_ extends Event {

    public static const _0K_h:String = "containerAdd";
    public static const _mh:String = "containerRemove";
    public static const _M_U_:String = "handlerAdd";
    public static const _T_A_:String = "handlerRemove";

    private var _0J_w:DisplayObjectContainer;
    private var _handler:_yp;

    public function _nR_(_arg1:String, _arg2:DisplayObjectContainer = null, _arg3:_yp = null) {
        super(_arg1);
        this._0J_w = _arg2;
        this._handler = _arg3;
    }

    public function get container():DisplayObjectContainer {
        return (this._0J_w);
    }

    public function get handler():_yp {
        return (this._handler);
    }

    override public function clone():Event {
        return (new _nR_(type, this._0J_w, this._handler));
    }

}
}//package _lo

