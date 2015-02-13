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

//AccountWebrequests._ak

package AccountWebrequests{
import AccountManagement.AccountManagementScreen;

import flash.display.Sprite;
    import Frames.Frame;
    import com.company.assembleegameclient.appengine.WebRequest;
    import flash.display.Shape;
    import flash.display.Graphics;
    import _qN_.Account;
    import com.company.assembleegameclient.parameters.Parameters;
    import WebRequestEvents.WebRequestSuccessEvent;
    import WebRequestEvents.WebRequestErrorEvent;
    import flash.events.Event;

    public class _ak extends Sprite {

        private var _Z_X_:Frame = null;
        private var _zH_:WebRequest = null;
        private var _T_y:Shape;

        public function _ak(_arg1:Boolean){
            this._T_y = new Shape();
            var _local2:Graphics = this._T_y.graphics;
            _local2.clear();
            _local2.beginFill(0, 0.8);
            _local2.drawRect(0, 0, 800, 600);
            _local2.endFill();
            addChild(this._T_y);
            if (_arg1)
            {
                this._dY_(new _L__());
            } else
            {
                this.start();
            }
        }
        private function start():void{
            if (!Account._get().isRegistered())
            {
                this.register();
            } else
            {
                this._X_d();
            }
        }
        private function _X_d():void{
            this._np();
            this._zH_ = new WebRequest(Parameters.getAccountServerIP(), "/account", true);
            this._zH_.addEventListener(WebRequestSuccessEvent.GENERIC_DATA, this._3p);
            this._zH_.addEventListener(WebRequestErrorEvent.TEXT_ERROR, this._D_x);
            this._zH_.sendRequest("verify", Account._get().credentials());
        }
        private function _3p(_arg1:WebRequestSuccessEvent):void {
            AccountManagementScreen.openNext = true;
            dispatchEvent(new Event(Event.COMPLETE));//this._dY_(new _0G_d(XML(_arg1.data_)));
        }
        private function _D_x(_arg1:WebRequestErrorEvent):void{
            Account._get().clear();
            this._dY_(new _L__());
        }
        private function register():void{
            this._dY_(new _0L_h());
        }
        private function _dY_(_arg1:Frame):void{
            this._np();
            _arg1.addEventListener(_nJ_.DONE, this._F_H_);
            _arg1.addEventListener(_nJ_._tp, this._L_L_);
            _arg1.addEventListener(_nJ_._G__, this._mO_);
            _arg1.addEventListener(_nJ_._2K_, this._q5);
            _arg1.addEventListener(_nJ_._lS_, this._08Y_);
            _arg1.addEventListener(_nJ_.CHANGE, this._bR_);
            addChild(_arg1);
            this._Z_X_ = _arg1;
        }
        private function _F_H_(_arg1:_nJ_):void{
            dispatchEvent(new Event(Event.COMPLETE));
        }
        private function _L_L_(_arg1:_nJ_):void{
            this._X_d();
        }
        private function _mO_(_arg1:_nJ_):void{
            this._dY_(new _0L_h());
        }
        private function _q5(_arg1:_nJ_):void{
            this._dY_(new _L__());
        }
        private function _08Y_(_arg1:_nJ_):void{
            this._dY_(new _F_V_());
        }
        private function _bR_(_arg1:_nJ_):void{
            this._dY_(new _ag());
        }
        private function _np():void{
            if (((!((this._Z_X_ == null))) && (contains(this._Z_X_))))
            {
                removeChild(this._Z_X_);
            }
        }

    }
}//package AccountWebrequests

