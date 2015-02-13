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

//_D_d._R_1

package _D_d{
    import _060._P_2;

    public class _R_1 extends _P_2 {

        private var map_:_N_g;
        private var x_:int;
        private var y_:int;
        private var _0K_O_:String;
        private var _08v:String;

        public function _R_1(_arg1:_N_g, _arg2:int, _arg3:int, _arg4:String, _arg5:String){
            this.map_ = _arg1;
            this.x_ = _arg2;
            this.y_ = _arg3;
            this._0K_O_ = _arg4;
            this._08v = _arg5;
        }
        override public function execute():void{
            this.map_._N_F_(this.x_, this.y_, this._08v);
        }
        override public function unexecute():void{
            this.map_._N_F_(this.x_, this.y_, this._0K_O_);
        }

    }
}//package _D_d

