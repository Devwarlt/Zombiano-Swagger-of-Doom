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

/**
 * Created by Fabian on 22.11.2014.
 */
package Panels {
import Sounds.LocalSoundEffects;
import Sounds.LocalSounds;

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.Container;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.ui.Inventory;
import com.company.assembleegameclient.ui.Slot;
import com.company.util.Keys;

import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;

public class OpenChestPanel extends SimpleButtonPanel {

    private static const slots:Vector.<int> = new <int>[Slot.any_, Slot.any_, Slot.any_, Slot.any_, Slot.any_, Slot.any_, Slot.any_, Slot.any_];

    public var inventory:Inventory;
    private var opened:Boolean;

    public function OpenChestPanel(_arg1:GameSprite, _arg2:Container){
        super(_arg1, "Open chest", "Open");

        this.addEventListener(Event.ADDED_TO_STAGE,this.onAdded);
        this.addEventListener(Event.REMOVED_FROM_STAGE,this.onRemove);

        this.inventory = new Inventory(gs_, _arg2, _arg2._include(), slots, 8, false);
        this.inventory.x = 8;
    }
    protected function onKeyDown(param1:KeyboardEvent):void{
        if(param1.keyCode == Parameters.data_.interact){
            if(!opened) {
                opened = true;
                addChild(this.inventory);
                super.removeChild(super.button);
                super.removeChild(super.text);
                if(this.inventory.gameObject_.objectType_ == 0x0504 || this.inventory.gameObject_.objectType_ == 0x0501) {
                    LocalSoundEffects.play(LocalSounds.openChest);
                }
            }
        }
    }
    protected override function onButtonClick(param1:MouseEvent):void{
        if(!opened) {
            opened = true;
            addChild(this.inventory);
            super.removeChild(super.button);
            super.removeChild(super.text);

            if(this.inventory.gameObject_.objectType_ == 0x0504 || this.inventory.gameObject_.objectType_ == 0x0501) {
                LocalSoundEffects.play(LocalSounds.openChest);
            }
        }
    }

    protected function onAdded(param1:Event):void {
        stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
        this.gs_.dispatchInteractiveObject("Press [" + Keys.KeyNames[Parameters.data_.interact] + "] to interact.");
    }

    protected function onRemove(param1:Event):void {
        if(this.inventory.gameObject_.objectType_ == 0x0504 || this.inventory.gameObject_.objectType_ == 0x0501) {
            if(opened) {
                LocalSoundEffects.play(LocalSounds.closeChest);
            }
        }
        stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
    }

    override public function draw():void{
        if(opened) {
            this.inventory.draw(this.inventory.gameObject_.equipment_);
        }
    }
}
}
