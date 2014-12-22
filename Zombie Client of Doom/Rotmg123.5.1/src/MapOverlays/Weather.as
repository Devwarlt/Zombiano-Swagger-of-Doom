/**
 * Created by Fabian on 20.11.2014.
 */
package MapOverlays {
import Sounds.WeatherSoundManager;

import flash.events.Event;

public class Weather extends MapOverlay {

    public function Weather() {
        particles_ = new Vector.<WeatherParticle>();
        this.addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }
    public var particles_:Vector.<WeatherParticle>;
    public var weatherSound:WeatherSoundManager;

    //Todo: Implement this (too lazy atm) :3

    public function get particlesAmount():int {
        return particles_.length;
    }

    public function set particlesAmount(newAmount:int):void {
        var i = 0;
        var l = newAmount - particles_.length;

        if (l < 0) {
            while (i > l) {
                removeParticle();
                i--;
            }
        }
        else {
            while (i < l) {
                addParticle();
                i++;
            }
        }
    }

    public function get defaultParticles():int {
        return 0;
    }

    public function changeWind(_arg1:Number, _arg2:Number):void {
    }

    public function addParticle():void {
    }

    public function removeParticle():void {
        particles_.shift();
    }

    public function onRemovedFromStage(event:Event):void {
        if (this.weatherSound != null) {
            this.weatherSound.stop();
        }
    }
}
}
