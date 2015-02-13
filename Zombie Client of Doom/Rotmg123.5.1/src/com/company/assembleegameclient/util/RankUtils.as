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

//com.company.assembleegameclient.util.RankUtils

package com.company.assembleegameclient.util{

import com.company.rotmg.graphics.ranks._1sgRank;
import com.company.rotmg.graphics.ranks.cplRank;
import com.company.rotmg.graphics.ranks.csmRank;
import com.company.rotmg.graphics.ranks.msgRank;
import com.company.rotmg.graphics.ranks.noRank;
import com.company.rotmg.graphics.ranks.pfcRank;
import com.company.rotmg.graphics.ranks.pv2Rank;
import com.company.rotmg.graphics.ranks.sfcRank;
import com.company.rotmg.graphics.ranks.sgmRank;
import com.company.rotmg.graphics.ranks.sgtRank;
import com.company.rotmg.graphics.ranks.smaRank;
import com.company.rotmg.graphics.ranks.spcRank;
import com.company.rotmg.graphics.ranks.ssgRank;

import flash.display.DisplayObject;
import flash.geom.ColorTransform;
    import com.company.assembleegameclient.objects.ObjectLibrary;
    import flash.display.Sprite;
    import flash.filters.DropShadowFilter;
    import com.company.rotmg.graphics.ranks.AdminRank;
    import com.company.util.AssetLibrary;
    import flash.display.BitmapData;


    public class RankUtils {

        public static const _yJ_:Vector.<int> = new <int>[20, 150, 400, 800, 2000];

        public static function _5e():int{
            return ((ObjectLibrary._tj.length * _yJ_.length));
        }
        public static function _lr(_arg1:int):int{
            var _local2:int;
            while ((((_local2 < _yJ_.length)) && ((_arg1 >= _yJ_[_local2]))))
            {
                _local2++;
            }
            return (_local2);
        }
        public static function _F_U_(_arg1:int, _arg2:int):int{
            var _local3:int = Math.max(_arg1, _arg2);
            var _local4:int;
            while (_local4 < _yJ_.length)
            {
                if (_yJ_[_local4] > _local3)
                {
                    return (_yJ_[_local4]);
                }
                _local4++;
            }
            return (-1);
        }

        public static function toLongRankString(rank:int):String{
            switch(rank)
            {
                case 1: return "Private";
                case 2: return "Private First Class";
                case 3: return "Specialist";
                case 4: return "Corporal";
                case 5: return "Sergeant";
                case 6: return "Staff Sergeant";
                case 7: return "Sergeant First Class";
                case 8: return "Master Sergeant";
                case 9: return "First Sergeant";
                case 10: return "Sergeant Major";
                case 11: return "Command Sergeant Major";
                case 12: return "Sergeant Major of the Army";
                case 13: return "Commander";
                default: return "Not Ranked";
            }
        }

        public static function toShortRankString(rank:int):String{
            switch(rank)
            {
                case 0: case 1: return "PVT.";
                case 2: return "PFC.";
                case 3: return "SPC.";
                case 4: return "CPL.";
                case 5: return "SGT.";
                case 6: return "SSG.";
                case 7: return "SFC.";
                case 8: return "MSG.";
                case 9: return "1SG.";
                case 10: return "SGM.";
                case 11: return "CSM.";
                case 12: return "SMA.";
                case 13: return "CMDR.";
                default: return "";
            }
        }

        public static function _bl(_arg1:int):DisplayObject{
            var _local2:DisplayObject = _03A_(_arg1);
            _local2.filters = [new DropShadowFilter(0, 0, 0, 1, 4, 4, 2)];
            return (_local2);
        }
        public static function _03A_(_arg1:int):DisplayObject{
            switch (_arg1)
            {
                case 1: return new pv2Rank();
                case 2: return new pfcRank();
                case 3: return new spcRank();
                case 4: return new cplRank();
                case 5: return new sgtRank();
                case 6: return new ssgRank();
                case 7: return new sfcRank();
                case 8: return new msgRank();
                case 9: return new _1sgRank();
                case 10: return new sgmRank();
                case 11: return new csmRank();
                case 12: return new smaRank();
                case 13: return new AdminRank();
                default: return new noRank();
            }
        }
        public static function _0M_r(_arg1:int):DisplayObject{
            var _local2:DisplayObject;
            _local2 = _03A_(_arg1);
            _local2.x = 2;
            _local2.y = 1;
            _local2.filters = [new DropShadowFilter(0, 0, 0, 0.5, 6, 6, 1)];
            return (_local2);
        }
        public static function _qf():BitmapData{
            var _local1:BitmapData = AssetLibrary._xK_("lofiObj3", 224);
            return (TextureRedrawer.redraw(_local1, 40, true, 0, 0));
        }

    }
}//package com.company.assembleegameclient.util

