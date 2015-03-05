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
 * Created by Fabian on 04.03.2015.
 */
package MiniGames.MysteryBox {

import SimpleInject.ISimpleInjector;

import com.company.assembleegameclient.game.GameSprite;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.utils.getQualifiedClassName;

public class MysteryBox extends Sprite {

    public static const NAME_SELECT_MYSTERY_BOX:String = "MiniGames.MysteryBox::SelectMysteryBox";
    public static const NAME_MYSTERY_BOX_ROLL:String = "MiniGames.MysteryBox::MysteryBoxRoll";

    private var holder:MysteryBoxChild;
    private var childs:Object;
    private var addChilds:Object;
    private var injector:ISimpleInjector;

    public var gs:GameSprite;

    public function MysteryBox(gs:GameSprite) {
        this.gs = gs;
        this.injector = new MysteryBoxInjector(this);
        this.childs = { };
        this.addChilds = { };
        this.addEventListener(Event.REMOVED_FROM_STAGE, this.dispose);
        register(SelectMysteryBox);
        register(MysteryBoxRoll);
        switchTo(NAME_SELECT_MYSTERY_BOX);
    }

    public function switchTo(name:String, args:Array=null):void {
        if(this.holder != null && contains(this.holder)) {
            removeChild(this.holder);
        }
        if((this.holder = createInstance(name, args)) != null) {
            addChild(this.holder);
        }
    }

    private function register(child:Class):void {
        this.childs[getQualifiedClassName(child)] = child;
    }

    private function createInstance(className:String, args:Array=null):MysteryBoxChild {
        var cls:Class = this.childs[className];
        if(cls == null) return null;
        var child:MysteryBoxChild;
        if(args == null || args.length == 0) {
            child = new cls();
        }
        else if(args.length == 1) {
            child = new cls(args[0]);
        }
        this.injector.injectInto(child);
        child.addEventListener(Event.CLOSE, this.close);
        return child;
    }

    public function addAdditionalChild(child:DisplayObject):void {
        this.addChilds[child.name] = child;
        addChild(child);
    }

    public function removeAdditionalChild(child:DisplayObject):void {
        delete this.childs[child.name];
        removeChild(child);
    }

    private function dispose(event:Event):void {
        this.injector.disposeInjector();
    }

    private function close(event:Event):void {
        if (parent)
            parent.removeChild(this);
    }
}
}
