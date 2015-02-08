/**
 * Created by Fabian on 05.02.2015.
 */
package EasterEgg {
import flash.events.KeyboardEvent;

public class EasterEggHandler {

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
            if (index >= keysNeeded.length) index = 0;

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
}
}
