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

//AccountWebrequests._0L_h

package AccountWebrequests{
    import Frames.Frame;
import Frames.TextInput;
import Frames.TextInputBig;
import Frames.TextInputSmall;
import Frames._zb;
    
    import _qN_.Account;
    
    import WebRequestEvents.WebRequestSuccessEvent;
    import WebRequestEvents.WebRequestErrorEvent;
    
    import com.company.assembleegameclient.appengine.WebRequest;
    import com.company.assembleegameclient.parameters.Parameters;
    import com.company.assembleegameclient.ui.TextButton;
    import com.company.util._9S_;
    
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;

    internal class _0L_h extends Frame {

        public var username_:TextInput;
		public var email_:TextInput;
        public var password_:TextInput;
        public var password2_:TextInput;
        public var _8n:_zb;
        public var _k4:TextButton;

        public function _0L_h(_arg1:Boolean=true){
            super("Register in order to save your progress", "Cancel", "Register");
            this.username_ = new TextInputSmall("Username", false, "");
            addTextInput(this.username_);
			this.email_ = new TextInputSmall("Email", false, "");
			addTextInput(this.email_);
            this.password_ = new TextInputSmall("Password", true, "");
            addTextInput(this.password_);
            this.password2_ = new TextInputSmall("Retype Password", true, "");
            addTextInput(this.password2_);
            this._8n = new _zb((('I agree to the <font color="#7777EE"><a href="' + Parameters.ToS_Url_) + '" target="_blank">Terms of Use</a></font>.'), false, "");
            _O_1(this._8n);
            if (_arg1)
            {
                this._k4 = new TextButton(12, false, "Already Registered?  Click here to Sign In");
                addTextButton(this._k4);
            }
            Button1.addEventListener(MouseEvent.CLICK, this.onCancel);
            Button2.addEventListener(MouseEvent.CLICK, this._mO_);
			this.addEventListener(Event.ADDED_TO_STAGE, this.onAdded);
			this.addEventListener(Event.REMOVED_FROM_STAGE, this.onRemoved);
            if (_arg1)
            {
                this._k4.addEventListener(MouseEvent.CLICK, this._q5);
            }
        }
        private function onCancel(_arg1:MouseEvent):void{
            dispatchEvent(new _nJ_(_nJ_.DONE));
        }
        private function _mO_(_arg1:MouseEvent):void{
            if (!_9S_._02A_(this.username_.text()))
            {
                this.username_.setErrorText("Not a valid username");
                return;
            }
            if (!_9S_.isEmail(this.email_.text()))
			{
				this.email_.setErrorText("Not a valid email address");
				return;
			}
            if (this.password_.text().length < 5)
            {
                this.password_.setErrorText("Password too short");
                return;
            }
            if (this.password_.text() != this.password2_.text())
            {
                this.password2_.setErrorText("Password does not match");
                return;
            }
            if (!this._8n._u6())
            {
                this._8n._0B_T_("Must agree to register");
                return;
            }
            var _local2:WebRequest = new WebRequest(Parameters.getAccountServerIP(), "/account", true);
            _local2.addEventListener(WebRequestSuccessEvent.GENERIC_DATA, this._Q__);
            _local2.addEventListener(WebRequestErrorEvent.TEXT_ERROR, this._J_o);
            _local2.sendRequest("register", {
                "guid":Account._get().guid(),
                "newGUID":this.username_.text(),
				"email":this.email_.text(),
                "newPassword":this.password_.text(),
                "entrytag":Account._get().entrytag()
            });
            lockButtons();
        }
        private function _Q__(_arg1:WebRequestSuccessEvent):void{
            Account._get().modify(this.username_.text(), this.password_.text(), null);
            dispatchEvent(new _nJ_(_nJ_._tp));
        }
        private function _J_o(_arg1:WebRequestErrorEvent):void{
            this.username_.setErrorText(_arg1.text_);
            releaseButtons();
        }
        private function _q5(_arg1:MouseEvent):void{
            dispatchEvent(new _nJ_(_nJ_._2K_));
        }
		
		private function onAdded(e:Event):void{
			this.addEventListener(KeyboardEvent.KEY_DOWN, this.onKeyPressed);
		}
		private function onRemoved(e:Event):void{
			this.removeEventListener(KeyboardEvent.KEY_DOWN, this.onKeyPressed);
		}
		private function onKeyPressed(e:KeyboardEvent):void{
			
			if (e.keyCode == 13) {
				this._mO_(null);
			}
		}

    }
}//package AccountWebrequests

