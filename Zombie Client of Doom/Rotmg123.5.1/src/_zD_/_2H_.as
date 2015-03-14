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

//_zD_._2H_

package _zD_ {
import _C__.Mediator;

import _F_1.selectChars.CurrentCharacterScreen;
import _F_1._0H_2;

import _W_D_.CharListHistory;

import _U_5._dd;

import _05Z_._08i;

import com.company.assembleegameclient.parameters.Parameters;

import _04w._07V_;

public class _2H_ extends Mediator {

    [Inject]
    public var view:_0H_2;
    [Inject]
    public var _eJ_:CharListHistory;
    [Inject]
    public var _T__:_dd;
    [Inject]
    public var _D_u:_08i;

    override public function initialize():void {
        this.view.play.add(this._fN_);
        this.view.close.add(this._of);
        this.view.initialize(this._eJ_.charList);
    }

    override public function destroy():void {
        this.view.play.remove(this._fN_);
        this.view.close.remove(this._fN_);
    }

    private function _of():void {
        this._T__.dispatch(new CurrentCharacterScreen());
    }

    private function _fN_(_arg1:int):void {
        Parameters.data_.playerObjectType = _arg1;
        Parameters.save();
        var _local2:_07V_ = new _07V_();
        _local2._0_E_ = true;
        _local2.charId = this._eJ_.charList.nextCharId_;
        _local2._f2 = -1;
        this._D_u.dispatch(_local2);
    }

}
}//package _zD_

