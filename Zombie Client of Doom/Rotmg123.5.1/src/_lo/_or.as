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

//_lo._or

package _lo{
    import flash.events.Event;
    import flash.display.DisplayObjectContainer;

    public class _or extends Event {

        public static const _0K_h:String = "containerAdd";
        public static const _mh:String = "containerRemove";
        public static const _Y_N_:String = "rootContainerAdd";
        public static const _O_U_:String = "rootContainerRemove";

        private var _0J_w:DisplayObjectContainer;

        public function _or(_arg1:String, _arg2:DisplayObjectContainer){
            super(_arg1);
            this._0J_w = _arg2;
        }
        public function get container():DisplayObjectContainer{
            return (this._0J_w);
        }
        override public function clone():Event{
            return (new _or(type, this._0J_w));
        }

    }
}//package _lo

