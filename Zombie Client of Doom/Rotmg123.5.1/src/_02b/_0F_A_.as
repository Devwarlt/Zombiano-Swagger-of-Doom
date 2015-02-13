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

//_02b._0F_A_

package _02b{
    import _4X_._zU_;
    import com.company.assembleegameclient.appengine.SavedCharacter;
    import com.company.assembleegameclient.appengine.CharWebRequests;
    import flash.events.Event;
    import WebRequestEvents.WebRequestErrorEvent;

    public class _0F_A_ extends _zU_ {

        [Inject]
        public var character:SavedCharacter;

        override protected function startTask():void{
            var _local1:CharWebRequests = new CharWebRequests(2);
            _local1.addEventListener(Event.COMPLETE, this._Q_M_);
            _local1.addEventListener(WebRequestErrorEvent.TEXT_ERROR, this._ix);
            _local1.deleteCharacter(this.character.charId());
        }
        private function _Q_M_(_arg1:Event):void{
            _C_t(true, "");
        }
        private function _ix(_arg1:WebRequestErrorEvent):void{
            _C_t(false, "error: Unable to delete character");
        }

    }
}//package _02b

