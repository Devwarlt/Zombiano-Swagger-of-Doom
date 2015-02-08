/**
 * Created by Fabian on 24.01.2015.
 */
package AccountManagement.tabHolders {
import AccountManagement.AccountManagementBody;

import com.company.assembleegameclient.ui.ScrollBar;

import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;

public class AchievementsHolder extends TabHolder {

    private var scrollBar:ScrollBar;
    private var achievements:Sprite;
    private var totalHeight:Number;

    public function AchievementsHolder(parent:AccountManagementBody) {
        super(parent);
    }

    public override function initialize():void {
        var nextWidth:Number = 0;
        var nextHeight:Number = 0;
        var ac:achievement;
        this.achievements = new Sprite();
        this.achievements.x = 5;
        this.achievements.y = 10;

        var acMask:Shape = new Shape();
        acMask.graphics.beginFill(0x000000, 0.0);
        acMask.graphics.drawRect(0, 0, WIDTH - 20, HEIGHT);
        acMask.graphics.endFill();
        this.achievements.mask = acMask;
        addChild(acMask);

        for each (var data:XML in bodyParent.managementParent.accountXml.Achievements.Item) {
            ac = new achievement(data);
            ac.x = ((nextWidth % 3) * (achievement.WIDTH)) + (nextWidth % 3 * 10);
            ac.y = (Math.floor(nextHeight / 3) * achievement.HEIGHT) + (Math.floor(nextHeight / 3) * 10);
            this.achievements.addChild(ac);

            nextWidth++;
            nextHeight++;
        }

        this.totalHeight = ((Math.floor((nextHeight - 1) / 3) + 1) * achievement.HEIGHT) + ((Math.floor((nextHeight - 1) / 3) + 2) * 10);

        if(this.totalHeight > HEIGHT) {
            this.scrollBar = new ScrollBar(16, HEIGHT - 20, 1);
            this.scrollBar.x = WIDTH - 20;
            this.scrollBar.y = 10;
            this.scrollBar._fA_(HEIGHT, this.totalHeight);
            this.scrollBar.addEventListener(Event.CHANGE, this.onChange);
            addChild(this.scrollBar);
        }
        addChild(this.achievements);
    }

    private function onChange(event:Event):void {
        var curPos:Number;
        if(!isNaN(curPos = this.scrollBar._Q_D_())) {
            this.achievements.y = 10 + (-curPos * (this.totalHeight - HEIGHT));
        }
    }
}
}

import com.company.ui.SimpleText;

import flash.display.GradientType;
import flash.events.Event;
import flash.geom.Matrix;
import flash.utils.getTimer;
import flash.display.Sprite;

class achievement extends Sprite {
    public static const WIDTH:int = 250;
    public static const HEIGHT:int = 100;

    private var oldTime:int = -1;
    private var title:SimpleText;
    private var desc:SimpleText;
    private var completed:SimpleText;

    private var data:XML;

    public function achievement(data:XML) {
        this.data = data;
        this.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);

        this.title = new SimpleText(20, data.hasOwnProperty("Completed") ? 0xffffff : 0x6E6E6E);
        this.title.boldText(true);
        this.title.text = data.Title;
        this.title.x = 10;
        this.title.y = 2;
        this.title.updateMetrics();
        addChild(this.title);

        this.desc = new SimpleText(16, data.hasOwnProperty("Completed") ? 0xffffff : 0x6E6E6E, false, WIDTH - 20);
        this.desc.multiline = true;
        this.desc.wordWrap = true;
        this.desc.text = data.Description;
        this.desc.x = 10;
        this.desc.y = 2 + title.height;
        this.desc.updateMetrics();
        addChild(this.desc);

        this.completed = new SimpleText(16, data.hasOwnProperty("Completed") ? 0x37FF00 : 0xFF0000, false, WIDTH - 20);
        this.completed.multiline = true;
        this.completed.wordWrap = true;
        this.completed.text = data.hasOwnProperty("Completed") ? "Completed at:\n" + new Date(data.Completed * 1000).toDateString() : "Not completed yet.";
        this.completed.updateMetrics();
        this.completed.x = 10;
        this.completed.y = HEIGHT - this.completed.height - 5;
        addChild(this.completed);
    }

    private function onEnterFrame(event:Event):void {
        var time:int;
        if ((time = ((getTimer() / 10) % 360)) != oldTime) {
            graphics.clear();
            graphics.beginFill(0x000000, 1.0);
            graphics.drawRect(0, 0, WIDTH, HEIGHT);
            graphics.endFill();

            var gradientMatrix:Matrix = new Matrix();
            gradientMatrix.createGradientBox(WIDTH, HEIGHT, (Math.PI / 180) * time, 0, 0);
            graphics.lineStyle(2);
            graphics.lineGradientStyle(GradientType.LINEAR, [0xffffff, data.hasOwnProperty("Completed") ? 0x37FF00 : 0xFF0000], [1.0, 1.0], [0, 255], gradientMatrix);
            graphics.drawRect(0, 0, WIDTH, HEIGHT);
            graphics.endFill();
            this.oldTime = time;
        }
    }
}
