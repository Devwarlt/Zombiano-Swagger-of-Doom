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

//AccountWebrequests._L__

package AccountWebrequests{
import AccountManagement.AccountEventDispatcher;

import Frames.Frame;
    import Frames.TextInput;
    import com.company.assembleegameclient.ui.TextButton;
    import flash.events.MouseEvent;
    import com.company.assembleegameclient.appengine.WebRequest;
    import com.company.assembleegameclient.parameters.Parameters;
    import WebRequestEvents.WebRequestSuccessEvent;
    import WebRequestEvents.WebRequestErrorEvent;
    import _qN_.Account;
    import flash.events.Event;
    import flash.events.KeyboardEvent;

    internal class _L__ extends Frame {

        public var _xb:TextInput;
        public var password_:TextInput;
        public var _5K_:TextButton;
        public var _static:TextButton;

        public function _L__(){
            super("Sign in", "Cancel", "Sign in");
            this._xb = new TextInput("Username", false, "");
            addTextInput(this._xb);
            this.password_ = new TextInput("Password", true, "");
            addTextInput(this.password_);
            this._5K_ = new TextButton(12, false, "Forgot your password?  Click here");
            addTextButton(this._5K_);
            this._static = new TextButton(12, false, "New user?  Click here to Register");
            addTextButton(this._static);
            Button1.addEventListener(MouseEvent.CLICK, this.onCancel);
            Button2.addEventListener(MouseEvent.CLICK, this._q5);
            this._5K_.addEventListener(MouseEvent.CLICK, this._08Y_);
            this._static.addEventListener(MouseEvent.CLICK, this._mO_);
			this.addEventListener(Event.ADDED_TO_STAGE, this.onAdded);
			this.addEventListener(Event.REMOVED_FROM_STAGE, this.onRemoved);
        }
        private function onCancel(_arg1:MouseEvent):void{
            dispatchEvent(new _nJ_(_nJ_.DONE));
        }
        private function _q5(_arg1:MouseEvent):void{
            if (this._xb.text() == "")
            {
                this._xb.setErrorText("Not a valid username");
                return;
            }
            if (this.password_.text() == "")
            {
                this.password_.setErrorText("Password too short");
                return;
            }
            var _local2:WebRequest = new WebRequest(Parameters.getAccountServerIP(), "/account", true);
            _local2.addEventListener(WebRequestSuccessEvent.GENERIC_DATA, this._G_L_);
            _local2.addEventListener(WebRequestErrorEvent.TEXT_ERROR, this._V_5);
            _local2.sendRequest("verify", {
                "guid":this._xb.text(),
                "password":this.password_.text()
            });
            AccountEventDispatcher.logoutWasForced = true;
            lockButtons();
        }
        private function _G_L_(_arg1:WebRequestSuccessEvent):void{
            Account._get().modify(this._xb.text(), this.password_.text(), null);
            dispatchEvent(new _nJ_(_nJ_._tp));
        }
        private function _V_5(_arg1:WebRequestErrorEvent):void{
            this.password_.setErrorText(_arg1.text_);
            releaseButtons();
        }
        private function _08Y_(_arg1:MouseEvent):void{
            dispatchEvent(new _nJ_(_nJ_._lS_));
        }
        private function _mO_(_arg1:MouseEvent):void{
            dispatchEvent(new _nJ_(_nJ_._G__));
        }
		
		private function onAdded(e:Event):void{
			this.addEventListener(KeyboardEvent.KEY_DOWN, this.onKeyPressed);
		}
		private function onRemoved(e:Event):void{
			this.removeEventListener(KeyboardEvent.KEY_DOWN, this.onKeyPressed);
		}
		private function onKeyPressed(e:KeyboardEvent):void{
			
			if (e.keyCode == 13) {
				this._q5(null);
			}
		}

    }
}//package AccountWebrequests

