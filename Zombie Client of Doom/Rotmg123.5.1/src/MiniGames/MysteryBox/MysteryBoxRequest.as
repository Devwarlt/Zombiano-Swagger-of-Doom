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

/**
 * Created by Fabian on 21.02.2015.
 */
package MiniGames.MysteryBox {
import WebRequestEvents.WebRequestErrorEvent;
import WebRequestEvents.WebRequestSuccessEvent;

import _qN_.Account;

import com.company.assembleegameclient.appengine.WebRequest;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.util.QueryHelper;

public class MysteryBoxRequest extends WebRequest {
    public function MysteryBoxRequest() {
        super(Parameters.getAccountServerIP(), "/account");
        this.addEventListener(WebRequestSuccessEvent.GENERIC_DATA, this.onSuccess);
        this.addEventListener(WebRequestErrorEvent.TEXT_ERROR, this.onError);
    }

    public function sendBoxPurchase(boxId:int):void {
        var query:Object = Account._get().credentials();
        QueryHelper.mergeQueries(query, { "boxId": boxId });
        sendRequest("/purchaseMysteryBox", query);
    }

    private function onError(event:WebRequestErrorEvent):void {
        if (hasEventListener(MysteryBoxResultEvent.MYSTERYBOX_RESULT)) {
            var result:MysteryBoxResultEvent = new MysteryBoxResultEvent();
            result.error = true;
            result.errorMessage = event.text_;
            result.items = [];
            dispatchEvent(result);
        }
    }

    private function onSuccess(event:WebRequestSuccessEvent):void {
        if (hasEventListener(MysteryBoxResultEvent.MYSTERYBOX_RESULT)) {
            var result:MysteryBoxResultEvent = new MysteryBoxResultEvent();
            result.error = false;
            result.errorMessage = "";
            result.items = String(XML(event.data_).Awards).split(",");
            dispatchEvent(result);
        }
    }
}
}
