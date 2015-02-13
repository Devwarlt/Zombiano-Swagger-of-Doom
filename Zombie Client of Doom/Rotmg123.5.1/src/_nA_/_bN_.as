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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// either expressed or implied, of the FreeBSD Project.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_nA_._bN_

package _nA_{
    import _C__._cM_;
    import _0I_9._0J_r;
    import _P_E_._W_2;
    import _0M_m._00V_;

    public class _bN_ extends _cM_ {

        [Inject]
        public var view:_ax;
        [Inject]
        public var _Q_l:_0J_r;
        [Inject]
        public var _n7:_W_2;
        [Inject]
        public var _02X_:_00V_;

        override public function initialize():void{
            this.view._bF_.add(this.onButtonClick);
            this._02X_._Q_o.addOnce(this._036);
            this.view._zP_(this._02X_._tT_());
        }
        override public function destroy():void{
            this.view._bF_.remove(this.onButtonClick);
            this._02X_._Q_o.remove(this._036);
        }
        private function onButtonClick():void{
            this._n7.dispatch();
        }
        private function _036():void{
            this.view.destroy();
        }

    }
}//package _nA_

