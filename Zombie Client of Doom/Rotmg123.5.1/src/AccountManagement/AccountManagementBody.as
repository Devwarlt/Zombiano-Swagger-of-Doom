/**
 * Created by Fabian on 17.12.2014.
 */
package AccountManagement {
import AccountManagement.images.AccountManagementImages;
import AccountManagement.tabHolders.TabHolder;

import flash.display.Sprite;

public class AccountManagementBody extends Sprite {

    public static const WIDTH:int = 800;
    public static const HEIGHT:int = 450;

    public function AccountManagementBody(parent:AccountManagementScreen) {
        this.managementParent = parent;
        addChild(new AccountManagementImages.carbonBackground());
    }
    public var managementParent:AccountManagementScreen;
    private var tabHolder:TabHolder;

    public function initialize():void {
    }

    public function updateScreen(holder:TabHolder):void {
        if (this.tabHolder != null) {
            if (getChildIndex(this.tabHolder) != -1) {
                removeChild(this.tabHolder);
            }
        }
        this.tabHolder = holder;
        addChild(this.tabHolder);
    }
}
}