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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_qD_._Q_8

package _qD_{
    import flash.events.Event;
    import _4x._0I_y;

    public class _Q_8 extends Event {

        public static const PIXEL_EVENT:String = "PIXEL_EVENT";
        public static const TEMP_PIXEL_EVENT:String = "TEMP_PIXEL_EVENT";
        public static const UNDO_TEMP_EVENT:String = "UNDO_TEMP_EVENT";

        public var _fD_:_s_;
        public var _0_a:_0I_y;

        public function _Q_8(_arg1:String, _arg2:_s_){
            super(_arg1, true);
            this._fD_ = _arg2;
            this._0_a = this._fD_._U_d;
        }
    }
}//package _qD_

