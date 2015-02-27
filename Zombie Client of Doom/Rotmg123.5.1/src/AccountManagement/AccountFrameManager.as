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

//AccountWebrequests._ak

package AccountManagement {
import AccountManagement.Frames.RegisterAccountFrame;
import AccountManagement.Frames.ForgotPasswordFrame;
import AccountManagement.Frames.LoginFrame;

import flash.display.Sprite;

import Frames.Frame;

import com.company.assembleegameclient.appengine.WebRequest;

import flash.display.Shape;
import flash.display.Graphics;

import _qN_.Account;

import com.company.assembleegameclient.parameters.Parameters;

import WebRequestEvents.WebRequestSuccessEvent;
import WebRequestEvents.WebRequestErrorEvent;

import flash.events.Event;

public class AccountFrameManager extends Sprite {

    private var currentFrame:Frame = null;
    private var webRequest:WebRequest = null;
    private var dimShape:Shape;

    public function AccountFrameManager(_arg1:Boolean) {
        this.dimShape = new Shape();
        var _local2:Graphics = this.dimShape.graphics;
        _local2.clear();
        _local2.beginFill(0, 0.8);
        _local2.drawRect(0, 0, 800, 600);
        _local2.endFill();
        addChild(this.dimShape);
        if (_arg1) {
            this.dispatchFrame(new LoginFrame());
        } else {
            this.start();
        }
    }

    private function start():void {
        if (!Account._get().isRegistered()) {
            this.register();
        } else {
            this._X_d();
        }
    }

    private function _X_d():void {
        this._np();
        this.webRequest = new WebRequest(Parameters.getAccountServerIP(), "/account", true);
        this.webRequest.addEventListener(WebRequestSuccessEvent.GENERIC_DATA, this._3p);
        this.webRequest.addEventListener(WebRequestErrorEvent.TEXT_ERROR, this._D_x);
        this.webRequest.sendRequest("verify", Account._get().credentials());
    }

    private function _3p(_arg1:WebRequestSuccessEvent):void {
        dispatchEvent(new AccountEvent(AccountEvent.SUCCESS));
    }

    private function _D_x(_arg1:WebRequestErrorEvent):void {
        Account._get().clear();
        this.dispatchFrame(new LoginFrame());
    }

    private function register():void {
        this.dispatchFrame(new RegisterAccountFrame());
    }

    private function dispatchFrame(_arg1:Frame):void {
        this._np();
        _arg1.addEventListener(AccountEvent.DONE, this.dispatchDone);
        _arg1.addEventListener(AccountEvent.CURRENT, this.dispatchCurrent);
        _arg1.addEventListener(AccountEvent.REGISTER, this.dispatchRegister);
        _arg1.addEventListener(AccountEvent.SIGN_IN, this.dispatchSignIn);
        _arg1.addEventListener(AccountEvent.FORGOT, this.dispatchForgot);
        _arg1.addEventListener(AccountEvent.CHANGE, this.dispatchChange);
        addChild(_arg1);
        this.currentFrame = _arg1;
    }

    private function dispatchDone(_arg1:AccountEvent):void {
        dispatchEvent(new Event(Event.COMPLETE));
    }

    private function dispatchCurrent(_arg1:AccountEvent):void {
        this._X_d();
    }

    private function dispatchRegister(_arg1:AccountEvent):void {
        this.dispatchFrame(new RegisterAccountFrame());
    }

    private function dispatchSignIn(_arg1:AccountEvent):void {
        this.dispatchFrame(new LoginFrame());
    }

    private function dispatchForgot(_arg1:AccountEvent):void {
        this.dispatchFrame(new ForgotPasswordFrame());
    }

    private function dispatchChange(_arg1:AccountEvent):void {
        this.dispatchFrame(new RegisterAccountFrame());
    }

    private function _np():void {
        if (((!((this.currentFrame == null))) && (contains(this.currentFrame)))) {
            removeChild(this.currentFrame);
        }
    }
}
}

