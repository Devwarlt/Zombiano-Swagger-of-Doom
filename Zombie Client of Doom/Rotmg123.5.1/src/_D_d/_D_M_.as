﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_D_d._D_M_

package _D_d{
    import ToolTips.ToolTip;
    import com.company.ui.SimpleText;
    import flash.filters.DropShadowFilter;

    public class _D_M_ extends ToolTip {

        private static const _be:int = 180;

        private var _P_V_:SimpleText;

        public function _D_M_(_arg1:XML){
            super(0x363636, 1, 0x9B9B9B, 1, true);
            this._P_V_ = new SimpleText(16, 0xFFFFFF, false, (_be - 4), 0, "Myriad Pro");
            this._P_V_.boldText(true);
            this._P_V_.wordWrap = true;
            this._P_V_.text = String(_arg1.@id);
            this._P_V_._08S_();
            this._P_V_.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
            this._P_V_.x = 0;
            this._P_V_.y = 0;
            addChild(this._P_V_);
        }
    }
}//package _D_d

