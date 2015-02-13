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

//Frames._mo

package Frames{
    import flash.display.Sprite;

    import _5H_._5P_;
    import flash.events.MouseEvent;
    import _5H_._xY_;
    import flash.events.Event;
    import flash.display.DisplayObject;
    import _mv._md;
    import _mv._F_8;


    public class _mo extends Sprite {

        private var _bW_:Vector.<String>;
        private var _jf:Vector.<_T_I_>;
        private var _rF_:_5P_;

        public function _mo(_arg1:Vector.<String>){
            this._bW_ = _arg1;
            this._nm();
            this._hT_();
            this._Y_o();
        }
        public function setSelected(_arg1:String):void{
            this._rF_.setSelected(_arg1);
        }
        public function _rq():String{
            return (this._rF_._rq().getValue());
        }
        private function _nm():void{
            var _local1:int = this._bW_.length;
            this._jf = new Vector.<_T_I_>(_local1, true);
            var _local2:int;
            while (_local2 < _local1)
            {
                this._jf[_local2] = this._w0(this._bW_[_local2]);
                _local2++;
            }
        }
        private function _w0(_arg1:String):_T_I_{
            var _local2:_T_I_ = new _T_I_(_arg1);
            _local2.addEventListener(MouseEvent.CLICK, this._0A_U_);
            addChild(_local2);
            return (_local2);
        }
        private function _0A_U_(_arg1:Event):void{
            var _local2:_xY_ = (_arg1.currentTarget as _xY_);
            this._rF_.setSelected(_local2.getValue());
        }
        private function _hT_():void{
            var _local1:Vector.<DisplayObject> = this._gg();
            var _local2:_F_8 = new _md(20);
            _local2.layout(_local1);
        }
        private function _gg():Vector.<DisplayObject>{
            var _local1:int = this._jf.length;
            var _local2:Vector.<DisplayObject> = new <DisplayObject>[];
            var _local3:int;
            while (_local3 < _local1)
            {
                _local2[_local3] = this._jf[_local3];
                _local3++;
            }
            return (_local2);
        }
        private function _Y_o():void{
            var _local1:Vector.<_xY_> = this._G_S_();
            this._rF_ = new _5P_(_local1);
            this._rF_.setSelected(this._jf[0].getValue());
        }
        private function _G_S_():Vector.<_xY_>{
            var _local1:int = this._jf.length;
            var _local2:Vector.<_xY_> = new <_xY_>[];
            var _local3:int;
            while (_local3 < _local1)
            {
                _local2[_local3] = this._jf[_local3];
                _local3++;
            }
            return (_local2);
        }

    }
}//package Frames

