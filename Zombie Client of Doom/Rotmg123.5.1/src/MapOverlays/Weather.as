/**
 * Created by Fabian on 20.11.2014.
 */
package MapOverlays {
import _05R_.GTween;

public class Weather extends MapOverlay{

    public var particles_:Vector.<WeatherParticle>;

    public function Weather() {
        particles_ = new Vector.<WeatherParticle>();
    }

    //Todo: Implement this (too lazy atm) :3
    public function changeWind(_arg1:Number, _arg2:Number):void{
    }

    public function addParticle(_arg1:GTween):void {
    }

    public function removeParticle(_arg1:GTween):void {
        particles_.shift();
    }
}
}
