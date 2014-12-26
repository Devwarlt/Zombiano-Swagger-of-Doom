// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_rK_._0L_h

package _rK_{
    import Frames.Frame;
    import Frames.TextInput;
    import Frames._zb;
    import com.company.assembleegameclient.parameters.Parameters;
    import flash.events.MouseEvent;
    import com.company.util._9S_;
    import _qN_.Account;
    import _01H_._f7;
    import com.company.assembleegameclient.appengine.WebRequest;
    import _zo._8C_;
    import _zo._mS_;

    internal class _0L_h extends Frame {

        public var _xb:TextInput;
        public var password_:TextInput;
        public var _0L_Y_:TextInput;
        public var _8n:_zb;

        public function _0L_h(){
            super("Register a web account in order to play anywhere", "Cancel", "Register");
            this._xb = new TextInput("Email", false, "");
            addTextInput(this._xb);
            this.password_ = new TextInput("Password", true, "");
            addTextInput(this.password_);
            this._0L_Y_ = new TextInput("Retype Password", true, "");
            addTextInput(this._0L_Y_);
            this._8n = new _zb((('I agree to the <font color="#7777EE"><a href="' + Parameters.ToS_Url_) + '" target="_blank">Terms of Use</a></font>.'), false, "");
            _O_1(this._8n);
            Button1.addEventListener(MouseEvent.CLICK, this.onCancel);
            Button2.addEventListener(MouseEvent.CLICK, this._mO_);
        }
        private function onCancel(_arg1:MouseEvent):void{
            dispatchEvent(new _07s(_07s._tp));
        }
        private function _mO_(_arg1:MouseEvent):void{
            if (!_9S_._02A_(this._xb.text()))
            {
                this._xb._0B_T_("Not a valid email address");
                return;
            }
            if (this.password_.text().length < 5)
            {
                this.password_._0B_T_("Password too short");
                return;
            }
            if (this.password_.text() != this._0L_Y_.text())
            {
                this._0L_Y_._0B_T_("Password does not match");
                return;
            }
            if (!this._8n._u6())
            {
                this._8n._0B_T_("Must agree to register");
                return;
            }
            var _local2:_f7 = (Account._get() as _f7);
            var _local3:WebRequest = new WebRequest(Parameters._fK_(), "/steamworks", true);
            _local3.addEventListener(_8C_.GENERIC_DATA, this._Q__);
            _local3.addEventListener(_mS_.TEXT_ERROR, this._J_o);
            _local3.sendRequest("register", {
                "steamid":_local2._Z_d.getSteamID(),
                "sessionticket":_local2._Z_d.getAuthSessionTicket(),
                "newGUID":this._xb.text(),
                "newPassword":this.password_.text(),
                "entrytag":_local2.entrytag()
            });
            _pW_();
        }
        private function _Q__(_arg1:_8C_):void{
            var _local2:XML = new XML(_arg1.data_);
            Account._get().modify(_local2.GUID, null, _local2.Secret);
            dispatchEvent(new _07s(_07s._tp));
        }
        private function _J_o(_arg1:_mS_):void{
            this._xb._0B_T_(_arg1.text_);
            _for();
        }

    }
}//package _rK_

