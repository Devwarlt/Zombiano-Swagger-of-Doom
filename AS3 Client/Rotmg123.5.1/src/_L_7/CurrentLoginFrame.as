// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_L_7.CurrentLoginFrame

package _L_7{
    import _0D_d.Frame;
    import com.company.ui.SimpleText;
    import com.company.assembleegameclient.ui.TextButton;
    import _qN_.Account;
    import _Z_h._m7;
    import flash.filters.DropShadowFilter;
    import flash.events.MouseEvent;
    import _L_7._Y_S_;

    internal class CurrentLoginFrame extends Frame {

        public var _lv:SimpleText;
        public var _Z_a:SimpleText;
        public var _O_c:SimpleText;
        public var _ba:SimpleText;
        public var _static:TextButton;
        public var _qh:TextButton;

        public function CurrentLoginFrame(){
            super("Current account", "", "Continue", "/kongregateCurrentLogin");
            var _local1:_m7 = (Account._get() as _m7);
            this._lv = new SimpleText(18, 0xB3B3B3, false, 0, 0, "Myriad Pro");
            this._lv._8Y_(true);
            this._lv.text = "Kongregate user:";
            this._lv._08S_();
            this._lv.filters = [new DropShadowFilter(0, 0, 0)];
            this._lv.y = (h_ - 60);
            this._lv.x = 17;
            addChild(this._lv);
            this._Z_a = new SimpleText(16, 0xB3B3B3, false, 238, 30, "Myriad Pro");
            this._Z_a.text = _local1._2J_();
            this._Z_a._08S_();
            this._Z_a.y = (h_ - 30);
            this._Z_a.x = 17;
            addChild(this._Z_a);
            h_ = (h_ + 88);
            if (_local1._aT_())
            {
                h_ = (h_ - 20);
                this._O_c = new SimpleText(18, 0xB3B3B3, false, 0, 0, "Myriad Pro");
                this._O_c._8Y_(true);
                this._O_c.text = "Linked with the web account:";
                this._O_c._08S_();
                this._O_c.filters = [new DropShadowFilter(0, 0, 0)];
                this._O_c.y = (h_ - 60);
                this._O_c.x = 17;
                addChild(this._O_c);
                this._ba = new SimpleText(16, 0xB3B3B3, false, 238, 30, "Myriad Pro");
                this._ba.text = _local1.guid();
                this._ba._08S_();
                this._ba.y = (h_ - 30);
                this._ba.x = 17;
                addChild(this._ba);
                h_ = (h_ + 88);
            } else
            {
                this._static = new TextButton(12, false, "Register this account as a web account");
                this._qh = new TextButton(12, false, "Replace this account with an existing web account");
                __true(this._qh);
                this._static.addEventListener(MouseEvent.CLICK, this._mO_);
                this._qh.addEventListener(MouseEvent.CLICK, this.onLink);
            }
            Button2.addEventListener(MouseEvent.CLICK, this._03t);
        }
        private function _03t(_arg1:MouseEvent):void{
            dispatchEvent(new _Y_S_(_Y_S_.DONE));
        }
        public function _mO_(_arg1:MouseEvent):void{
            dispatchEvent(new _Y_S_(_Y_S_._G__));
        }
        public function onLink(_arg1:MouseEvent):void{
            dispatchEvent(new _Y_S_(_Y_S_.LINK));
        }

    }
}//package _L_7

