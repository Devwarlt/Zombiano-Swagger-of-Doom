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

//_lo._t5

package _lo{
    import flash.events.EventDispatcher;

    import flash.utils.Dictionary;
    import flash.display.DisplayObjectContainer;
    import flash.display.DisplayObject;


    public class _t5 extends EventDispatcher {

        private const _bindings:Vector.<_02f> = new Vector.<_02f>();
        private const _0_y:Vector.<_02f> = new Vector.<_02f>();
        private const _bindingByContainer:Dictionary = new Dictionary();

        public function get _B_b():Vector.<_02f>{
            return (this._bindings);
        }
        public function get _0C_W_():Vector.<_02f>{
            return (this._0_y);
        }
        public function _tP_(_arg1:DisplayObjectContainer):_02f{
            return ((this._bindingByContainer[_arg1] = ((this._bindingByContainer[_arg1]) || (this._L_Y_(_arg1)))));
        }
        public function _function(_arg1:DisplayObjectContainer):_02f{
            var _local2:_02f = this._bindingByContainer[_arg1];
            ((_local2) && (this._Q_1(_local2)));
            return (_local2);
        }
        public function _0C_H_(_arg1:DisplayObject):_02f{
            var _local3:_02f;
            var _local2:DisplayObjectContainer = _arg1.parent;
            while (_local2)
            {
                _local3 = this._bindingByContainer[_local2];
                if (_local3)
                {
                    return (_local3);
                }
                _local2 = _local2.parent;
            }
            return (null);
        }
        public function _3N_(_arg1:DisplayObjectContainer):_02f{
            return (this._bindingByContainer[_arg1]);
        }
        private function _L_Y_(_arg1:DisplayObjectContainer):_02f{
            var _local3:_02f;
            var _local2:_02f = new _02f(_arg1);
            this._bindings.push(_local2);
            _local2.addEventListener(_04G_._0B_x, this._bv);
            _local2.parent = this._0C_H_(_arg1);
            if (_local2.parent == null)
            {
                this._B_l(_local2);
            }
            for each (_local3 in this._bindingByContainer)
            {
                if (_arg1.contains(_local3.container))
                {
                    if (!_local3.parent)
                    {
                        this._02T_(_local3);
                        _local3.parent = _local2;
                    } else
                    {
                        if (!_arg1.contains(_local3.parent.container))
                        {
                            _local3.parent = _local2;
                        }
                    }
                }
            }
            dispatchEvent(new _or(_or._0K_h, _local2.container));
            return (_local2);
        }
        private function _Q_1(_arg1:_02f):void{
            var _local3:_02f;
            delete this._bindingByContainer[_arg1.container];
            var _local2:int = this._bindings.indexOf(_arg1);
            this._bindings.splice(_local2, 1);
            _arg1.removeEventListener(_04G_._0B_x, this._bv);
            if (!_arg1.parent)
            {
                this._02T_(_arg1);
            }
            for each (_local3 in this._bindingByContainer)
            {
                if (_local3.parent == _arg1)
                {
                    _local3.parent = _arg1.parent;
                    if (!_local3.parent)
                    {
                        this._B_l(_local3);
                    }
                }
            }
            dispatchEvent(new _or(_or._mh, _arg1.container));
        }
        private function _B_l(_arg1:_02f):void{
            this._0_y.push(_arg1);
            dispatchEvent(new _or(_or._Y_N_, _arg1.container));
        }
        private function _02T_(_arg1:_02f):void{
            var _local2:int = this._0_y.indexOf(_arg1);
            this._0_y.splice(_local2, 1);
            dispatchEvent(new _or(_or._O_U_, _arg1.container));
        }
        private function _bv(_arg1:_04G_):void{
            this._Q_1((_arg1.target as _02f));
        }

    }
}//package _lo

