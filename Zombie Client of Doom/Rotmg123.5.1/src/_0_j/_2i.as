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

//_0_j._2i

package _0_j{
    import _zm._01c;

    import com.company.util.IntPoint;


    public class _2i extends _01c {

        protected var _wh:Vector.<IntPoint>;

        public function _2i(_arg1:Vector.<IntPoint>){
            var _local3:IntPoint;
            this._wh = _arg1;
            var _local2:Vector.<String> = new Vector.<String>();
            for each (_local3 in this._wh)
            {
                _local2.push(((("" + _local3.x_) + " x ") + _local3.y_));
            }
            super(_local2, 120, 26, "Size");
        }
        public function _H_9(_arg1:int, _arg2:int):void{
            var _local3:int;
            while (_local3 < this._wh.length)
            {
                if ((((this._wh[_local3].x_ == _arg1)) && ((this._wh[_local3].y_ == _arg2))))
                {
                    _0L_M_(_local3);
                    return;
                }
                _local3++;
            }
        }
        public function _0M_t():IntPoint{
            return (this._wh[_0K_M_()]);
        }

    }
}//package _0_j

