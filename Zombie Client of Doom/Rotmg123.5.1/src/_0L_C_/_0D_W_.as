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

//_0L_C_._0D_W_

package _0L_C_{
    import flash.display.Sprite;
    import _sp._aJ_;
    import flash.events.Event;

    public class _0D_W_ extends Sprite {

        private const _cR_:String = "Are you really sure you want to delete ${NAME} the ${DISPLAYID}?";
        private const _0K_r:String = DialogBox.BUTTON1_EVENT;
        private const _M_4:String = DialogBox.BUTTON2_EVENT;

        public var deleteCharacter:_aJ_;
        public var cancel:_aJ_;

        public function _0D_W_(){
            this.deleteCharacter = new _aJ_();
            this.cancel = new _aJ_();
        }
        public function _02C_(_arg1:String, _arg2:String):void{
            var _local3:String = this._cR_.replace("${NAME}", _arg1).replace("${DISPLAYID}", _arg2);
            var _local4:DialogBox = new DialogBox(_local3, "Verify Deletion", "Cancel", "Delete");
            _local4.addEventListener(this._0K_r, this.onCancel);
            _local4.addEventListener(this._M_4, this.onDelete);
            addChild(_local4);
        }
        private function onCancel(_arg1:Event):void{
            this.cancel.dispatch();
        }
        private function onDelete(_arg1:Event):void{
            this.deleteCharacter.dispatch();
        }

    }
}//package _0L_C_

