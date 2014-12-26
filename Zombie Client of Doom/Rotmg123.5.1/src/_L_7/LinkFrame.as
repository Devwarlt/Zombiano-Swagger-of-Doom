// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_L_7.LinkFrame

package _L_7{
    import Frames.Frame;
    import com.company.ui.SimpleText;
    import Frames.TextInput;
    import flash.text.StyleSheet;
    import flash.filters.DropShadowFilter;
    import flash.events.MouseEvent;
    import _qN_.Account;
    import _Z_h._m7;
    import com.company.assembleegameclient.appengine.WebRequest;
    import com.company.assembleegameclient.parameters.Parameters;
    import _zo._8C_;
    import _zo._mS_;

    internal class LinkFrame extends Frame {

        private static const _K_z:String = ".in { margin-left:10px; text-indent: -10px; }";
        private static const _05T_:String = ((((('<font color="#FF0000"><b>WARNING:</b></font> ' + "You will ") + '<font color="#FF0000"><b>LOSE ALL PROGRESS, GOLD, ETC.</b></font> ') + "in your current Kongregate account.  This process ") + '<font color="#FF0000"><b>CAN NOT BE REVERSED</b></font>.  ') + "Think carefully before hitting Replace.");

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
            this._xb = new TextInput("Username", false, "");
            addTextInput(this._xb);
            this.password_ = new TextInput("Password", true, "");
            addTextInput(this.password_);
            Button1.addEventListener(MouseEvent.CLICK, this.onCancel);
            Button2.addEventListener(MouseEvent.CLICK, this.onLink);
        }
        private function onCancel(_arg1:MouseEvent):void{
            dispatchEvent(new _Y_S_(_Y_S_._tp));
        }
        private function onLink(_arg1:MouseEvent):void{
            if (this._xb.text() == "")
            {
                this._xb._0B_T_("Not a valid username");
                return;
            }
            if (this.password_.text() == "")
            {
                this.password_._0B_T_("Password too short");
                return;
            }
            var _local2:_m7 = (Account._get() as _m7);
            var _local3:WebRequest = new WebRequest(Parameters._fK_(), "/kongregate", true);
            _local3.addEventListener(_8C_.GENERIC_DATA, this._018);
            _local3.addEventListener(_mS_.TEXT_ERROR, this._bi);
            _local3.sendRequest("link", {
                "userId":_local2._nq.services.getUserId(),
                "gameAuthToken":_local2._nq.services.getGameAuthToken(),
                "guid":this._xb.text(),
                "password":this.password_.text()
            });
            _pW_();
        }
        private function _018(_arg1:_8C_):void{
            var _local2:XML = new XML(_arg1.data_);
            Account._get().modify(_local2.GUID, null, _local2.Secret);
            dispatchEvent(new _Y_S_(_Y_S_._tp));
        }
        private function _bi(_arg1:_mS_):void{
            this.password_._0B_T_(_arg1.text_);
            _for();
        }

    }
}//package _L_7

