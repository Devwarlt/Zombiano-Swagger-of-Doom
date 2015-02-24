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
 * Created by Fabian on 16.12.2014.
 */
package AccountManagement {
import _C__._cM_;
import _F_1._E_r;
import _U_5.SpriteTarget;
import _U_5.CharListResetDispatcher;
import _W_D_._0I_H_;
import _qN_.Account;
import com.company.assembleegameclient.appengine.CharWebRequests;
import com.company.assembleegameclient.appengine.SavedCharsList;
import flash.events.Event;

public class AccountEventDispatcher extends _cM_ {

    [Inject]
    public var view:AccountManagementScreen;
    [Inject]
    public var charList:_0I_H_;
    [Inject]
    public var charListReset:CharListResetDispatcher;
    [Inject]
    public var target:SpriteTarget;

    private var charWebRequest:CharWebRequests;

    override public function initialize():void {
        this.view.eventDispatcher.add(this.dispatchEvent);
        this.view.initialize(this.charList.charList);
    }
    override public function destroy():void {
        this.view.eventDispatcher.remove(this.dispatchEvent);
        this.view.destroy();
    }
    private function dispatchEvent(eventString:String):void {
        switch (eventString) {
            case AccountManagementScreen.SHOW_MAIN_SCREEN:
                this.view.dispatchEvent(new Event(Event.COMPLETE));
                this.charListReset.dispatch();
                this.target.dispatch(new _E_r());
                break;
            case AccountManagementScreen.RELOAD:
                this.reload();
                break;
            case AccountManagementScreen.LOGOUT:
                Account._get().clear();
                this.view.dispatchEvent(new Event(Event.COMPLETE));
                this.charListReset.dispatch();
                this.target.dispatch(new _E_r());
                break;
        }
    }

    private function reload():void {
        this.charWebRequest = new CharWebRequests();
        this.charWebRequest.addEventListener(SavedCharsList.SAVED_CHARS_LIST, this.onSuccess);
        this.charWebRequest.sendCharList();
    }

    private function onSuccess(_arg1:SavedCharsList):void {
        destroy();
        this.charList.charList = _arg1;
        initialize();
    }
}
}

