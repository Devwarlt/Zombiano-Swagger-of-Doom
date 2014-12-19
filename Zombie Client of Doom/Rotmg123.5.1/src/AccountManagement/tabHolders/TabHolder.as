/**
 * Created by Fabian on 18.12.2014.
 */
package AccountManagement.tabHolders {
import AccountManagement.AccountManagementBody;
import AccountManagement.ui.TabButton;

import com.company.ui.SimpleText;

import flash.display.Sprite;

public class TabHolder extends Sprite {

    public static const WIDTH:int = 800;
    public static const HEIGHT:int = 450;

    protected var bodyParent:AccountManagementBody;
    protected var tab:TabButton;

    private var nullHolder:Boolean;

    public function TabHolder(parent:AccountManagementBody) {
        this.bodyParent = parent;
        nullHolder = true;
    }

    public function initialize(tab:TabButton):void {
        var text:SimpleText = new SimpleText(46, 0xffffff);
        text.text = "Nothing to see here.";
        text.updateMetrics();
        text.x = ((WIDTH / 2) - (text.textWidth / 2));
        text.y = ((HEIGHT / 2) - (text.textHeight / 2));
        addChild(text);
        this.tab = tab;
    }
}
}
