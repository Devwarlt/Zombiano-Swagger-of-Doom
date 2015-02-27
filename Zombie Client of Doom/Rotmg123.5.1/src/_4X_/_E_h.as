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

//_4X_._E_h

package _4X_ {


public class _E_h {

    private var _A_X_:Vector.<_zU_>;

    public function _E_h() {
        this._A_X_ = new <_zU_>[];
    }

    public function add(_arg1:_zU_):void {
        this._A_X_.push(_arg1);
        _arg1._iu.addOnce(this._T_T_);
    }

    public function _fw(_arg1:_zU_):Boolean {
        return (!((this._A_X_.indexOf(_arg1) == -1)));
    }

    private function _T_T_(_arg1:_zU_, _arg2:Boolean, _arg3:String = ""):void {
        this._A_X_.splice(this._A_X_.indexOf(_arg1), 1);
    }

}
}//package _4X_

