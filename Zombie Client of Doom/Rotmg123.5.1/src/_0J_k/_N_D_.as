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

//_0J_k._N_D_

package _0J_k {
import flash.utils.Dictionary;

import _eZ_.Injector;

public class _N_D_ extends _Z_T_ {

    public function _N_D_(_arg1:Array, _arg2:uint, _arg3:Dictionary) {
        super("ctor", _arg1, _arg2, false, _arg3);
    }

    public function createInstance(_arg1:Class, _arg2:Injector):Object {
        var _local4:Object;
        var _local3:Array = _fx(_arg1, _arg1, _arg2);
        switch (_local3.length) {
            case 1:
                _local4 = new (_arg1)(_local3[0]);
                break;
            case 2:
                _local4 = new (_arg1)(_local3[0], _local3[1]);
                break;
            case 3:
                _local4 = new (_arg1)(_local3[0], _local3[1], _local3[2]);
                break;
            case 4:
                _local4 = new (_arg1)(_local3[0], _local3[1], _local3[2], _local3[3]);
                break;
            case 5:
                _local4 = new (_arg1)(_local3[0], _local3[1], _local3[2], _local3[3], _local3[4]);
                break;
            case 6:
                _local4 = new (_arg1)(_local3[0], _local3[1], _local3[2], _local3[3], _local3[4], _local3[5]);
                break;
            case 7:
                _local4 = new (_arg1)(_local3[0], _local3[1], _local3[2], _local3[3], _local3[4], _local3[5], _local3[6]);
                break;
            case 8:
                _local4 = new (_arg1)(_local3[0], _local3[1], _local3[2], _local3[3], _local3[4], _local3[5], _local3[6], _local3[7]);
                break;
            case 9:
                _local4 = new (_arg1)(_local3[0], _local3[1], _local3[2], _local3[3], _local3[4], _local3[5], _local3[6], _local3[7], _local3[8]);
                break;
            case 10:
                _local4 = new (_arg1)(_local3[0], _local3[1], _local3[2], _local3[3], _local3[4], _local3[5], _local3[6], _local3[7], _local3[8], _local3[9]);
                break;
        }
        _local3.length = 0;
        return (_local4);
    }

}
}//package _0J_k

