// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_E_7.RankToolTip

package _E_7 {
import com.company.assembleegameclient.ui._return;
import com.company.assembleegameclient.util.RankUtils;
import com.company.rotmg.graphics.ranks.AdminRank;
import com.company.ui.SimpleText;

import flash.filters.DropShadowFilter;

public class RankToolTip extends _for_ {

    public function RankToolTip(_arg1:int) {
        var _local2:LegendLine;
        super(0x4D1F00, 1, 0xFFFFFF, 1);
        this._2U_ = new SimpleText(13, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this._2U_.boldText(true);
        this._2U_.text = "You are " + RankUtils.toLongRankString(_arg1);
        this._2U_.updateMetrics();
        this._2U_.filters = [new DropShadowFilter(0, 0, 0)];
        this._2U_.x = 6;
        this._2U_.y = 2;
        addChild(this._2U_);
        this.star_ = new AdminRank();
        this.star_.x = (this._2U_.width + 7);
        this.star_.y = (this._2U_.y);
        this.star_.filters = [new DropShadowFilter(0, 0, 0, 1, 4, 4, 1.5)];
        addChild(this.star_);
        this._I_u = new SimpleText(13, 0xB3B3B3, false, 174, 0, "Myriad Pro");
        this._I_u.wordWrap = true;
        this._I_u.multiline = true;
        this._I_u.text = "You can get promoted by killing more zombies.";
        this._I_u.updateMetrics();
        this._I_u.filters = [new DropShadowFilter(0, 0, 0)];
        this._I_u.x = 6;
        this._I_u.y = 30;
        addChild(this._I_u);
        this._qc = new _return(100, 0x310800);
        this._qc.x = 6;
        this._qc.y = (height + 10);
        addChild(this._qc);
        var _local3:int = (this._qc.y + 3);
        var _local4:int = 0;
        while (_local4 < 13) {
            _local2 = new LegendLine(_local4);
            _local2.x = 6;
            _local2.y = _local3;
            addChild(_local2);
            _local3 = (_local3 + _local2.height + 4);
            _local4++;
        }
        this.spacer2 = new _return(100, 0x310800);
        this.spacer2.x = 6;
        this.spacer2.y = _local3 + 8;
        _local3 += spacer2.height + 4;
        addChild(spacer2);
        _local2 = new LegendLine(13);
        _local2.x = 6;
        _local2.y = _local3;
        addChild(_local2);
        height = (height + 6);
    }
    private var _2U_:SimpleText;
    private var star_:AdminRank;
    private var _I_u:SimpleText;
    private var _qc:_return;
    private var spacer2:_return;

    override public function draw():void {
        this._qc._rs((width - 10), 0x310800);
        this.spacer2._rs((width - 10), 0x310800);
        super.draw();
    }

}
}//package _E_7

import com.company.assembleegameclient.util.RankUtils;
import com.company.ui.SimpleText;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.filters.DropShadowFilter;

class LegendLine extends Sprite {

    private var rank:DisplayObject;
    private var rangeText_:SimpleText;

    public function LegendLine(_arg1:int) {
        this.rank = RankUtils._bl(_arg1);
        this.rank.y = 4;
        addChild(this.rank);
        this.rangeText_ = new SimpleText(13, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this.rangeText_.boldText(true);
        this.rangeText_.text = ": " + RankUtils.toLongRankString(_arg1) + " (" + (_arg1 == 0 ? "Also PVT." : RankUtils.toShortRankString(_arg1)) + ")" + (_arg1 == 13 ? " (Admin)" : _arg1 == 0 ? " (No Icon)" : "");
        this.rangeText_.updateMetrics();
        this.rangeText_.filters = [new DropShadowFilter(0, 0, 0)];
        this.rangeText_.x = this.rank.width;
        this.rangeText_.y = 8;
        addChild(this.rangeText_);
    }
}

