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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// either expressed or implied, of the FreeBSD Project.// either expressed or implied, of the FreeBSD Project.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.util.AssetLibrary

package com.company.util{
    import flash.utils.Dictionary;
    import flash.display.BitmapData;
    import flash.media.Sound;
    import flash.media.SoundTransform;

    public class AssetLibrary {

        private static var _W_u:Dictionary = new Dictionary();
        private static var _08l:Dictionary = new Dictionary();
        private static var _6x:Dictionary = new Dictionary();
        private static var _4d:Dictionary = new Dictionary();

        public function AssetLibrary(_arg1:StaticEnforcer){
        }
        public static function _9_(_arg1:String, _arg2:BitmapData):void{
            _W_u[_arg1] = _arg2;
            _4d[_arg2] = _arg1;
        }
        public static function _05q(_arg1:String, _arg2:BitmapData, _arg3:int, _arg4:int):void{
            _W_u[_arg1] = _arg2;
            var _local5:_kp = new _kp();
            _local5.addFromBitmapData(_arg2, _arg3, _arg4);
            _08l[_arg1] = _local5;
            var _local6:int;
            while (_local6 < _local5._W_u.length)
            {
                _4d[_local5._W_u[_local6]] = [_arg1, _local6];
                _local6++;
            }
        }
        public static function _0F_R_(_arg1:String, _arg2:BitmapData):void{
            var _local3:_kp = _08l[_arg1];
            if (_local3 == null)
            {
                _local3 = new _kp();
                _08l[_arg1] = _local3;
            }
            _local3.add(_arg2);
            var _local4:int = (_local3._W_u.length - 1);
            _4d[_local3._W_u[_local4]] = [_arg1, _local4];
        }
        public static function _tl(_arg1:String, _arg2:Class):void{
            var _local3:Array = _6x[_arg1];
            if (_local3 == null)
            {
                _6x[_arg1] = [];
            }
            _6x[_arg1].push(_arg2);
        }
        public static function _eT_(_arg1:BitmapData):Object{
            return (_4d[_arg1]);
        }
        public static function getImage(_arg1:String):BitmapData{
            return (_W_u[_arg1]);
        }
        public static function _18(_arg1:String):_kp{
            return (_08l[_arg1]);
        }
        public static function _xK_(_arg1:String, _arg2:int):BitmapData{
            var _local3:_kp = _08l[_arg1];
            return (_local3._W_u[_arg2]);
        }
        public static function _I_w(_arg1:String):Sound{
            var _local2:Array = _6x[_arg1];
            var _local3:int = (Math.random() * _local2.length);
            return (new (_6x[_arg1][_local3])());
        }
        public static function _05M_(_arg1:String, _arg2:Number=1):void{
            var _local3:Array = _6x[_arg1];
            var _local4:int = (Math.random() * _local3.length);
            var _local5:Sound = new (_6x[_arg1][_local4])();
            var _local6:SoundTransform;
            if (_arg2 != 1)
            {
                _local6 = new SoundTransform(_arg2);
            }
            _local5.play(0, 0, _local6);
        }

    }
}//package com.company.util

class StaticEnforcer {

}

