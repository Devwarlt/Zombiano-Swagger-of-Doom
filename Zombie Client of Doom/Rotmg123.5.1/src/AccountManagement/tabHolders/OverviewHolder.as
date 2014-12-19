/**
 * Created by Fabian on 19.12.2014.
 */
package AccountManagement.tabHolders {
import AccountManagement.AccountManagementBody;
import AccountManagement.ui.TabButton;

import com.company.assembleegameclient.ui._0K_B_;

public class OverviewHolder extends TabHolder {

    private var scrollBar:_0K_B_;

    public function OverviewHolder(parent:AccountManagementBody) {
        super(parent);
    }

    public override function initialize(tab:TabButton):void {
        this.tab = tab;

        this.scrollBar = new _0K_B_(16, HEIGHT - 20);
        this.scrollBar.x = WIDTH - 20;
        this.scrollBar.y = 10;
        addChild(this.scrollBar);

        var curentHeight:Number = 5;
        for each (var item:LogItem in parseItems(XML(bodyParent.managementParent.accountXml.News))) {

        }

        curentHeight += 5;
        this.scrollBar._fA_(HEIGHT, curentHeight);
    }


    private static function parseItems(xml:XML):Vector.<LogItem> {
        var items:Array = [];
        var item:LogItem;
        for each (var i:XML in xml.Item) {
            item = new LogItem();
            item.title = i.Title;
            item.tagLine = i.TagLine;
            item.link = i.Link;
            item.icon = i.Icon;
            item.dateTime = i.Date;
            items.push(item);
        }
        items.sortOn("dateTime", Array.NUMERIC);
        return Vector.<LogItem>(items);
    }
}
}

import flash.display.Sprite;

class LogItem {
    public var title:String;
    public var icon:String;
    public var dateTime:int;
    public var link:String;
    public var tagLine:String;
}

class LogItemHolder extends Sprite {

}


