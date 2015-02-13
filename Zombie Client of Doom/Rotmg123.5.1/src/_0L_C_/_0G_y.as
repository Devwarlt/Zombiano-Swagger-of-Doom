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

//_0L_C_._0G_y

package _0L_C_{
    import com.company.assembleegameclient.appengine.WebRequest;
    import com.company.assembleegameclient.parameters.Parameters;
    import WebRequestEvents.WebRequestSuccessEvent;
    import WebRequestEvents.WebRequestErrorEvent;
    import _qN_.Account;
    import flash.events.Event;

    public class _0G_y extends DialogBox {

        public var price_:int;

        public function _0G_y(_arg1:int){
            super("Buying Character Slot...", null, null, null);
            this.price_ = _arg1;
            var _local2:WebRequest = new WebRequest(Parameters.getAccountServerIP(), "/account", true, 2);
            _local2.addEventListener(WebRequestSuccessEvent.GENERIC_DATA, this._F_Q_);
            _local2.addEventListener(WebRequestErrorEvent.TEXT_ERROR, this._ix);
            _local2.sendRequest("purchaseCharSlot", Account._get().credentials());
        }
        private function _F_Q_(_arg1:Event):void{
            dispatchEvent(new Event(Event.COMPLETE));
        }
        private function _ix(_arg1:WebRequestErrorEvent):void{
            dispatchEvent(_arg1.clone());
        }

    }
}//package _0L_C_

