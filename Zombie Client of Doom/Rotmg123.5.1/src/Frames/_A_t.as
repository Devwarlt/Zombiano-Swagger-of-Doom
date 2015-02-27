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

//Frames._A_t

package Frames {
import com.company.assembleegameclient.appengine.WebRequest;

import flash.events.MouseEvent;
import flash.events.Event;

import com.company.assembleegameclient.parameters.Parameters;

import WebRequestEvents.WebRequestSuccessEvent;
import WebRequestEvents.WebRequestErrorEvent;

import com.company.util.QueryHelper;

import _qN_.Account;

public class _A_t extends Frame {

    private var name_:TextInput;
    private var _zH_:WebRequest = null;

    public function _A_t() {
        super("Choose a unique account name", "Cancel", "Choose");
        this.name_ = new TextInputSmall("Name", false, "");
        this.name_.inputText_.restrict = "A-Za-z";
        this.name_.inputText_.maxChars = 10;
        addTextInput(this.name_);
        addTextLine("Maximum 10 characters");
        addTextLine("No numbers, spaces or punctuation");
        addTextLine("Racism or profanity gets you banned");
        Button1.addEventListener(MouseEvent.CLICK, this.onCancel);
        Button2.addEventListener(MouseEvent.CLICK, this._J_p);
    }

    private function onCancel(_arg1:MouseEvent):void {
        dispatchEvent(new Event(Event.CANCEL));
    }

    private function _J_p(_arg1:MouseEvent):void {
        if (this.name_.text().length < 1) {
            this.name_.setErrorText("Name too short");
            return;
        }
        var _local2:WebRequest = new WebRequest(Parameters.getAccountServerIP(), "/account", true);
        _local2.addEventListener(WebRequestSuccessEvent.GENERIC_DATA, this._E_0);
        _local2.addEventListener(WebRequestErrorEvent.TEXT_ERROR, this._06Q_);
        var _local3:Object = {"name": this.name_.text()};
        QueryHelper.mergeQueries(_local3, Account._get().credentials());
        _local2.sendRequest("setName", _local3);
        lockButtons();
    }

    private function _E_0(_arg1:WebRequestSuccessEvent):void {
        dispatchEvent(new Event(Event.COMPLETE));
    }

    private function _06Q_(_arg1:WebRequestErrorEvent):void {
        this.name_.setErrorText(_arg1.text_);
        releaseButtons();
    }

}
}//package Frames

