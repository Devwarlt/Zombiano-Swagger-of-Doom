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

//_6r._iy

package _6r {
import _C__._cM_;

import _U_5._sC_;
import _U_5._sT_;

import ToolTips.ToolTip;

public class _iy extends _cM_ {

    [Inject]
    public var view:_0F_X_;
    [Inject]
    public var _0C__:_sC_;
    [Inject]
    public var _H_F_:_sT_;

    override public function initialize():void {
        this._0C__.add(this._06X_);
        this._H_F_.add(this._rG_);
    }

    override public function destroy():void {
        this._0C__.remove(this._06X_);
        this._H_F_.remove(this._rG_);
    }

    private function _06X_(_arg1:ToolTip):void {
        this.view.show(_arg1);
    }

    private function _rG_():void {
        this.view.hide();
    }

}
}//package _6r

