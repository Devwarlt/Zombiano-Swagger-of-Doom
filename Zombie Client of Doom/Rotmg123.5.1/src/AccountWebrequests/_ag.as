// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//AccountWebrequests._ag

package AccountWebrequests{
    import Frames.Frame;
    import Frames.TextInput;
    import flash.events.MouseEvent;
    import com.company.assembleegameclient.appengine.WebRequest;
    import com.company.assembleegameclient.parameters.Parameters;
    import WebRequestEvents.WebRequestSuccessEvent;
    import WebRequestEvents.WebRequestErrorEvent;
    import _qN_.Account;

    public class _ag extends Frame {

        public var password_:TextInput;
        public var _sY_:TextInput;
        public var _a9:TextInput;

        public function _ag(){
            super("Change your password", "Cancel", "Submit");
            this.password_ = new TextInput("Password", true, "");
            addTextInput(this.password_);
            this._sY_ = new TextInput("New Password", true, "");
            addTextInput(this._sY_);
            this._a9 = new TextInput("Retype New Password", true, "");
            addTextInput(this._a9);
            Button1.addEventListener(MouseEvent.CLICK, this.onCancel);
            Button2.addEventListener(MouseEvent.CLICK, this._bR_);
        }
        private function onCancel(_arg1:MouseEvent):void{
            dispatchEvent(new _nJ_(_nJ_._tp));
        }
        private function _bR_(_arg1:MouseEvent):void{
            if (this.password_.text().length < 5)
            {
                this.password_.setErrorText("Incorrect password");
                return;
            }
            if (this._sY_.text().length < 5)
            {
                this._sY_.setErrorText("Password too short");
                return;
            }
            if (this._sY_.text() != this._a9.text())
            {
                this._a9.setErrorText("Password does not match");
                return;
            }
            var _local2:WebRequest = new WebRequest(Parameters.getAccountServerIP(), "/account", true);
            _local2.addEventListener(WebRequestSuccessEvent.GENERIC_DATA, this._0K_H_);
            _local2.addEventListener(WebRequestErrorEvent.TEXT_ERROR, this._1X_);
            _local2.sendRequest("changePassword", {
                "guid":Account._get().guid(),
                "password":this.password_.text(),
                "newPassword":this._sY_.text()
            });
            lockButtons();
        }
        private function _0K_H_(_arg1:WebRequestSuccessEvent):void{
            Account._get().modify(Account._get().guid(), this._sY_.text(), null);
            dispatchEvent(new _nJ_(_nJ_._tp));
        }
        private function _1X_(_arg1:WebRequestErrorEvent):void{
            this.password_.setErrorText(_arg1.text_);
            releaseButtons();
        }

    }
}//package AccountWebrequests

