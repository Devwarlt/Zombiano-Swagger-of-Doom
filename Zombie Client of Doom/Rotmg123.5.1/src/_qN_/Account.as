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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// either expressed or implied, of the FreeBSD Project.

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
            return (this.admin_);
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

