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

//_qD_._s_

package _qD_{
    import flash.display.Sprite;
    import _4x._0I_y;
    import com.company.util.MoreColorUtil;

    public class _s_ extends Sprite {

        public var size_:int;
        public var _U_d:_0I_y = null;
        private var _M_b:Boolean;

        public function _s_(_arg1:int, _arg2:Boolean){
            this.size_ = _arg1;
            this._M_b = _arg2;
            this.redraw();
        }
        public function _L_V_(_arg1:_0I_y):void{
            this._U_d = (((_arg1)!=null) ? this._U_d = _arg1.clone() : null);
            this.redraw();
        }
        public function getColor():uint{
            return ((((this._U_d == null)) ? 0 : MoreColorUtil._nL_(this._U_d.h_, this._U_d._ew, this._U_d._fz)));
        }
        public function redraw():void{
            graphics.clear();
            if (this._U_d == null)
            {
                graphics.beginFill(0, ((this._M_b) ? 0 : 1));
            } else
            {
                graphics.beginFill(MoreColorUtil._nL_(this._U_d.h_, this._U_d._ew, this._U_d._fz));
            }
            graphics.drawRect(0, 0, this.size_, this.size_);
            graphics.endFill();
        }

    }
}//package _qD_

