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
package com.company.assembleegameclient.objects {

import Panels.Panel;
import Panels.CraftingPanel;

import com.company.assembleegameclient.game.GameSprite;


public class CraftingTerminal extends GameObject implements IPanelProvider {

    public function CraftingTerminal(param1:XML) {
        super(param1);
    }

    public function GetPanel(_arg1:GameSprite):Panel {
        return new CraftingPanel(_arg1, this);
    }

    public static function craftingRecipe(_arg1:String, recipes:Vector.<String>):int {
        var i:int = 0;
        var ret:int = -1;

        if (recipes == null) return ret;

        while (i < recipes.length) {
            var recString:Array = String(recipes[i].split(";")[0]).split(",");
            var s:String = "";
            var c:int = 0;

            for each (var val:String in recString) {
                if (c == (recString.length - 1))
                    s += String(int(val));
                else
                    s += String(int(val)) + ",";
                c++;
            }

            if (s == _arg1) {
                ret = int(recipes[i].split(";")[1]);
                break;
            }
            i++;
        }
        return ret;
    }
}
}
