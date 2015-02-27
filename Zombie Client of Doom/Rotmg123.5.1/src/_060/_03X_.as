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

//_060._03X_

package _060 {


public class _03X_ {

    private var _kY_:Vector.<_8M_>;
    private var _0E_i:int = 0;

    public function _03X_() {
        this._kY_ = new Vector.<_8M_>();
        super();
    }

    public function _D_1(_arg1:_8M_):void {
        this._kY_.length = this._0E_i;
        _arg1.execute();
        this._kY_.push(_arg1);
        this._0E_i++;
    }

    public function _G_l():void {
        if (this._0E_i == 0) {
            return;
        }
        this._kY_[--this._0E_i].unexecute();
    }

    public function _K_N_():void {
        if (this._0E_i == this._kY_.length) {
            return;
        }
        this._kY_[this._0E_i++].execute();
    }

    public function clear():void {
        this._0E_i = 0;
        this._kY_.length = 0;
    }

}
}//package _060

