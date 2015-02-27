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

//AccountWebrequests._F_V_

package AccountManagement.Frames {
import AccountManagement.AccountEvent;

import Frames.Frame;
import Frames.TextInput;
import Frames.TextInputBig;
import Frames.TextInputSmall;

import com.company.assembleegameclient.ui.TextButton;

import flash.events.MouseEvent;

import com.company.assembleegameclient.appengine.WebRequest;
import com.company.assembleegameclient.parameters.Parameters;

import WebRequestEvents.WebRequestSuccessEvent;
import WebRequestEvents.WebRequestErrorEvent;

public class ForgotPasswordFrame extends Frame {

    public var _xb:TextInput;
    public var _static:TextButton;

    public function ForgotPasswordFrame() {
        super("Forgot your password?  We'll email it.", "Cancel", "Submit");
        this._xb = new TextInputSmall("Email", false, "");
        addTextInput(this._xb);
        this._static = new TextButton(12, false, "New user?  Click here to Register");
        addTextButton(this._static);
        Button1.addEventListener(MouseEvent.CLICK, this.onCancel);
        Button2.addEventListener(MouseEvent.CLICK, this._08Y_);
        this._static.addEventListener(MouseEvent.CLICK, this._mO_);
    }

    private function onCancel(_arg1:MouseEvent):void {
        dispatchEvent(new AccountEvent(AccountEvent.SIGN_IN));
    }

    private function _08Y_(_arg1:MouseEvent):void {
        if (this._xb.text() == "") {
            this._xb.setErrorText("Not a valid email address");
            return;
        }
        var _local2:WebRequest = new WebRequest(Parameters.getAccountServerIP(), "/account", true);
        _local2.addEventListener(WebRequestSuccessEvent.GENERIC_DATA, this._01v);
        _local2.addEventListener(WebRequestErrorEvent.TEXT_ERROR, this._Q_9);
        _local2.sendRequest("forgotPassword", {"guid": this._xb.text()});
        lockButtons();
    }

    private function _01v(_arg1:WebRequestSuccessEvent):void {
        dispatchEvent(new AccountEvent(AccountEvent.SIGN_IN));
    }

    private function _Q_9(_arg1:WebRequestErrorEvent):void {
        this._xb.setErrorText(_arg1.text_);
        releaseButtons();
    }

    private function _mO_(_arg1:MouseEvent):void {
        dispatchEvent(new AccountEvent(AccountEvent.REGISTER));
    }

}
}//package AccountWebrequests

