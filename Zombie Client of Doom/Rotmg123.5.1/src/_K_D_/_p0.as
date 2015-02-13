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

//_K_D_._p0

package _K_D_{
    import _0D_n._throw;
    import _0D_n._P_I_;
    import com.company.assembleegameclient.map._X_l;
import com.company.assembleegameclient.ui.MiniMap;
import com.company.rotmg.graphics.ranks.pfcRank;
import com.company.util.IntPoint;
    import com.company.assembleegameclient.objects.GameObject;
    import com.hurlant.util.Base64;

import flash.display.BitmapData;

import flash.geom.Point;
import flash.utils.ByteArray;
    import com.company.assembleegameclient.map._pf;
    import com.company.assembleegameclient.objects.BasicObject;
    import com.company.assembleegameclient.objects.ObjectLibrary;

    public class _p0 {

        private static const _N_G_:_throw = _P_I_._dJ_();

        public static function loadMapWithMiniMap(_arg1:String, width:int, height:int):Object {
            var _local2:Object = _N_G_.parse(_arg1);
            var _local3:_X_l = new _X_l(null);
            var music:Vector.<String> = new Vector.<String>();
            music.push("Menu");
            _local3.setProps(_local2["width"], _local2["height"], _local2["name"], _local2["back"], false, false, music, 0, -1);
            _local3.initialize();
            var miniMap:MiniMap = new MiniMap(_local3, width, height);
            _4q(_local2, _local3, 0, 0, miniMap);
            return { "RealMap": _local3, "MiniMap": miniMap };
        }

        public static function _0L_k(_arg1:String):_X_l{
            var _local2:Object = _N_G_.parse(_arg1);
            var _local3:_X_l = new _X_l(null);
            var music:Vector.<String> = new Vector.<String>();
            music.push("Menu");
            _local3.setProps(_local2["width"], _local2["height"], _local2["name"], _local2["back"], false, false, music, 0, -1);
            _local3.initialize();
            _4q(_local2, _local3, 0, 0, null);
            return (_local3);
        }
        public static function _T_6(_arg1:String, _arg2:_X_l, _arg3:int, _arg4:int, miniMap:MiniMap = null):void{
            var _local5:Object = _N_G_.parse(_arg1);
            _4q(_local5, _arg2, _arg3, _arg4, miniMap);
        }
        public static function _0M_t(_arg1:String):IntPoint{
            var _local2:Object = _N_G_.parse(_arg1);
            return (new IntPoint(_local2["width"], _local2["height"]));
        }
        private static function _4q(_arg1:Object, _arg2:_X_l, _arg3:int, _arg4:int, miniMap:MiniMap):void{
            var _local7:int;
            var _local8:int;
            var _local9:Object;
            var _local10:Array;
            var _local11:int;
            var _local12:Object;
            var _local13:GameObject;
            var _local5:ByteArray = Base64.decodeToByteArray(_arg1["data"]);
            _local5.uncompress();
            var _local6:Array = _arg1["dict"];
            _local7 = _arg4;
            while (_local7 < (_arg4 + _arg1["height"]))
            {
                _local8 = _arg3;
                while (_local8 < (_arg3 + _arg1["width"]))
                {
                    var idx:int = _local5.readShort();
                    if(idx < _local6.length) {
                        _local9 = _local6[idx];
                        if (!(((((((_local8 < 0)) || ((_local8 >= _arg2.width_)))) || ((_local7 < 0)))) || ((_local7 >= _arg2.height_)))) {
                            if (_local9.hasOwnProperty("ground")) {
                                _local11 = _pf._pb[_local9["ground"]];
                                _arg2.setGroundTile(_local8, _local7, _local11);
                                if (miniMap != null)
                                    miniMap.setGroundTile(_local8, _local7, _local11);
                            }
                            _local10 = _local9["objs"];
                            if (_local10 != null) {
                                for each (_local12 in _local10) {
                                    _local13 = _A_s(_local12);
                                    if (!_local13) continue;
                                    _local13.objectId_ = BasicObject._7y();
                                    _arg2.addObj(_local13, (_local8 + 0.5), (_local7 + 0.5));
                                }
                            }
                        }
                    }
                    _local8++;
                }
                _local7++;
            }
        }
        public static function _A_s(_arg1:Object):GameObject{
            var _local2:int = ObjectLibrary._pb[_arg1["id"]];
            var _local3:XML = ObjectLibrary.Items[_local2];
            var _local4:GameObject = ObjectLibrary._075(_local2);
            if(!_local4) return null;
            _local4.size_ = ((_arg1.hasOwnProperty("size")) ? _arg1["size"] : _local4.props_._0M_t());
            return (_local4);
        }

    }
}//package _K_D_

