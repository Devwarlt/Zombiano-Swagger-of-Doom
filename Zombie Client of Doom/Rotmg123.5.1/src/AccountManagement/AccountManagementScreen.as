/**
 * Created by Fabian on 16.12.2014.
 */
package AccountManagement {
import _sp._aJ_;

import com.company.assembleegameclient.appengine._0K_R_;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.ui.TextButton;
import com.company.ui.SimpleText;

import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;

public class AccountManagementScreen extends Sprite {

    private var charList:_0K_R_;
    private var closeBtn:TextButton;

    public var eventDispatcher:_aJ_;
    public var accountHeader:AccountManagementHeader;

    public function AccountManagementScreen(charList:_0K_R_) {
        this.charList = charList;
        this.accountHeader = new AccountManagementHeader(this);
        addChild(this.accountHeader);

        if (Parameters.isTesting) {
            var copyrightText:SimpleText = new SimpleText(12, 0x7F7F7F, false, 0, 0, "Myriad Pro");
            copyrightText.text = "Development Page";
            copyrightText.updateMetrics();
            copyrightText.filters = [new DropShadowFilter(0, 0, 0)];
            copyrightText.x = (800 - copyrightText.width);
            copyrightText.y = (600 - copyrightText.height);
            addChild(copyrightText);
        }
        this.eventDispatcher = new _aJ_(String);
    }

    public function initialize():void {
        this.closeBtn = new TextButton(36, false, "Close");
        this.closeBtn.addEventListener(MouseEvent.CLICK, dispatchAccountMouseEvent);
        this.closeBtn.x = ((800 / 2) - (this.closeBtn.width / 2));
        this.closeBtn.y = 530;
        addChild(this.closeBtn);
    }

    public function dispatchAccountMouseEvent(event:MouseEvent):void {
        eventDispatcher.dispatch(event.target.name);
    }
}
}
