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

//Panels.ChangeCharacterPanel

package Panels {
import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.util.Keys;

import flash.events.KeyboardEvent;
import flash.events.Event;
import flash.events.MouseEvent;

public class ChangeCharacterPanel extends SimpleButtonPanel {

    public function ChangeCharacterPanel(_arg1:GameSprite) {
        super(_arg1, "Change Characters", "Change");
        this.addEventListener(Event.ADDED_TO_STAGE, this.onAdded);
        this.addEventListener(Event.REMOVED_FROM_STAGE, this.onRemove);
    }

    protected function onKeyDown(param1:KeyboardEvent):void {
        if (param1.keyCode == Parameters.data_.interact) {
            gs_.dispatchEvent(new Event(Event.COMPLETE));
        }
    }

    override protected function onButtonClick(_arg1:MouseEvent):void {
        gs_.dispatchEvent(new Event(Event.COMPLETE));
    }

    protected function onAdded(param1:Event):void {
        stage.addEventListener(KeyboardEvent.KEY_DOWN, this.onKeyDown);
        this.gs_.dispatchInteractiveObject("Press [" + Keys.KeyNames[Parameters.data_.interact] + "] to interact.");
    }

    protected function onRemove(param1:Event):void {
        stage.removeEventListener(KeyboardEvent.KEY_DOWN, this.onKeyDown);
    }

}
}//package Panels

