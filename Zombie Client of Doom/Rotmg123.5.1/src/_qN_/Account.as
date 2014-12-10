// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_qN_.Account

package _qN_{
    import flash.display.LoaderInfo;
    import _Z_h._m7;
    import _01H_._f7;
    import _0B_2._1T_;
    import _00g.WebAccount;
    import flash.display.Stage;
    import com.company.assembleegameclient.parameters.Parameters;
    import flash.display.Sprite;

    public class Account {

        private static var _N_7:Account = null;

        public static function load(_arg1:Stage, _arg2:Function):void{
            var _local3:Object = LoaderInfo(_arg1.root.loaderInfo).parameters;
            if (_local3.kongregate_api_path != null)
            {
                _N_7 = new _m7();
            } else
            {
                if (_local3.steam_api_path)
                {
                    _N_7 = new _f7();
                } else
                {
                    if (_local3.kabam_signed_request != null)
                    {
                        _N_7 = new _1T_();
                    } else
                    {
                        _N_7 = new WebAccount();
                    }
                }
            }
            _N_7.internalLoad(_arg1, _arg2);
        }
        public static function _get():Account{
            if (_N_7 == null)
            {
                _N_7 = new WebAccount();
            }
            return (_N_7);
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
            Parameters._hk = true;
        }
        public function reportIntStat(_arg1:String, _arg2:int):void{
        }
        public function newAccountText():_9j{
            return (null);
        }
        public function newAccountManagement():Sprite{
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

