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
 * Created by Fabian on 11.11.2014.
 */
package Panels {
import Frames.CraftingFrame;

import com.company.assembleegameclient.objects.GameObject;
import com.company.util.Keys;

import flash.events.KeyboardEvent;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.ui.FrameHolderNoDim;
import flash.events.MouseEvent;
import flash.events.Event;
import com.company.assembleegameclient.game.GameSprite;

public class CraftingPanel extends SimpleButtonPanel
{
    public static var terminalOpen:Boolean;

    public function CraftingPanel(param1:GameSprite, param2:GameObject) {
        super(param1,"Craft items","Open");
        this.obj_ = param2;
        this.addEventListener(Event.ADDED_TO_STAGE,this.onAdded);
        this.addEventListener(Event.REMOVED_FROM_STAGE,this.onRemove);
    }

    public var obj_:GameObject;

    protected function onKeyDown(param1:KeyboardEvent) : void {
        if(!terminalOpen) {
            if (param1.keyCode == Parameters.data_.interact) {
                stage.addChild(new FrameHolderNoDim(new CraftingFrame(gs_, this.obj_)));
            }
        }
    }

    override protected function onButtonClick(param1:MouseEvent) : void {
        if(!terminalOpen) {
            stage.addChild(new FrameHolderNoDim(new CraftingFrame(gs_, this.obj_)));
        }
    }

    protected function onAdded(param1:Event) : void {
        stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
        this.gs_.dispatchInteractiveObject("Press [" + Keys.KeyNames[Parameters.data_.interact] + "] to interact.");
    }

    protected function onRemove(param1:Event) : void {
        stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
    }
}
}
