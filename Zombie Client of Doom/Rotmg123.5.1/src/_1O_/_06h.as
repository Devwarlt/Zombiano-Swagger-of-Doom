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

//_1O_._06h

package _1O_{
    import _0_p._D_v;
    import _lo._t5;
    import _03T_._078;
    import _eZ_._08b;
    import _s3._im;
    import _lo._5u;
    import _0_p._L_y;

    public class _06h implements _D_v {

        private static var _mT_:_t5;

        private const _ul:String = _078.create(_06h);

        private var _vz:_08b;
        private var _yv:_im;

        public function extend(_arg1:_L_y):void{
            this._vz = _arg1._O_R_;
            _mT_ = ((_mT_) || (new _t5()));
            this._vz.map(_t5)._q3(_mT_);
            this._vz.map(_im)._00S_(_5u);
            _arg1._iL_._0C_t(this._0C_t);
            _arg1._iL_._kf(this._kf);
        }
        public function toString():String{
            return (this._ul);
        }
        private function _0C_t():void{
            this._yv = this._vz.getInstance(_im);
        }
        private function _kf():void{
            this._yv._F_P_();
            this._vz._1Y_(_im);
            this._vz._1Y_(_t5);
        }

    }
}//package _1O_

