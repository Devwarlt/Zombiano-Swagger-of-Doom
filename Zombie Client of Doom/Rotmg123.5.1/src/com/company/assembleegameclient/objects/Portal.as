// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.objects.Portal

package com.company.assembleegameclient.objects {

import Panels.Panel;
import Panels.PortalPanel;

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.map._0D_v;

import flash.display.IGraphicsData;

public class Portal extends GameObject implements IPanelProvider {

    public function Portal(_arg1:XML) {
        super(_arg1);
        this._0J_A_ = _arg1.hasOwnProperty("NexusPortal");
        this._xq = _arg1.hasOwnProperty("LockedPortal");
    }
    public var _0J_A_:Boolean;
    public var _xq:Boolean;
    public var _09S_:Boolean = true;

    override public function draw(_arg1:Vector.<IGraphicsData>, _arg2:_0D_v, _arg3:int):void {
        super.draw(_arg1, _arg2, _arg3);
        if (this._0J_A_) {
            _oL_(_arg1, _arg2);
        }
    }

    public function GetPanel(_arg1:GameSprite):Panel {
        return (new PortalPanel(_arg1, this));
    }

}
}//package com.company.assembleegameclient.objects

