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
 * Created by Fabian on 18.12.2014.
 */
package AccountManagement.tabHolders {
import AccountManagement.AccountManagementBody;
import AccountManagement.AccountManagementScreen;
import AccountManagement.ui.TabButton;

import _qN_.Account;

import com.company.assembleegameclient.appengine.WebRequest;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.ui.FrameHolder;
import com.company.assembleegameclient.ui.TextButton;

import flash.events.MouseEvent;

public class SettingsHolder extends TabHolder {


    public var sendVerifyEmail:TextButton;
    public var changePw:TextButton;
    public var notYou:TextButton;

    public function SettingsHolder(parent:AccountManagementBody) {
        super(parent);
    }

    public override function initialize():void {
        var emailVerified:Boolean = bodyParent.managementParent.accountXml.hasOwnProperty("VerifiedEmail");
        if (!emailVerified)
        {
            this.sendVerifyEmail = new TextButton(26, false, ("Email not verified.  " + "Click here to resend email."));
            this.sendVerifyEmail.x = 10;
            this.sendVerifyEmail.y = 10;
            this.sendVerifyEmail.addEventListener(MouseEvent.CLICK, function (event:MouseEvent):void {
                var req:WebRequest = new WebRequest(Parameters.getAccountServerIP(), "/account", true);
                req.sendRequest("sendVerifyEmail", Account._get().credentials());
                sendVerifyEmail.clickAble(false);
                sendVerifyEmail.text_.text = "Sent...";
            });
            addChild(this.sendVerifyEmail);
        }
        this.changePw = new TextButton(26, false, "Click here to change password");
        this.changePw.x = 10;
        this.changePw.y = 40;
        this.changePw.addEventListener(MouseEvent.CLICK, function(event:MouseEvent):void {
            addChild(new FrameHolder(new changePasswordFrame()));
        });
        addChild(this.changePw);
        this.notYou = new TextButton(26, false, "Not you?  Click here");
        this.notYou.x = 10;
        this.notYou.y = 70;
        this.notYou.addEventListener(MouseEvent.CLICK, function(event:MouseEvent):void {
            bodyParent.managementParent.dispatch(AccountManagementScreen.LOGOUT);
        });

        addChild(this.notYou);
    }
}
}

import AccountManagement.tabHolders.TabHolder;

import Frames.Frame;
import Frames.TextInput;
import Frames.TextInputBig;
import Frames.TextInputSmall;

import _qN_.Account;
import WebRequestEvents.WebRequestSuccessEvent;
import WebRequestEvents.WebRequestErrorEvent;

import com.company.assembleegameclient.appengine.WebRequest;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.ui.SimpleText;

import flash.events.Event;
import flash.events.MouseEvent;

class changePasswordFrame extends Frame {

    public var password_:TextInput;
    public var newPassword:TextInput;
    public var confirmNewPassword:TextInput;

    public function changePasswordFrame() {
        super("Change your password", "Cancel", "Submit");
        this.password_ = new TextInputSmall("Password", true, "");
        addTextInput(this.password_);
        this.newPassword = new TextInputSmall("New Password", true, "");
        addTextInput(this.newPassword);
        this.confirmNewPassword = new TextInputSmall("Retype New Password", true, "");
        addTextInput(this.confirmNewPassword);
        this._P_V_._gp(0xffffff);
        Button1.addEventListener(MouseEvent.CLICK, this.onCancel);
        Button2.addEventListener(MouseEvent.CLICK, this.changePassword);
    }

     public override function onAddedToStage(_arg1:Event):void {
         this.x = ((TabHolder.WIDTH) - ((this.w_ + 36)));
         this.y = ((TabHolder.HEIGHT) - (this.h_ + 30));
         if (this._Q_r.length > 0)
         {
             (stage.focus = this._Q_r[0].inputText_);
         }

         this.Button1.y = (this.h_ - 48);
         this.Button2.y = (this.h_ - 48);

         var makeSureText:SimpleText = new SimpleText(30, 0xffffff);
         makeSureText.multiline = true;
         makeSureText.text = "Don't share your password\nto anyone.\nIt's recommended to use a password\nwith at least 2 uppercase characters\nand 2 numbers.";
         makeSureText.updateMetrics();
         makeSureText.x = 20;
         makeSureText.y = 125;
         parent.addChild(makeSureText);
     }

    private function onCancel(_arg1:MouseEvent):void {
        parent.parent.removeChild(parent);
    }
    private function changePassword(_arg1:MouseEvent):void {
        if (this.password_.text().length < 5)
        {
            this.password_.setErrorText("Incorrect password");
            return;
        }
        if (this.newPassword.text().length < 5)
        {
            this.newPassword.setErrorText("Password too short");
            return;
        }
        if (this.newPassword.text() != this.confirmNewPassword.text())
        {
            this.confirmNewPassword.setErrorText("Password does not match");
            return;
        }
        var req:WebRequest = new WebRequest(Parameters.getAccountServerIP(), "/account", true);
        req.addEventListener(WebRequestSuccessEvent.GENERIC_DATA, this.onSuccess);
        req.addEventListener(WebRequestErrorEvent.TEXT_ERROR, this.onError);
        req.sendRequest("changePassword", {
            "guid":Account._get().guid(),
            "password":this.password_.text(),
            "newPassword":this.newPassword.text()
        });
        lockButtons();
    }
    private function onSuccess(_arg1:WebRequestSuccessEvent):void{
        Account._get().modify(Account._get().guid(), this.newPassword.text(), null);
        parent.parent.removeChild(parent);
    }
    private function onError(_arg1:WebRequestErrorEvent):void{
        this.password_.setErrorText(_arg1.text_);
        releaseButtons();
    }

}
