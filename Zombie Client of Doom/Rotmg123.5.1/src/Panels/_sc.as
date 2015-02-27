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

package Panels {

import Sounds.LocalSoundEffects;
import Sounds.LocalSounds;

import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.assembleegameclient.objects.Player;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.ui.Slot;
import com.company.assembleegameclient.ui.Inventory;
import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.Container;
import com.company.util.Keys;

import flash.events.Event;
import flash.events.KeyboardEvent;


public class _sc extends Panel {

    private static const _hP_:Vector.<int> = new <int>[Slot.any_, Slot.any_, Slot.any_, Slot.any_, Slot.any_, Slot.any_, Slot.any_, Slot.any_];

    public var inventory:Inventory;

    public function _sc(_arg1:GameSprite, _arg2:Container) {
        super(_arg1);
        if (_arg2.objectType_ == 0x0504 || _arg2.objectType_ == 0x0501) {
            LocalSoundEffects.play(LocalSounds.openChest);
        }
        this.inventory = new Inventory(gs_, _arg2, _arg2._include(), _hP_, 8, false);
        this.inventory.x = 8;
        addChild(this.inventory);
        this.addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        this.addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
    }

    override public function draw():void {
        this.inventory.draw(this.inventory.gameObject_.equipment_);
    }

    private function onRemovedFromStage(event:Event):void {
        stage.removeEventListener(KeyboardEvent.KEY_DOWN, this.onKeyDown);
        if (this.inventory.gameObject_.objectType_ == 0x0504 || this.inventory.gameObject_.objectType_ == 0x0501) {
            LocalSoundEffects.play(LocalSounds.closeChest);
        }
    }

    private function onAddedToStage(event:Event):void {
        stage.addEventListener(KeyboardEvent.KEY_DOWN, this.onKeyDown);
        var itemName:String;
        if ((itemName = resolveItemName()) != null) {
            if (this.gs_.map_.player_.equipment_.indexOf(-1) > -1)
                this.gs_.dispatchInteractiveObject("Press [" + Keys.KeyNames[Parameters.data_.interact] + "] to pick up: " + itemName);
            else
                this.gs_.dispatchInteractiveObject("Inventory Full!");
        }
    }

    private function onKeyDown(event:KeyboardEvent):void {
        if (event.keyCode == Parameters.data_.interact) {
            if (this.inventory.gameObject_.equipment_ == null) return;

            var player:Player = this.gs_.map_.player_;
            var con:Container = this.inventory.gameObject_ as Container;
            var time:int = this.gs_.lastUpdate_;

            for (var index:int = 0; index < con.equipment_.length; index++) {
                if (con.equipment_[index] != -1 && player.equipment_.indexOf(-1) > -1) {
                    for (var playerIndex:int = 0; playerIndex < player.equipment_.length; playerIndex++) {
                        var item:XML = ObjectLibrary.Items[con.objectType_];
                        if (item == null) return;

                        if (player.equipment_[playerIndex] == -1 && (player._9A_[playerIndex] == 0 || player._9A_[playerIndex] == 10 || player._9A_[playerIndex] == item.SlotId)) break;
                    }
                    this.gs_.packetManager._P_a(time,
                            con.x_, con.y_, con.objectId_, index, con.objectType_,
                            player.objectId_, playerIndex, player.objectType_);

                    var itemName:String;
                    if ((itemName = resolveItemName(index)) != null) {
                        if (this.gs_.map_.player_.equipment_.indexOf(-1) > -1)
                            this.gs_.dispatchInteractiveObject("Press [" + Keys.KeyNames[Parameters.data_.interact] + "] to pick up: " + itemName);
                        else
                            this.gs_.dispatchInteractiveObject("Inventory Full!");
                    }

                    return;
                }
            }
        }
    }

    private function resolveItemName(excludeIndex:int = int.MIN_VALUE):String {
        if (this.inventory.gameObject_.equipment_ == null) return null;
        for (var i:int = 0; i < this.inventory.gameObject_.equipment_.length; i++) {
            if (excludeIndex != i) {
                if (this.inventory.gameObject_.equipment_[i] != -1) return ObjectLibrary.Items[this.inventory.gameObject_.equipment_[i]].@id;
            }
        }
        return null;
    }
}
}

