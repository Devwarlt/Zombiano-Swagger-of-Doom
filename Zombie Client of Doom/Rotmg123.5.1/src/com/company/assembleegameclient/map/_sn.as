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

//com.company.assembleegameclient.map._sn

package com.company.assembleegameclient.map{
    import flash.utils.Dictionary;

    public class _sn {

        public static const _Q_F_:Dictionary = new Dictionary();

        public static var _pb:Dictionary = new Dictionary();

        public static function _nY_(_arg1:XML):void{
            var _local2:XML;
            var _local3:int;
            for each (_local2 in _arg1.Region)
            {
                _local3 = int(_local2.@type);
                _Q_F_[_local3] = _local2;
                _pb[String(_local2.@id)] = _local3;
            }
        }
        public static function _6H_(_arg1:int):String{
            var _local2:XML = _Q_F_[_arg1];
            if (_local2 == null)
            {
                return (null);
            }
            return (String(_local2.@id));
        }
        public static function getColor(_arg1:int):uint{
            var _local2:XML = _Q_F_[_arg1];
            if (_local2 == null)
            {
                return (0);
            }
            return (uint(_local2.Color));
        }

    }
}//package com.company.assembleegameclient.map

