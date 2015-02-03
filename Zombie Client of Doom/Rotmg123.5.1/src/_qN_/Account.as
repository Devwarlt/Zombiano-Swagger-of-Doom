// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_qN_.Account

package _qN_{
    import _00g.WebAccount;
    import flash.display.Stage;
    import com.company.assembleegameclient.parameters.Parameters;
    import flash.display.Sprite;

    public class Account {

        private static var _account:Account = null;

        public static function load(_arg1:Stage, _arg2:Function):void{
            _account = new WebAccount();
            _account.internalLoad(_arg1, _arg2);
        }
        public static function _get():Account{
            if (_account == null)
                _account = new WebAccount();
            return _account;
        }

        public var admin_:Boolean = false;

        public function guid():String{
            return (null);
        }
        public function password():String{
            return ("");
        }
        public function secret():String{
            return ("");
        }
        public function credentials():Object{
            return (null);
        }
        public function isRegistered():Boolean{
            return (false);
        }
        public function isAdmin():Boolean{
            return (admin_);
        }
        protected function internalLoad(_arg1:Stage, _arg2:Function):void{
        }
        public function modify(_arg1:String, _arg2:String, _arg3:String):void{
        }
        public function clear():void{
            Parameters.doLogin = true;
        }
        public function reportIntStat(_arg1:String, _arg2:int):void{
        }
        public function newAccountText():_9j{
            return (null);
        }
        public function newAccountManagement(accountXml:XML):Sprite{
            return (null);
        }
        public function showInGameRegister(_arg1:Stage):void{
        }
        public function cacheOffers():void{
        }
        public function showMoneyManagement(_arg1:Stage):void{
        }
        public function gameNetworkUserId():String{
            return ("");
        }
        public function gameNetwork():String{
            return (null);
        }
        public function playPlatform():String{
            return (null);
        }
        public function entrytag():String{
            return (null);
        }

    }
}//package _qN_

