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

//_W_D_.Domain

package _W_D_ {
import _yn._07Y_;

import flash.system.Security;
import flash.net.LocalConnection;

public class Domain {

    private const _jC_:String = "localhost";
    private const _V_w:Array = ["www.amaymon.com"];
    private const _eg:Array = ["testing.amaymon.com"];
    private const _V_k:Array = _V_w.concat(_eg);

    [Inject]
    public var _0K_y:_B_d;
    private var _04V_:String;

    public function _B_r():void {
        var _local1:String;
        for each (_local1 in this._V_k) {
            Security.allowDomain(_local1);
        }
    }

    public function _F_N_():Boolean {
        return (this._0K_y._H_z() || this._Q_E_());
    }

    public function _H_n():Boolean {
        var _local1:String = this._T_g();
        return (!((this._V_w.indexOf(_local1) == -1)));
    }

    private function _Q_E_():Boolean {
        var _local3:String;
        var _local1:String = this._T_g();
        var _local2:* = (_local1 == this._jC_);
        for each (_local3 in this._V_k) {
            _local2 = ((_local2) || ((_local1 == _local3)));
        }
        return (_local2);
    }

    private function _T_g():String {
        return ((this._04V_ = ((this._04V_) || (new LocalConnection().domain))));
    }

}
}//package _W_D_

