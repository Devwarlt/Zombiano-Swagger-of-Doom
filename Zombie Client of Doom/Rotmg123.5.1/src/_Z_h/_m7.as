// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_Z_h._m7

package _Z_h{
    import _qN_.Account;
    import flash.display.Stage;
    import com.company.util._9S_;
    import flash.display.LoaderInfo;
    import flash.system.Security;
    import flash.net.URLRequest;
    import flash.display.Loader;
    import flash.events.Event;
    import flash.net.SharedObject;
    import com.company.assembleegameclient.util.GUID;
    import com.company.assembleegameclient.appengine.WebRequest;
    import com.company.assembleegameclient.parameters.Parameters;
    import _zo._8C_;
    import _zo._mS_;
    import _0L_C_._qM_;
    import _9R_._W_h;
    import _L_7._rS_;
    import _qN_._9j;
    import _L_7._mf;
    import flash.display.Sprite;
    import com.company.assembleegameclient.appengine._02k;
    import _L_7._O_Z_;
    import com.company.assembleegameclient.util.*;

    public class _m7 extends Account {

        public static const _000:String = "kongregate";

        public var _nq;
        private var _ya:String = null;
        private var guid_:String = null;
        private var secret_:String = null;
        private var _cd:Stage;
        private var callback_:Function;

        override public function guid():String{
            return (this.guid_);
        }
        override public function secret():String{
            return ((((this.secret_)==null) ? "" : this.secret_));
        }
        override public function credentials():Object{
            return ({
                "guid":this.guid(),
                "secret":this.secret()
            });
        }
        override public function isRegistered():Boolean{
            return (!((this.secret() == "")));
        }
        public function _aT_():Boolean{
            return (_9S_._02A_(this.guid_));
        }
        public function _2J_():String{
            return (this._nq.services.getUsername());
        }
        override public function gameNetworkUserId():String{
            return (this._nq.services.getUserId());
        }
        override public function gameNetwork():String{
            return (_000);
        }
        override public function playPlatform():String{
            return ("kongregate");
        }
        override protected function internalLoad(_arg1:Stage, _arg2:Function):void{
            this._cd = _arg1;
            this.callback_ = _arg2;
            var _local3:Object = LoaderInfo(_arg1.root.loaderInfo).parameters;
            var _local4:String = _local3.kongregate_api_path;
            Security.allowDomain(_local4);
            var _local5:URLRequest = new URLRequest(_local4);
            var _local6:Loader = new Loader();
            _local6.contentLoaderInfo.addEventListener(Event.COMPLETE, this._02n);
            _local6.load(_local5);
            _arg1.addChild(_local6);
        }
        override public function modify(_arg1:String, _arg2:String, _arg3:String):void{
            this.guid_ = _arg1;
            this.secret_ = _arg3;
        }
        override public function reportIntStat(_arg1:String, _arg2:int):void{
            this._nq.stats.submit(_arg1, _arg2);
        }
        private function _02n(_arg1:Event):void{
            var _local2:SharedObject;
            this._nq = _arg1.target.content;
            Security.allowDomain(this._nq.loaderInfo.url);
            this._nq.services.connect();
            try
            {
                _local2 = SharedObject.getLocal("KongregateRotMG", "/");
                if (_local2.data.hasOwnProperty("GuestGUID"))
                {
                    this._ya = _local2.data["GuestGUID"];
                }
            } catch(error:Error)
            {
            }
            if (this._ya == null)
            {
                this._ya = GUID.create();
                try
                {
                    _local2 = SharedObject.getLocal("KongregateRotMG", "/");
                    _local2.data["GuestGUID"] = this._ya;
                    _local2.flush();
                } catch(error:Error)
                {
                }
            }
            if (this._nq.services.isGuest())
            {
                this.guid_ = this._ya;
                this.secret_ = "";
                this._nq.services.addEventListener("login", this._pQ_);
                this.callback_();
                return;
            }
            var _local3:WebRequest = new WebRequest(Parameters._fK_(), "/kongregate", true, 2);
            _local3.addEventListener(_8C_.GENERIC_DATA, this._6l);
            _local3.addEventListener(_mS_.TEXT_ERROR, this._T_);
            _local3.sendRequest("getcredentials", {
                "userId":this._nq.services.getUserId(),
                "username":this._nq.services.getUsername(),
                "gameAuthToken":this._nq.services.getGameAuthToken()
            });
        }
        private function _6l(_arg1:_8C_):void{
            var _local2:XML = new XML(_arg1.data_);
            this.guid_ = _local2.GUID;
            this.secret_ = _local2.Secret;
            this.callback_();
        }
        private function _T_(_arg1:_mS_):void{
            this._cd.addChild(new _qM_(("Error: " + _arg1.text_)));
        }
        private function _pQ_(_arg1:Event):void{
            var _local2:WebRequest = new WebRequest(Parameters._fK_(), "/kongregate", true, 2);
            _local2.addEventListener(_8C_.GENERIC_DATA, this._I_9);
            _local2.addEventListener(_mS_.TEXT_ERROR, this._0T_);
            _local2.sendRequest("internalRegister", {
                "userId":this._nq.services.getUserId(),
                "username":this._nq.services.getUsername(),
                "gameAuthToken":this._nq.services.getGameAuthToken(),
                "guid":this._ya
            });
        }
        private function _0T_(_arg1:_mS_):void{
            this._cd.addChild(new _qM_(("Error: " + _arg1.text_)));
        }
        private function _I_9(_arg1:_8C_):void{
            var _local2:XML = new XML(_arg1.data_);
            this.guid_ = _local2.GUID;
            this.secret_ = _local2.Secret;
            this._cd.dispatchEvent(new _W_h());
        }
        override public function newAccountText():_9j{
            return (new _rS_());
        }
        override public function newAccountManagement():Sprite{
            var _local1:_m7;
            if (!Account._get().isRegistered())
            {
                _local1 = (Account._get() as _m7);
                _local1._nq.services.showRegistrationBox();
                return (null);
            }
            return (new _mf());
        }
        override public function showInGameRegister(_arg1:Stage):void{
            this._nq.services.showRegistrationBox();
        }
        override public function cacheOffers():void{
            _02k._U_t("/kongregate", null);
        }
        override public function showMoneyManagement(_arg1:Stage):void{
            _arg1.addChild(new _O_Z_());
        }
        override public function entrytag():String{
            return ("kongregate");
        }

    }
}//package _Z_h

