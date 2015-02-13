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

//Effects.XMLEffect

package Effects{
    import com.company.assembleegameclient.objects.GameObject;

    public class XMLEffect extends Effect {

        private var go_:GameObject;
        private var _0B_p:_7g;
        private var _hY_:Number;
        private var _0L_N_:Number;

        public function XMLEffect(_arg1:GameObject, _arg2:_D_J_){
            this.go_ = _arg1;
            this._0B_p = _0H_Y_._020[_arg2.particle];
            this._hY_ = _arg2.cooldown;
            this._0L_N_ = 0;
        }
        override public function update(_arg1:int, _arg2:int):Boolean{
            if (this.go_.map_ == null)
            {
                return (false);
            }
            var _local3:Number = (_arg2 / 1000);
            this._0L_N_ = (this._0L_N_ - _local3);
            if (this._0L_N_ >= 0)
            {
                return (true);
            }
            this._0L_N_ = this._hY_;
            map_.addObj(new _uj(this._0B_p), this.go_.x_, this.go_.y_);
            return (true);
        }

    }
}//package Effects

