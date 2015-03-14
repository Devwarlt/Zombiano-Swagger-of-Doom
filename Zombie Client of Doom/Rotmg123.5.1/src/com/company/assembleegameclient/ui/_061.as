// Copyright (c) 2015, FireBite/Aceticsoft Studios Inc.
// All rights reserved.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
// ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.ui._061

package com.company.assembleegameclient.ui {
import Frames.CraftingFrame;

import Panels.CraftingPanel;
import Panels._sc;

import Sounds.UrlSoundEffects;

import com.company.assembleegameclient.map.GameMap;
import com.company.assembleegameclient.objects.Container;
import com.company.assembleegameclient.objects.CraftingRecipeBook;
import com.company.assembleegameclient.objects.CraftingTerminal;
import com.company.assembleegameclient.objects.GameObject;
import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.assembleegameclient.objects.Player;
import com.company.ui.SimpleText;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Matrix;

public class _061 extends Sprite {

    private static const _1U_:Matrix = function ():Matrix {
        var _local1:* = new Matrix();
        _local1.translate(10, 5);
        return (_local1);
    }();

    private static var _0B_w:int = -1000;

    public var bitmap_:Bitmap;
    public var _0N_1:int;
    public var itemId:int;
    public var inventory:InventorySlot;
    public var _e:Boolean;

    public function _061(_arg1:int, _arg2:InventorySlot) {
        var _local6:SimpleText;
        super();
        this.itemId = _arg1;
        var _local3:XML = ObjectLibrary.Items[_arg1];
        var _local4:int = 5;
        if (_local3.hasOwnProperty("ScaleValue")) {
            _local4 = _local3.ScaleValue;
        }
        var _local5:BitmapData = ObjectLibrary.getRedrawnTextureFromType(this.itemId, 80, true, true, _local4);
        if (_local3.hasOwnProperty("Doses")) {
            _local5 = _local5.clone();
            _local6 = new SimpleText(12, 0xFFFFFF, false, 0, 0, "Myriad Pro");
            _local6.text = String(_local3.Doses);
            _local6.updateMetrics();
            _local5.draw(_local6, _1U_);
        }
        this.bitmap_ = new Bitmap(_local5);
        this.bitmap_.x = (-(this.bitmap_.width) / 2);
        this.bitmap_.y = (-(this.bitmap_.height) / 2);
        addChild(this.bitmap_);
        this.inventory = _arg2;
        addEventListener(MouseEvent.MOUSE_UP, this.releaseItem);
    }

    public function releaseItem(_arg1:Event):void {
        if (!this._e) {
            return;
        }
        InventorySlot.dragging = false;
        stopDrag();
        this._e = false;
        var _local2:DisplayObject = dropTarget;
        while (_local2 != null) {
            if ((_local2 is InventorySlot)) {
                this._08D_((_local2 as InventorySlot));
                return;
            }
            if ((((_local2 is GameMap)) || ((_local2 is ChatBox)))) {
                this.dropItemInWorld();
                return;
            }
            if (_local2 is SellItemContainer) {
                (_local2 as SellItemContainer).dropItem(this.itemId, this.inventory.slotId, this.bitmap_.bitmapData);
                this._0K_9();
                return;
            }
            _local2 = _local2.parent;
        }
        this._0K_9();
        UrlSoundEffects.play("error");
    }

    private function _08D_(_arg1:InventorySlot):void {
        if (_arg1._e9.gameObject_ is CraftingRecipeBook || this.inventory._e9.gameObject_ is CraftingRecipeBook) {
            this._0K_9();
            return;
        }
        if ((((_arg1 == null)) || (!(_arg1._t8(this.itemId))))) {
            this._0K_9();
            UrlSoundEffects.play("error");
            return;
        }
        if (_arg1 == this.inventory) {
            this._0K_9();
            return;
        }
        var _local2:int = _arg1.objectType_;
        if (((!((_local2 == -1))) && (!(this.inventory._t8(_local2))))) {
            this._0K_9();
            UrlSoundEffects.play("error");
            return;
        }
        if (_local2 == this.itemId) {
            this._0K_9();
            return;
        }
        if ((this.inventory._e9.gs_.lastUpdate_ - _0B_w) < 500) {
            this._0K_9();
            return;
        }
        var _local3:Player = this.inventory._e9.gs_.map_.player_;
        if (_local3 == null) {
            this._0K_9();
            return;
        }
        if (_arg1._e9.gameObject_ is CraftingTerminal) {
            if (!(this.inventory._e9.gameObject_ is CraftingTerminal)) {
                if (this.inventory.slotId > 3 && _arg1.slotId != 9) {
                    CraftingFrame.updateInv(_arg1.slotId, this.itemId, this.inventory.slotId);
                    if (this.inventory.slotId > 11 && this.inventory.slotId < 20) {
                        this.inventory._e9.gs_.map_.player_.backpack1[this.inventory.slotId - 12] = -1;
                    }
                    else if (this.inventory.slotId > 19) {
                        this.inventory._e9.gs_.map_.player_.backpack2[this.inventory.slotId - 20] = -1;
                    }
                    else {
                        this.inventory._e9.gs_.map_.player_.equipment_[this.inventory.slotId] = -1;
                    }
                }
            }
            else {
                if (this.inventory.slotId != 9 && _arg1.slotId != 9) {
                    var item1:int = CraftingFrame.items[_arg1.slotId];
                    var item2:int = CraftingFrame.items[this.inventory.slotId];
                    var p1:int = CraftingFrame.playerItems[_arg1.slotId];
                    var p2:int = CraftingFrame.playerItems[this.inventory.slotId];

                    if (item1 == 0) item1 = -1;
                    if (item2 == 0) item2 = -1;

                    CraftingFrame.updateInv(_arg1.slotId, item2, p2);
                    CraftingFrame.updateInv(this.inventory.slotId, item1, p1);
                }
            }
            this._0K_9();
            return;
        }
        else if (this.inventory._e9.gameObject_ is CraftingTerminal && _arg1._e9.gameObject_ is Player) {
            var slotId:int = CraftingFrame.playerItems[this.inventory.slotId];
            if (_arg1.slotId > 3 && this.inventory.slotId != 9) {
                if (_arg1.slotId > 11 && _arg1.slotId < 20) {
                    if (slotId < 0 || (slotId - 12) > 7) {
                        if ((slotId - 12) > 7) {
                            this.inventory._e9.gs_.map_.player_.backpack2[slotId - 20] = CraftingFrame.items[this.inventory.slotId];
                        }
                        else {
                            this.inventory._e9.gs_.map_.player_.equipment_[slotId] = CraftingFrame.items[this.inventory.slotId];
                        }
                    }
                    else {
                        this.inventory._e9.gs_.map_.player_.backpack1[slotId - 12] = CraftingFrame.items[this.inventory.slotId];
                    }
                }
                else if (_arg1.slotId > 19) {
                    if ((slotId - 20) < 0) {
                        if ((slotId - 12) < 0) {
                            this.inventory._e9.gs_.map_.player_.equipment_[slotId] = CraftingFrame.items[this.inventory.slotId];
                        }
                        else {
                            this.inventory._e9.gs_.map_.player_.backpack1[slotId - 12] = CraftingFrame.items[this.inventory.slotId];
                        }
                    }
                    else {
                        this.inventory._e9.gs_.map_.player_.backpack2[slotId - 20] = CraftingFrame.items[this.inventory.slotId];
                    }
                }
                else {
                    if (slotId > 11) {
                        if (slotId - 12 > 7) {
                            this.inventory._e9.gs_.map_.player_.backpack2[slotId - 20] = CraftingFrame.items[this.inventory.slotId];
                        }
                        else {
                            this.inventory._e9.gs_.map_.player_.backpack1[slotId - 12] = CraftingFrame.items[this.inventory.slotId];
                        }
                    }
                    else {
                        this.inventory._e9.gs_.map_.player_.equipment_[slotId] = CraftingFrame.items[this.inventory.slotId];
                    }
                }
                CraftingFrame.updateInv(this.inventory.slotId, -1, this.inventory.slotId);
            }
            this._0K_9();
            return;
        }
        if ((((((_arg1._e9.gameObject_ is Player)) && ((_arg1.slotId < 4)))) && (!(ObjectLibrary._S_d(this.itemId, (_arg1._e9.gameObject_ as Player)))))) {
            this._0K_9();
            UrlSoundEffects.play("error");
            return;
        }
        if (!CraftingPanel.terminalOpen) {
            _0B_w = this.inventory._e9.gs_.lastUpdate_;
            this.inventory._e9.gs_.packetManager._P_a(_0B_w, _local3.x_, _local3.y_, this.inventory._e9.gameObject_.objectId_, this.inventory.slotId, this.itemId, _arg1._e9.gameObject_.objectId_, _arg1.slotId, _local2);
            UrlSoundEffects.play("inventory_move_item");
        }
        else {
            this._0K_9();
        }
    }

    private function dropItemInWorld():void {
        if (!CraftingPanel.terminalOpen) {
            var _local6:_sc;
            var _local7:InventorySlot;
            var _local1:Player = this.inventory._e9.gs_.map_.player_;
            var _local2:GameObject = this.inventory._e9.gameObject_;
            var _local3:Container = (_local2 as Container);
            var _local4:Boolean = ObjectLibrary._0H_Z_(this.itemId);
            if (((!((_local2 == _local1))) && ((((((_local3 == null)) || (!((_local3.ownerId_ == _local1.accountId_))))) || (_local4))))) {
                this._0K_9();
                UrlSoundEffects.play("error");
                return;
            }
            var _local5:Container = (this.inventory._e9.gs_.sideUI._U_T_._dN_ as Container);
            if (((!((_local5 == null))) && (((((_local5._X_w()) && (_local4))) || ((((_local5.ownerId_ == -1)) && (!(_local4)))))))) {
                _local6 = (this.inventory._e9.gs_.sideUI._U_T_._G_2 as _sc);
                if (((!((_local6 == null))) && (!((_local6.inventory == null))))) {
                    for each (_local7 in _local6.inventory.slots_) {
                        if (_local7.objectType_ == -1) {
                            this._08D_(_local7);
                            return;
                        }
                    }
                }
            }
            this.inventory._e9.gs_.packetManager._8q(this.inventory._e9.gameObject_.objectId_, this.inventory.slotId, this.itemId);
        }
        else {
            this._0K_9();
        }
    }

    private function _0K_9():void {
        this.inventory.addChild(this);
        this.inventory._0E_J_();
    }

}
}//package com.company.assembleegameclient.ui

