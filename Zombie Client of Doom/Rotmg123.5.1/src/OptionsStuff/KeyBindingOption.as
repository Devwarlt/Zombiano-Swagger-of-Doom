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

//OptionsStuff.KeyBindingOption

package OptionsStuff{
    import com.company.assembleegameclient.parameters.Parameters;
    import flash.events.Event;
    import com.company.util.MoreColorUtil;

    public class KeyBindingOption extends _0_i {

        private var _wK_:_N_9;
        private var _0F_N_:Boolean;

        public function KeyBindingOption(_arg1:String, _arg2:String, _arg3:String, _arg4:Boolean=false){
            super(_arg1, _arg2, _arg3);
            this._wK_ = new _N_9(Parameters.data_[_W_Y_]);
            this._wK_.addEventListener(Event.CHANGE, this._bR_);
            addChild(this._wK_);
            this._J_r(_arg4);
        }
        public function _J_r(_arg1:Boolean):void{
            this._0F_N_ = _arg1;
            transform.colorTransform = ((this._0F_N_) ? MoreColorUtil._3f : MoreColorUtil.identity);
            mouseEnabled = !(this._0F_N_);
            mouseChildren = !(this._0F_N_);
        }
        override public function refresh():void{
            this._wK_._09q(Parameters.data_[_W_Y_]);
        }
        private function _bR_(_arg1:Event):void{
            Parameters.setKey(_W_Y_, this._wK_.value());
            Parameters.save();
        }

    }
}//package OptionsStuff

