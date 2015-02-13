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

//_060._8M_

package _060{



    public class _8M_ {

        private var _kY_:Vector.<_P_2>;

        public function _8M_(){
            this._kY_ = new Vector.<_P_2>();
            super();
        }
        public function _0D_J_():Boolean{
            return ((this._kY_.length == 0));
        }
        public function _0_h(_arg1:_P_2):void{
            this._kY_.push(_arg1);
        }
        public function execute():void{
            var _local1:_P_2;
            for each (_local1 in this._kY_)
            {
                _local1.execute();
            }
        }
        public function unexecute():void{
            var _local1:_P_2;
            for each (_local1 in this._kY_)
            {
                _local1.unexecute();
            }
        }

    }
}//package _060

