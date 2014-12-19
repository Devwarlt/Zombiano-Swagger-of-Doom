/**
 * Created by Fabian on 18.12.2014.
 */
package AccountManagement {
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.ui.TextButton;
import com.company.ui.SimpleText;

import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;

public class AccountManagementFooter extends Sprite {

    public static const WIDTH:int = 800;
    public static const HEIGHT:int = 70;

    private var closeBtn:TextButton;

    private var managementParent:AccountManagementScreen;

    public function AccountManagementFooter(parent:AccountManagementScreen) {
        this.managementParent = parent;
    }

    public function initialize():void {
        this.closeBtn = new TextButton(36, false, "Close");
        this.closeBtn.addEventListener(MouseEvent.CLICK, managementParent.dispatchAccountMouseEvent);
        this.closeBtn.x = ((WIDTH / 2) - (this.closeBtn.width / 2));
        this.closeBtn.y = ((HEIGHT / 2) - (this.closeBtn.height / 2));
        this.closeBtn.name = AccountManagementScreen.SHOW_MAIN_SCREEN;
        addChild(this.closeBtn);

        if (Parameters.isTesting) {
            var copyrightText:SimpleText = new SimpleText(12, 0x7F7F7F, false, 0, 0, "Myriad Pro");
            copyrightText.text = "Development Page";
            copyrightText.updateMetrics();
            copyrightText.filters = [new DropShadowFilter(0, 0, 0)];
            copyrightText.x = (WIDTH - copyrightText.width);
            copyrightText.y = (HEIGHT - copyrightText.height);
            addChild(copyrightText);
        }
    }
}
}
