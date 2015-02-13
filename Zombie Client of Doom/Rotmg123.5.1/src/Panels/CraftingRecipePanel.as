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
 * Created by Fabian on 23.11.2014.
 */
package Panels {
import Frames.CraftingRecipeFrame;
import Frames.LearnCraftingRecipeFrame;

import _0L_C_.DialogBox;

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.GameObject;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.ui.FrameHolder;

import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;

public class CraftingRecipePanel extends DoubleButtonPanel {
    public function CraftingRecipePanel(param1:GameSprite, param2:GameObject) {
        super(param1, "Crafting Recipes", "Show", "Learn");
        this.obj_ = param2;
    }

    public var obj_:GameObject;

    override protected function onButton1Click(param1:MouseEvent):void {
        stage.addChild(new CraftingRecipeFrame(this.gs_, this.obj_));
    }

    override protected function onButton2Click(param1:MouseEvent):void {
        stage.addChild(new FrameHolder(new LearnCraftingRecipeFrame(this.gs_, this.obj_)));
    }
}
}
