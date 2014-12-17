/**
 * Created by Fabian on 17.12.2014.
 */
package AccountManagement {
import AccountManagement.images.AccountManagementImages;

import flash.display.Sprite;

public class AccountManagementHeader extends Sprite {

    public static const WIDTH:int = 800;
    public static const HEIGHT:int = 80;

    private var managementParent:AccountManagementScreen;

    public function AccountManagementHeader(parent:AccountManagementScreen) {
        this.managementParent = parent;
        addChild(new AccountManagementImages.AccountHeaderBackground());
    }
}
}
