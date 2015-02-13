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

//_jV_._07L_

package _jV_{
    import flash.events.IEventDispatcher;

    public class _07L_ {

        private var _0L_4:IEventDispatcher;
        private var _0E_Y_:String;
        private var _0M_e:Function;
        private var _1j:Class;
        private var _callback:Function;
        private var _0C_Y_:Boolean;

        public function _07L_(_arg1:IEventDispatcher, _arg2:String, _arg3:Function, _arg4:Class, _arg5:Function, _arg6:Boolean){
            this._0L_4 = _arg1;
            this._0E_Y_ = _arg2;
            this._0M_e = _arg3;
            this._1j = _arg4;
            this._callback = _arg5;
            this._0C_Y_ = _arg6;
        }
        public function get dispatcher():IEventDispatcher{
            return (this._0L_4);
        }
        public function get eventString():String{
            return (this._0E_Y_);
        }
        public function get listener():Function{
            return (this._0M_e);
        }
        public function get eventClass():Class{
            return (this._1j);
        }
        public function get callback():Function{
            return (this._callback);
        }
        public function get useCapture():Boolean{
            return (this._0C_Y_);
        }

    }
}//package _jV_

