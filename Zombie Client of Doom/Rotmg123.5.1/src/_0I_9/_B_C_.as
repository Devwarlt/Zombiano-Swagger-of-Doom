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

//_0I_9._B_C_

package _0I_9 {
import _C__.Mediator;

import flash.display.DisplayObjectContainer;
import flash.display.LoaderInfo;
import flash.events.IEventDispatcher;

import com.company.assembleegameclient.appengine.ClientError;

import flash.events.ErrorEvent;

public class _B_C_ extends Mediator {

    private const _Y_1:String = "uncaughtErrorEvents";
    private const _04:String = "uncaughtError";

    [Inject]
    public var _fR_:DisplayObjectContainer;
    private var loaderInfo:LoaderInfo;

    override public function initialize():void {
        this.loaderInfo = this._fR_.loaderInfo;
        if (this._zV_()) {
            this._E_P_();
        }
    }

    override public function destroy():void {
        if (this._zV_()) {
            this._0E_s();
        }
    }

    private function _zV_():Boolean {
        return (this.loaderInfo.hasOwnProperty(this._Y_1));
    }

    private function _E_P_():void {
        var _local1:IEventDispatcher = IEventDispatcher(this.loaderInfo[this._Y_1]);
        _local1.addEventListener(this._04, this._79);
    }

    private function _0E_s():void {
        var _local1:IEventDispatcher = IEventDispatcher(this.loaderInfo[this._Y_1]);
        _local1.removeEventListener(this._04, this._79);
    }

    private function _79(_arg1:ErrorEvent):void {
        _arg1.preventDefault();
        ClientError.reportClientError(_arg1["error"]);
    }

}
}//package _0I_9

