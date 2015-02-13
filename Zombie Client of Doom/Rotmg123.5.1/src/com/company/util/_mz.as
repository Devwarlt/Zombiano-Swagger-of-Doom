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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.util._mz

package com.company.util{
    import flash.geom.Point;

    public class _mz {

        public static function _23(_arg1:Number, _arg2:Number, _arg3:Number, _arg4:Number, _arg5:Number, _arg6:Number, _arg7:Number, _arg8:Number):Point{
            var _local9:Number = (((_arg8 - _arg6) * (_arg3 - _arg1)) - ((_arg7 - _arg5) * (_arg4 - _arg2)));
            if (_local9 == 0)
            {
                return (null);
            }
            var _local10:Number = ((((_arg7 - _arg5) * (_arg2 - _arg6)) - ((_arg8 - _arg6) * (_arg1 - _arg5))) / _local9);
            var _local11:Number = ((((_arg3 - _arg1) * (_arg2 - _arg6)) - ((_arg4 - _arg2) * (_arg1 - _arg5))) / _local9);
            if ((((((((_local10 > 1)) || ((_local10 < 0)))) || ((_local11 > 1)))) || ((_local11 < 0))))
            {
                return (null);
            }
            var _local12:Point = new Point((_arg1 + (_local10 * (_arg3 - _arg1))), (_arg2 + (_local10 * (_arg4 - _arg2))));
            return (_local12);
        }
        public static function _K_Z_(_arg1:Number, _arg2:Number, _arg3:Number, _arg4:Number, _arg5:Number, _arg6:Number):Number{
            var _local10:Number;
            var _local11:Number;
            var _local12:Number;
            var _local7:Number = (_arg5 - _arg3);
            var _local8:Number = (_arg6 - _arg4);
            var _local9:Number = ((_local7 * _local7) + (_local8 * _local8));
            if (_local9 < 0.001)
            {
                _local10 = _arg3;
                _local11 = _arg4;
            } else
            {
                _local12 = ((((_arg1 - _arg3) * _local7) + ((_arg2 - _arg4) * _local8)) / _local9);
                if (_local12 < 0)
                {
                    _local10 = _arg3;
                    _local11 = _arg4;
                } else
                {
                    if (_local12 > 1)
                    {
                        _local10 = _arg5;
                        _local11 = _arg6;
                    } else
                    {
                        _local10 = (_arg3 + (_local12 * _local7));
                        _local11 = (_arg4 + (_local12 * _local8));
                    }
                }
            }
            _local7 = (_arg1 - _local10);
            _local8 = (_arg2 - _local11);
            return (Math.sqrt(((_local7 * _local7) + (_local8 * _local8))));
        }

    }
}//package com.company.util

