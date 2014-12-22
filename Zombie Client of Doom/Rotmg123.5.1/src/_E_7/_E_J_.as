// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_E_7._E_J_

package _E_7 {
import com.company.assembleegameclient.appengine._0K_R_;
import com.company.assembleegameclient.ui._return;
import com.company.assembleegameclient.util.RankUtils;
import com.company.assembleegameclient.util.TextureRedrawer;
import com.company.assembleegameclient.util._0B_c;
import com.company.assembleegameclient.util._J_H_;
import com.company.assembleegameclient.util._lJ_;
import com.company.ui.SimpleText;
import com.company.util._G_;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.filters.DropShadowFilter;
import flash.geom.ColorTransform;

public class _E_J_ extends _for_ {

    public static function isAvailable(skin:XML, charList:_0K_R_):Boolean {
        return charList.ownedSkins.indexOf(skin.@type) > -1;
    }

    public function _E_J_(_arg1:XML, _arg2:_0K_R_) {
        super(0x401500, 1, 0xFFFFFF, 1);
        var _local4:_lJ_ = _0B_c._J_v(String(_arg1.AnimatedTexture.File), int(_arg1.AnimatedTexture.Index));
        var _local5:_J_H_ = _local4.imageFromDir(_lJ_.RIGHT, _lJ_._sS_, 0);
        var _local6:int = ((4 / _local5.width()) * 100);
        var _local7:BitmapData = TextureRedrawer.redraw(_local5.image_, _local6, true, 0, 0);
        var _local8:Boolean = isAvailable(_arg1, _arg2);
        if (!_local8) {
            _local7 = _G_._B_2(_local7, new ColorTransform(0, 0, 0, 0.5, 0, 0, 0, 0));
        }
        this.skinIcon = new Bitmap();
        this.skinIcon.bitmapData = _local7;
        this.skinIcon.x = -4;
        this.skinIcon.y = -4;
        addChild(this.skinIcon);

        this.nameText_ = new SimpleText(13, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this.nameText_.boldText(true);
        this.nameText_.text = _arg1.@id;
        this.nameText_.updateMetrics();
        this.nameText_.filters = [new DropShadowFilter(0, 0, 0)];
        this.nameText_.x = 32;
        this.nameText_.y = 6;
        addChild(this.nameText_);

        this.specialText = new SimpleText(13, 0xB3B3B3, false, 174, 0, "Myriad Pro");
        this.specialText.boldText(true);
        this.specialText.text = "Special ability:";
        this.specialText.updateMetrics();
        this.specialText.filters = [new DropShadowFilter(0, 0, 0)];
        this.specialText.x = 8;
        this.specialText.y = (height - 2);
        addChild(this.specialText);

        this.specialText = new SimpleText(14, 6206769, false, 0, 0, "Myriad Pro");
        this.specialText.wordWrap = false;
        this.specialText.multiline = true;
        var text:String = "";
        var number:int = 1;
        for each (var special:XML in _arg1.Specials.Special) {
            text += number.toString() + ". " + special + "\n";
            number++;
        }
        if (text == "") {
            text += "No special ability\nAccessory Item.\n";
        }
        this.specialText.text = text.slice(0, text.lastIndexOf("\n"));
        this.specialText.updateMetrics();
        this.specialText.filters = [new DropShadowFilter(0, 0, 0)];
        this.specialText.x = 8;
        this.specialText.y = (height - 2);
        addChild(this.specialText);

        this.spacer1 = new _return(100, 0x310800);
        this.spacer1.x = 6;
        this.spacer1.y = height;
        addChild(this.spacer1);

        this.unlockText = new SimpleText(13, 0xB3B3B3, false, 174, 0, "Myriad Pro");
        this.unlockText.boldText(true);
        if (!_local8) {
            this.unlockText.text = "To Unlock:";
            this.unlockText.updateMetrics();
            this.unlockText.filters = [new DropShadowFilter(0, 0, 0)];
            this.unlockText.x = 8;
            this.unlockText.y = (height - 2);
            addChild(this.unlockText);
            this.unlockText = new SimpleText(13, 16549442, false, 174, 0, "Myriad Pro");
            this.unlockText.wordWrap = false;
            this.unlockText.multiline = true;
            text = "";
            for each (var item:XML in _arg1.Unlock) {
                if (item.hasOwnProperty("Rank")) {
                    text += "Rank required:\n" + RankUtils.toLongRankString(item.Rank) + "\n\n";
                }

                if (item.hasOwnProperty("InGameDrop")) {
                    text += "Find skin in game as drop.\n\n";
                }

                if (item.hasOwnProperty("InGameReward")) {
                    text += "Reward:\n" + item.InGameReward + "\n\n";
                }
            }
            this.unlockText.text = text.slice(0, text.lastIndexOf("\n\n"));
        }
        else {
            this.unlockText.text = "Unlocked";
        }

        this.unlockText.border = false;
        this.unlockText.updateMetrics();
        this.unlockText.filters = [new DropShadowFilter(0, 0, 0)];
        this.unlockText.x = 12;
        this.unlockText.y = (height - 4);
        addChild(this.unlockText);

        if (_arg1.hasOwnProperty("ThanksTo")) {
            this.spacer2 = new _return(100, 0x310800);
            this.spacer2.x = 6;
            this.spacer2.y = height;
            addChild(this.spacer2);

            this.thanksToText = new SimpleText(16, 0x146AE3, false, 174, 0, "Myriad Pro");
            this.thanksToText.boldText(false);
            this.thanksToText.wordWrap = true;
            this.thanksToText.multiline = true;
            this.thanksToText.text = "Special thanks to:";
            this.thanksToText.x = 12;
            this.thanksToText.y = (height - 4);
            this.thanksToText.updateMetrics();
            addChild(this.thanksToText);

            this.thanksToText = new SimpleText(14, 0x00BFFF, false, 174, 0, "Myriad Pro");
            this.thanksToText.boldText(true);
            this.thanksToText.wordWrap = true;
            this.thanksToText.multiline = true;
            this.thanksToText.text = _arg1.ThanksTo;
            this.thanksToText.x = 12;
            this.thanksToText.y = (height - 4);
            this.thanksToText.updateMetrics();
            addChild(this.thanksToText);
        }
    }
    private var skinIcon:Bitmap;
    private var nameText_:SimpleText;
    private var thanksToText:SimpleText;
    private var spacer1:_return;
    private var spacer2:_return;
    private var unlockText:SimpleText;
    private var specialText:SimpleText;

    override public function draw():void {
        this.spacer1._rs((width - 10), 0x310800);
        if (spacer2 != null) {
            this.spacer2._rs((width - 10), 0x310800);
        }
        super.draw();
    }
}
}//package _E_7

