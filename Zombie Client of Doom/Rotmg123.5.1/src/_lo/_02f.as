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

//_lo._02f

package _lo{
    import flash.events.EventDispatcher;

    import _s3._yp;
    import flash.display.DisplayObjectContainer;
    import flash.display.DisplayObject;


    public class _02f extends EventDispatcher {

        private const _handlers:Vector.<_yp> = new Vector.<_yp>();

        private var _parent:_02f;
        private var _0J_w:DisplayObjectContainer;

        public function _02f(_arg1:DisplayObjectContainer){
            this._0J_w = _arg1;
        }
        public function get parent():_02f{
            return (this._parent);
        }
        public function set parent(_arg1:_02f):void{
            this._parent = _arg1;
        }
        public function get container():DisplayObjectContainer{
            return (this._0J_w);
        }
        public function get _0n():uint{
            return (this._handlers.length);
        }
        public function _0_m(_arg1:_yp):void{
            if (this._handlers.indexOf(_arg1) > -1)
            {
                return;
            }
            this._handlers.push(_arg1);
        }
        public function _K_y(_arg1:_yp):void{
            var _local2:int = this._handlers.indexOf(_arg1);
            if (_local2 > -1)
            {
                this._handlers.splice(_local2, 1);
                if (this._handlers.length == 0)
                {
                    dispatchEvent(new _04G_(_04G_._0B_x));
                }
            }
        }
        public function _H_3(_arg1:DisplayObject, _arg2:Class):void{
            var _local5:_yp;
            var _local3:uint = this._handlers.length;
            var _local4:int;
            while (_local4 < _local3)
            {
                _local5 = (this._handlers[_local4] as _yp);
                _local5._H_3(_arg1, _arg2);
                _local4++;
            }
        }

    }
}//package _lo

