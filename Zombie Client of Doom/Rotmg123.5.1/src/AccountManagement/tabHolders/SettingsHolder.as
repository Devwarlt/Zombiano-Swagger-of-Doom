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
import AccountManagement.Frames.ChangePasswordFrame;
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
        if (!emailVerified) {
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
        this.changePw.addEventListener(MouseEvent.CLICK, function (event:MouseEvent):void {
            addChild(new FrameHolder(new ChangePasswordFrame()));
        });
        addChild(this.changePw);
        this.notYou = new TextButton(26, false, "Not you?  Click here");
        this.notYou.x = 10;
        this.notYou.y = 70;
        this.notYou.addEventListener(MouseEvent.CLICK, function (event:MouseEvent):void {
            bodyParent.managementParent.dispatch(AccountManagementScreen.LOGOUT);
        });

        addChild(this.notYou);
    }
}
}
