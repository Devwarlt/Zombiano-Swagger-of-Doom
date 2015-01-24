// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_rK_.LinkFrame

package _rK_{
    import Frames.Frame;
    import com.company.ui.SimpleText;
    import Frames.TextInput;
    import flash.text.StyleSheet;
    import flash.filters.DropShadowFilter;
    import flash.events.MouseEvent;
    import _qN_.Account;
    import _01H_._f7;
    import com.company.assembleegameclient.appengine.WebRequest;
    import com.company.assembleegameclient.parameters.Parameters;
    import WebRequestEvents.WebRequestSuccessEvent;
    import WebRequestEvents.WebRequestErrorEvent;

    internal class LinkFrame extends Frame {

        private static const _K_z:String = ".in { margin-left:10px; text-indent: -10px; }";
        private static const _05T_:String = ((((('<font color="#FF0000"><b>WARNING:</b></font> ' + "You will ") + '<font color="#FF0000"><b>LOSE ALL PROGRESS, GOLD, ETC.</b></font> ') + "in your current Steamworks account.  This process ") + '<font color="#FF0000"><b>CAN NOT BE REVERSED</b></font>.  ') + "Think carefully before hitting Replace.");

        private var _P_H_:SimpleText;
        public var _xb:TextInput;
        public var password_:TextInput;

        public function LinkFrame(){
            super("Replace with an existing web account", "Cancel", "Replace");
            h_ = (h_ + 4);
            var _local1:StyleSheet = new StyleSheet();
            _local1.parseCSS(_K_z);
            this._P_H_ = new SimpleText(14, 16549442, false, (w_ - 32), 0, "Myriad Pro");
            this._P_H_.styleSheet = _local1;
            this._P_H_.wordWrap = true;
            this._P_H_.htmlText = (("<span class='in'>" + _05T_) + "</span>");
            this._P_H_._08S_();
            this._P_H_.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
            this._P_H_.x = 17;
            this._P_H_.y = (h_ - 66);
            addChild(this._P_H_);
            h_ = (h_ + 88);
            this._xb = new TextInput("Email", false, "");
            addTextInput(this._xb);
            this.password_ = new TextInput("Password", true, "");
            addTextInput(this.password_);
            Button1.addEventListener(MouseEvent.CLICK, this.onCancel);
            Button2.addEventListener(MouseEvent.CLICK, this.onLink);
        }
        private function onCancel(_arg1:MouseEvent):void{
            dispatchEvent(new _07s(_07s._tp));
        }
        private function onLink(_arg1:MouseEvent):void{
            if (this._xb.text() == "")
            {
                this._xb._0B_T_("Not a valid email address");
                return;
            }
            if (this.password_.text() == "")
            {
                this.password_._0B_T_("Password too short");
                return;
            }
            var _local2:_f7 = (Account._get() as _f7);
            var _local3:WebRequest = new WebRequest(Parameters._fK_(), "/steamworks", true);
            _local3.addEventListener(WebRequestSuccessEvent.GENERIC_DATA, this._018);
            _local3.addEventListener(WebRequestErrorEvent.TEXT_ERROR, this._bi);
            _local3.sendRequest("link", {
                "steamid":_local2._Z_d.getSteamID(),
                "sessionticket":_local2._Z_d.getAuthSessionTicket(),
                "guid":this._xb.text(),
                "password":this.password_.text()
            });
            _pW_();
        }
        private function _018(_arg1:WebRequestSuccessEvent):void{
            var _local2:XML = new XML(_arg1.data_);
            Account._get().modify(_local2.GUID, null, _local2.Secret);
            dispatchEvent(new _07s(_07s._tp));
        }
        private function _bi(_arg1:WebRequestErrorEvent):void{
            this.password_._0B_T_(_arg1.text_);
            _for();
        }

    }
}//package _rK_

