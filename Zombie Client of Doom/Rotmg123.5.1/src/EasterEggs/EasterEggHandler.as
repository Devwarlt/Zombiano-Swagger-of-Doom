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
 * Created by Fabian on 05.02.2015.
 */
package EasterEggs {
import EasterEggs.EasterEggs.EasterEgg;
import EasterEggs.EasterEggs.EasterEggEvent;

import flash.display.DisplayObject;
import flash.events.Event;
import flash.events.KeyboardEvent;

public class EasterEggHandler {

    private static var webMain:WebMain;
    private static var currentEggIds:Vector.<String>;
    private static var currentEggs:Vector.<EasterEgg>;
    private static var currentEgg:DisplayObject;

    private var keysNeeded:Vector.<uint>;
    private var index:int = 0;
    private var fired:Boolean;
    private var canFireMultipleTimes:Boolean;
    private var target:Function;

    public function EasterEggHandler(keys:Vector.<uint>, dispatchFunction:Function, canFireMultipleTimes:Boolean) {
        this.keysNeeded = keys;
        this.canFireMultipleTimes = canFireMultipleTimes;
        this.target = dispatchFunction;
    }

    public function onKeyDown(event:KeyboardEvent):void {
        if(!fired || canFireMultipleTimes) {
            if (index >= keysNeeded.length) {
                index = 0;
                return;
            }

            if (event.keyCode == keysNeeded[index]) {
                if (index == keysNeeded.length - 1) {
                    index = 0;
                    if(target != null) {
                        fired = true;
                        target();
                    }
                }
                else index++;
            }
            else index = 0;
        }
    }

    public static function setup(main:WebMain):void {
        webMain = main;
        currentEggIds = new Vector.<String>();
        currentEggs = new Vector.<EasterEgg>();
    }

    public static function registerEasterEgg(egg:EasterEgg):void {
        if (currentEggIds.indexOf(egg.getId()) == -1) {
            egg.addEventListener(EasterEggEvent.ON_ACTIVATE, onEggActivate);
            currentEggIds.push(egg.getId());
            currentEggs.push(egg);
        }
        else {
            var index:int = currentEggIds.indexOf(egg.getId());
            var obj:EasterEgg = EasterEgg(currentEggs.splice(index, 1)[0]);
            obj.dispose();
            obj.removeEventListener(EasterEggEvent.ON_ACTIVATE, onEggActivate);
            egg.addEventListener(EasterEggEvent.ON_ACTIVATE, onEggActivate);
            currentEggIds.slice(index, 1);
            currentEggIds.push(egg.getId());
            currentEggs.push(egg);
        }
    }

    private static function onEggActivate(event:EasterEggEvent):void {
        if (!currentEgg) {
            webMain.stage.addChild(event.movie);
            event.movie.addEventListener(Event.REMOVED_FROM_STAGE, onEggRemove);
            currentEgg = event.movie;
        }
    }

    public static function isPlaying():Boolean {
        return currentEgg;
    }

    private static function onEggRemove(event:Event):void {
        currentEgg = null;
        event.target.removeEventListener(Event.REMOVED_FROM_STAGE, onEggRemove);
    }
}
}
