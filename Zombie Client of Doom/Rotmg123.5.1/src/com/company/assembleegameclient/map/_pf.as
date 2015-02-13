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

//com.company.assembleegameclient.map._pf

package com.company.assembleegameclient.map{
    import flash.utils.Dictionary;
    import com.company.assembleegameclient.objects._Z_H_;
    import flash.display.BitmapData;
    import com.company.util.BitmapUtil;

    public class _pf {

        public static const _020:Dictionary = new Dictionary();
        public static const _Q_F_:Dictionary = new Dictionary();
        public static const _V_a:Dictionary = new Dictionary();

        private static var _G_x:Dictionary = new Dictionary();
        public static var _pb:Dictionary = new Dictionary();
        public static var _w8:_C_O_;

        public static function _nY_(_arg1:XML):void{
            var _local2:XML;
            var _local3:int;
            for each (_local2 in _arg1.Ground)
            {
                _local3 = int(_local2.@type);
                _020[_local3] = new _C_O_(_local2);
                _Q_F_[_local3] = _local2;
                _V_a[_local3] = new _Z_H_(_local2);
                _pb[String(_local2.@id)] = _local3;
            }
            _w8 = _020[0xFF];
        }
        public static function _6H_(_arg1:int):String{
            var _local2:_C_O_ = _020[_arg1];
            if (_local2 == null)
            {
                return (null);
            }
            return (_local2.id_);
        }
        public static function getBitmapData(_arg1:int, _arg2:int=0):BitmapData{
            return (_V_a[_arg1].getTexture(_arg2));
        }
        public static function getColor(_arg1:int):uint{
            var _local2:XML;
            var _local3:uint;
            var _local4:BitmapData;
            if (!_G_x.hasOwnProperty(String(_arg1)))
            {
                _local2 = _Q_F_[_arg1];
                if (_local2.hasOwnProperty("Color"))
                {
                    _local3 = uint(_local2.Color);
                } else
                {
                    _local4 = getBitmapData(_arg1);
                    _local3 = BitmapUtil._B_n(_local4);
                }
                _G_x[_arg1] = _local3;
            }
            return (_G_x[_arg1]);
        }

    }
}//package com.company.assembleegameclient.map

