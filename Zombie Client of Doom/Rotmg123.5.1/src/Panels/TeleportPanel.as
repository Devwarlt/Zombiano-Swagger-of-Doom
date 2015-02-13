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
 * Created by Fabian on 16.11.2014.
 */
package Panels {
import AccountManagement.ui.FancyTextButton;

import ServerPackets.TeleportRequest;

import com.company.assembleegameclient.game.GameSprite;

import com.company.assembleegameclient.ui.boxButton;
import com.company.ui.SimpleText;

import flash.events.Event;

import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.filters.DropShadowFilter;

import flash.text.TextFieldAutoSize;

import flash.utils.Timer;

public class TeleportPanel extends Panel {

    public var packet:TeleportRequest;
    private var requestText:SimpleText;
    private var rejectButton:FancyTextButton;
    private var acceptButton:FancyTextButton;
    private var timeoutTimer:Timer;

    public function TeleportPanel(_arg1:GameSprite, _arg2:TeleportRequest) {
        super(_arg1);
        this.packet = _arg2;
        this.requestText = new SimpleText(18, 0xFFFFFF, false, WIDTH, 0, "Myriad Pro");
        this.requestText.boldText(true);
        this.requestText.htmlText = (('<p align="center">' + _arg2.name_) + " wants to teleport to you</p>");
        this.requestText.wordWrap = true;
        this.requestText.multiline = true;
        this.requestText.autoSize = TextFieldAutoSize.CENTER;
        this.requestText.filters = [new DropShadowFilter(0, 0, 0)];
        this.requestText.y = 0;
        addChild(this.requestText);
        this.rejectButton = new FancyTextButton(16, "Reject");
        this.rejectButton.addEventListener(MouseEvent.CLICK, this.closePanel);
        this.rejectButton.x = ((WIDTH / 4) - (this.rejectButton.width / 2));
        this.rejectButton.y = ((HEIGHT - this.rejectButton.height) - 4);
        addChild(this.rejectButton);
        this.acceptButton = new FancyTextButton(16, "Accept");
        this.acceptButton.addEventListener(MouseEvent.CLICK, this.acceptRequest);
        this.acceptButton.x = (((3 * WIDTH) / 4) - (this.acceptButton.width / 2));
        this.acceptButton.y = ((HEIGHT - this.acceptButton.height) - 4);
        addChild(this.acceptButton);
        this.timeoutTimer = new Timer((20 * 1000), 1);
        this.timeoutTimer.start();
        this.timeoutTimer.addEventListener(TimerEvent.TIMER, this.closePanel);
    }

    private function closePanel(_arg1:TimerEvent):void {
        dispatchEvent(new Event(Event.COMPLETE));
    }

    private function acceptRequest(_arg1:MouseEvent):void {
        gs_.packetManager.teleportRequest(packet.objectId_);
        dispatchEvent(new Event(Event.COMPLETE));
    }

}
}
