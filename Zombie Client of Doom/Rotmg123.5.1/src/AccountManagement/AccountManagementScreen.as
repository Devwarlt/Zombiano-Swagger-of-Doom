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
import AccountManagement.Frames.RegisterAccountFrame;

import _02t._R_f;

import _qN_.Account;
import _sp._aJ_;

import com.company.assembleegameclient.ui.FrameHolder;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

public class AccountManagementScreen extends Sprite {

    public var accountXml:XML;
    public var eventDispatcher:_aJ_;

    public var accountHeader:AccountManagementHeader;
    public var accountBody:AccountManagementBody;
    public var accountFooter:AccountManagementFooter;

    public var selectedTab:String;

    public static const SHOW_MAIN_SCREEN:String = "SHOW_MAIN_SCREEN";
    public static const RELOAD:String = "RELOAD";
    public static const LOGOUT:String = "LOGOUT";

    public static var openNext:Boolean = false;

    public function AccountManagementScreen(accountXml:XML) {
        this.accountXml = accountXml;
        openNext = false;
        this.eventDispatcher = new _aJ_(String);
    }

    public function initialize():void {
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

        if (!Account._get().isRegistered()) {
            this.register();
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

    public function dispatchAccountMouseEvent(event:MouseEvent):void {
        eventDispatcher.dispatch(event.target.name);
    }

    public function dispatch(eventType:String):void {
        eventDispatcher.dispatch(eventType);
    }

    private function register():void {
        addChild(new FrameHolder(new RegisterAccountFrame()));
    }
}
}

