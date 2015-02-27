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

//_0_j._M_V_

package _0_j {
import _060._P_2;

import _qD_._s_;

import _4x._0I_y;

public class _M_V_ extends _P_2 {

    public var _fD_:_s_;
    public var _0_a:_0I_y;
    public var _00t:_0I_y;

    public function _M_V_(_arg1:_s_, _arg2:_0I_y, _arg3:_0I_y) {
        this._fD_ = _arg1;
        this._0_a = (((_arg2) != null) ? _arg2.clone() : null);
        this._00t = (((_arg3) != null) ? _arg3.clone() : null);
    }

    override public function execute():void {
        this._fD_._L_V_(this._00t);
    }

    override public function unexecute():void {
        this._fD_._L_V_(this._0_a);
    }

}
}//package _0_j

