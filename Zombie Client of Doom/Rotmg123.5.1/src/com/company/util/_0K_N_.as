﻿// Copyright (c) 2015, FireBite/Aceticsoft Studios Inc.
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

//com.company.util._0K_N_

package com.company.util{
    public class _0K_N_ {

        public var latitude_:Number;
        public var longitude_:Number;

        public function _0K_N_(_arg1:Number, _arg2:Number){
            this.latitude_ = _arg1;
            this.longitude_ = _arg2;
        }
        public static function distance(_arg1:_0K_N_, _arg2:_0K_N_):Number{
            var _local3:Number = (Trig._km * (_arg1.longitude_ - _arg2.longitude_));
            var _local4:Number = (Trig._km * _arg1.latitude_);
            var _local5:Number = (Trig._km * _arg1.longitude_);
            var _local6:Number = (Trig._km * _arg2.latitude_);
            var _local7:Number = (Trig._km * _arg2.longitude_);
            var _local8:Number = ((Math.sin(_local4) * Math.sin(_local6)) + ((Math.cos(_local4) * Math.cos(_local6)) * Math.cos(_local3)));
            _local8 = (((((Trig._G_Q_ * Math.acos(_local8)) * 60) * 1.1515) * 1.609344) * 1000);
            return (_local8);
        }

        public function toString():String{
            return ((((("(" + this.latitude_) + ", ") + this.longitude_) + ")"));
        }

    }
}//package com.company.util

