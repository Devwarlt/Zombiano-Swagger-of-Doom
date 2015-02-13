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
 * Created by Fabian on 18.11.2014.
 */
package CraftingWebRequests {
import _qN_.Account;

import WebRequestEvents.WebRequestSuccessEvent;

import com.company.assembleegameclient.appengine.WebRequest;
import com.company.assembleegameclient.objects.CraftingTerminal;
import com.company.assembleegameclient.parameters.Parameters;

import flash.events.Event;

public class CraftingRequest extends WebRequest {

    private static var lockRequest:Boolean;

    public function CraftingRequest() {
        if(!lockRequest) {
            lockRequest = true;
            super(Parameters.getAccountServerIP(), "/crafting", true);
            init();
        }
    }

    private function init():void {
        addEventListener(WebRequestSuccessEvent.GENERIC_DATA, this.dataReceived);
        var _local1:Object = Account._get().credentials();
        sendRequest("getRecipes", _local1);
    }

    public function dataReceived(_arg1:WebRequestSuccessEvent):void {
        CraftingTerminal.recipes = Vector.<String>(_arg1.data_.toString().split("\n"));
        lockRequest = false;
    }
}
}
