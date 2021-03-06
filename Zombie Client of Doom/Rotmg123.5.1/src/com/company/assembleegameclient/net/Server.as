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

//com.company.assembleegameclient.net.Server

package com.company.assembleegameclient.net {
import com.company.util._0K_N_;

public class Server {

    public var name_:String;
    public var host_:String;
    public var port_:int;
    public var _00r:_0K_N_;
    public var _mR_:Number;
    public var _03y:Boolean;
    public var isUDP:Boolean;

    public function Server(_arg1:String, _arg2:String, _arg3:int, _arg4:_0K_N_ = null, _arg5:Number = 0, _arg6:Boolean = false, isUDP:Boolean = false):void {
        this.name_ = _arg1;
        this.host_ = _arg2;
        this.port_ = _arg3;
        this._00r = _arg4;
        this._mR_ = _arg5;
        this._03y = _arg6;
        this.isUDP = isUDP;
    }

    public function priority():int {
        if (this._03y) {
            return (2);
        }
        if (this._0J_m()) {
            return (1);
        }
        return (0);
    }

    public function _0J_m():Boolean {
        return ((this._mR_ >= 0.66));
    }

    public function _02s():Boolean {
        return ((this._mR_ >= 1));
    }

    public function toString():String {
        return ("[" + this.name_ + ": " + this.host_ + ":" + this.port_ + ":" + this._00r + ":" + this._mR_ + ":" + this._03y + ":" + this.isUDP + "]");
    }

}
}//package com.company.assembleegameclient.net

