/**
 * Created by Fabian on 16.11.2014.
 */
package Panels {
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
    private var rejectButton:boxButton;
    private var acceptButton:boxButton;
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
        this.rejectButton = new boxButton(16, "Reject");
        this.rejectButton.addEventListener(MouseEvent.CLICK, this.closePanel);
        this.rejectButton.x = ((WIDTH / 4) - (this.rejectButton.width / 2));
        this.rejectButton.y = ((HEIGHT - this.rejectButton.height) - 4);
        addChild(this.rejectButton);
        this.acceptButton = new boxButton(16, "Accept");
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
