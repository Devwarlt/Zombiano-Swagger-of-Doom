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
        addChild(new FrameHolder(new registerFrame()));
    }
}
}


import AccountManagement.AccountManagementScreen;

import Frames.Frame;
import Frames.TextInput;
import Frames.TextInputBig;
import Frames.TextInputSmall;
import Frames._zb;

import _qN_.Account;
import WebRequestEvents.WebRequestSuccessEvent;
import WebRequestEvents.WebRequestErrorEvent;

import com.company.assembleegameclient.appengine.WebRequest;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.ui.TextButton;
import com.company.util._9S_;

import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;


class registerFrame extends Frame {

    public var username:TextInput;
    public var email:TextInput;
    public var password:TextInput;
    public var confirmPassword:TextInput;
    public var tosText:_zb;
    public var login:TextButton;

    public function registerFrame(_arg1:Boolean=false){
        super("Register in order to save your progress", "Cancel", "Register");
        this.username = new TextInputSmall("Username", false, "");
        addTextInput(this.username);
        this.email = new TextInputSmall("Email", false, "");
        addTextInput(this.email);
        this.password = new TextInputSmall("Password", true, "");
        addTextInput(this.password);
        this.confirmPassword = new TextInputSmall("Retype Password", true, "");
        addTextInput(this.confirmPassword);
        this.tosText = new _zb((('I agree to the <font color="#7777EE"><a href="' + Parameters.ToS_Url_) + '" target="_blank">Terms of Use</a></font>.'), false, "");
        _O_1(this.tosText);
        if (_arg1)
        {
            this.login = new TextButton(12, false, "Already Registered?  Click here to Sign In");
            addTextButton(this.login);
        }
        Button1.addEventListener(MouseEvent.CLICK, this.onCancel);
        Button2.addEventListener(MouseEvent.CLICK, this.register);
        this.addEventListener(Event.ADDED_TO_STAGE, this.onAdded);
        this.addEventListener(Event.REMOVED_FROM_STAGE, this.onRemoved);
        if (_arg1)
        {
            this.login.addEventListener(MouseEvent.CLICK, this.onLoginClick);
        }
    }
    private function onCancel(_arg1:MouseEvent):void {
        (parent.parent as AccountManagementScreen).dispatch(AccountManagementScreen.SHOW_MAIN_SCREEN);
    }
    private function register(_arg1:MouseEvent):void{
        if (!_9S_._02A_(this.username.text()))
        {
            this.username.setErrorText("Not a valid username");
            return;
        }
        if (!_9S_.isEmail(this.email.text()))
        {
            this.email.setErrorText("Not a valid email address");
            return;
        }
        if (this.password.text().length < 5)
        {
            this.password.setErrorText("Password too short");
            return;
        }
        if (this.password.text() != this.confirmPassword.text())
        {
            this.confirmPassword.setErrorText("Password does not match");
            return;
        }
        if (!this.tosText._u6())
        {
            this.tosText._0B_T_("Must agree to register");
            return;
        }
        var _local2:WebRequest = new WebRequest(Parameters.getAccountServerIP(), "/account", true);
        _local2.addEventListener(WebRequestSuccessEvent.GENERIC_DATA, this.onSuccess);
        _local2.addEventListener(WebRequestErrorEvent.TEXT_ERROR, this.onError);
        _local2.sendRequest("register", {
            "guid":Account._get().guid(),
            "newGUID":this.username.text(),
            "email":this.email.text(),
            "newPassword":this.password.text(),
            "entrytag":Account._get().entrytag()
        });
        lockButtons();
    }
    private function onSuccess(_arg1:WebRequestSuccessEvent):void{
        Account._get().modify(this.username.text(), this.password.text(), null);
        (parent.parent as AccountManagementScreen).dispatch(AccountManagementScreen.RELOAD);
    }
    private function onError(_arg1:WebRequestErrorEvent):void{
        this.username.setErrorText(_arg1.text_);
        releaseButtons();
    }
    private function onLoginClick(_arg1:MouseEvent):void{
        //dispatchEvent(new _nJ_(_nJ_._2K_));
    }

    private function onAdded(e:Event):void{
        this.addEventListener(KeyboardEvent.KEY_DOWN, this.onKeyPressed);
    }
    private function onRemoved(e:Event):void{
        this.removeEventListener(KeyboardEvent.KEY_DOWN, this.onKeyPressed);
    }
    private function onKeyPressed(e:KeyboardEvent):void{
        if (e.keyCode == 13) {
            this.register(null);
        }
    }
}

