﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.objects.SellableObject

package com.company.assembleegameclient.objects{
    import ToolTips.ToolTip;
    import flash.display.BitmapData;
    import Panels.MerchantPanel;
    import com.company.assembleegameclient.game.GameSprite;
    import Panels.Panel;

    public class SellableObject extends GameObject implements IPanelProvider {

        public var price_:int = 0;
        public var currency_:int = -1;
        public var _U_R_:int = 0;
        public var _0F_S_:int = -1;

        public function SellableObject(_arg1:XML){
            super(_arg1);
        }
        public function setPrice(_arg1:int):void{
            this.price_ = _arg1;
        }
        public function _gF_(_arg1:int):void{
            this.currency_ = _arg1;
        }
        public function setRankReq(_arg1:int):void{
            this._U_R_ = _arg1;
        }
        public function soldObjectName():String{
            return (null);
        }
        public function soldObjectInternalName():String{
            return (null);
        }
        public function getTooltip():ToolTip{
            return (null);
        }
        public function getIcon():BitmapData{
            return (null);
        }
        public function GetPanel(_arg1:GameSprite):Panel{
            return (new MerchantPanel(_arg1, this));
        }

    }
}//package com.company.assembleegameclient.objects

