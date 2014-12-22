// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_F_1.ServerSelectionScreen

package _F_1 {
import com.company.assembleegameclient.net.Server;
import com.company.ui.SimpleText;

import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;

public class ServerSelectionScreen extends Sprite {

    public static const WIDTH:int = 384;
    public static const HEIGHT:int = 52;

    public function ServerSelectionScreen(_arg1:Server) {
        var _local2:uint;
        var _local3:String;
        super();
        this.value_ = (((_arg1 == null)) ? null : _arg1.name_);
        this.nameText_ = new SimpleText(18, 0xFFFFFF, false, 0, 0, "Myriad Pro");
        this.nameText_.boldText(true);
        this.nameText_.text = (((_arg1 == null)) ? "Best Server" : _arg1.name_);
        this.nameText_.updateMetrics();
        this.nameText_.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        this.nameText_.x = 18;
        this.nameText_.y = ((ServerSelectionScreen.HEIGHT / 2) - (this.nameText_.height / 2));
        addChild(this.nameText_);
        if (_arg1 != null) {
            _local2 = 0xFF00;
            _local3 = "Normal";
            if (_arg1._02s()) {
                _local2 = 0xFF0000;
                _local3 = "Full";
            } else {
                if (_arg1._0J_m()) {
                    _local2 = 16549442;
                    _local3 = "Crowded";
                }
            }
            this._L_B_ = new SimpleText(18, _local2, false, 0, 0, "Myriad Pro");
            this._L_B_.boldText(true);
            this._L_B_.text = _local3;
            this._L_B_.updateMetrics();
            this._L_B_.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
            this._L_B_.x = ((WIDTH / 2) + ((WIDTH / 4) - (this._L_B_.width / 2)));
            this._L_B_.y = ((ServerSelectionScreen.HEIGHT / 2) - (this.nameText_.height / 2));
            addChild(this._L_B_);
        }
        this.draw();
        addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
    }
    public var value_:String;
    private var nameText_:SimpleText;
    private var _L_B_:SimpleText;
    private var selected_:Boolean = false;
    private var over_:Boolean = false;

    public function setSelected(_arg1:Boolean):void {
        this.selected_ = _arg1;
        this.draw();
    }

    private function draw():void {
        graphics.clear();
        if (this.selected_) {
            graphics.lineStyle(2, 16777103);
        }
        graphics.beginFill(((this.over_) ? 0x6D1000 : 0x5D0E00), 1);
        graphics.drawRect(0, 0, WIDTH, HEIGHT);
        if (this.selected_) {
            graphics.lineStyle();
        }
    }

    private function onMouseOver(_arg1:MouseEvent):void {
        this.over_ = true;
        this.draw();
    }

    private function onRollOut(_arg1:MouseEvent):void {
        this.over_ = false;
        this.draw();
    }

}
}//package _F_1

