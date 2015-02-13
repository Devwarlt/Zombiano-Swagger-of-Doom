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

//_0_P_._3Y_

package _0_P_{



    public class _3Y_ {

        public var _01D_:Number = 1;
        public var period_:int;
        public var _oB_:int;
        public var _0E_7:Boolean = false;
        public var _2_:Vector.<_C_n>;

        public function _3Y_(_arg1:XML){
            var _local2:XML;
            this._2_ = new Vector.<_C_n>();
            super();
            if (("@prob" in _arg1))
            {
                this._01D_ = Number(_arg1.@prob);
            }
            this.period_ = int((Number(_arg1.@period) * 1000));
            this._oB_ = int((Number(_arg1.@periodJitter) * 1000));
            this._0E_7 = (String(_arg1.@sync) == "true");
            for each (_local2 in _arg1.Frame)
            {
                this._2_.push(new _C_n(_local2));
            }
        }
        private function _04j():int{
            if (this._oB_ == 0)
            {
                return (this.period_);
            }
            return (((this.period_ - this._oB_) + ((2 * Math.random()) * this._oB_)));
        }
        public function _tu(_arg1:int):int{
            if (this._0E_7)
            {
                return ((int((_arg1 / this.period_)) * this.period_));
            }
            return (((_arg1 + this._04j()) + (200 * Math.random())));
        }
        public function _gr(_arg1:int):int{
            if (this._0E_7)
            {
                return (((int((_arg1 / this.period_)) * this.period_) + this.period_));
            }
            return ((_arg1 + this._04j()));
        }

    }
}//package _0_P_

