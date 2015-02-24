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
import _sp._aJ_;

import com.company.assembleegameclient.appengine.SavedCharsList;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

public class AccountManagementScreen extends Sprite {

    private static const NULL_XML:XML = new XML("");

    public var eventDispatcher:_aJ_;

    public var accountHeader:AccountManagementHeader;
    public var accountBody:AccountManagementBody;
    public var accountFooter:AccountManagementFooter;

    public var selectedTab:String;

    public static const SHOW_MAIN_SCREEN:String = "SHOW_MAIN_SCREEN";
    public static const RELOAD:String = "RELOAD";
    public static const LOGOUT:String = "LOGOUT";

    private var login:Boolean;
    private var charList:SavedCharsList;

    public function AccountManagementScreen(login:Boolean=false) {
        this.login = login;
        this.eventDispatcher = new _aJ_(String);
    }

    public function initialize(charList:SavedCharsList):void {
        this.charList = charList;
        this.accountHeader = new AccountManagementHeader(this);
        this.accountBody = new AccountManagementBody(this);
        this.accountFooter = new AccountManagementFooter(this);

        this.accountHeader.initialize();
        this.accountBody.initialize();
        this.accountFooter.initialize();

        this.accountBody.y = AccountManagementHeader.HEIGHT;
        this.accountFooter.y = AccountManagementHeader.HEIGHT + AccountManagementBody.HEIGHT;
        addChild(this.accountBody);
        addChild(this.accountHeader);
        addChild(this.accountFooter);

        if(this.selectedTab != null) {
            this.accountHeader.switchToTab(this.selectedTab);
        }

        if (!accountXml.hasOwnProperty("AccountId") || int(accountXml.AccountId) == 0 || accountXml.hasOwnProperty("Guest")) {
            var frame:AccountFrameManager = new AccountFrameManager(this.login);
            frame.addEventListener(Event.COMPLETE, this.onFrameComplete);
            frame.addEventListener(AccountEvent.SUCCESS, this.onFrameSuccess);
            addChild(frame);
        }
    }

    public function destroy():void {
        removeChild(this.accountBody);
        removeChild(this.accountHeader);
        removeChild(this.accountFooter);

        this.accountHeader = null;
        this.accountBody = null;
        this.accountFooter = null;
    }

    public function get accountXml():XML {
        if (this.charList == null) return NULL_XML;
        return XML(this.charList.rawCharList.Account);
    }

    public function dispatchAccountMouseEvent(event:MouseEvent):void {
        eventDispatcher.dispatch(event.target.name);
    }

    public function dispatch(eventType:String):void {
        eventDispatcher.dispatch(eventType);
    }

    private function onFrameSuccess(event:AccountEvent):void {
        dispatch(RELOAD);
    }

    private function onFrameComplete(event:Event):void {
        dispatch(SHOW_MAIN_SCREEN);
    }
}
}

