/**
 * Created by Fabian on 02.12.2014.
 */
package Sounds {
import _05R_.GTween;

import com.company.assembleegameclient.parameters.Parameters;

import flash.media.Sound;
import flash.media.SoundChannel;
import flash.media.SoundTransform;
import flash.net.URLRequest;

public class WeatherSoundManager {

    private var currentSoundChannel:SoundChannel = null;
    private var currentSoundTransform:SoundTransform = null;

    public function load(music:String):void {
        var currentSound:Sound = new Sound();
        currentSound.load(new URLRequest((("http://" + Parameters.musicUrl_) + "/sfx/weather/" + music + ".mp3")));
        currentSoundTransform = new SoundTransform(0);
        currentSoundChannel = currentSound.play(0, int.MAX_VALUE, currentSoundTransform);
        var tween:GTween = new GTween(this.currentSoundTransform, 5, {"volume": 1.0});
        tween._bR_ = update;
    }

    public function stop():void {
        var tween:GTween = new GTween(this.currentSoundTransform, 10, {"volume": 0});
        tween._bR_ = update;
        tween.onComplete = finalStop;
    }

    private function update(tween:GTween):void {
        currentSoundChannel.soundTransform = currentSoundTransform;
    }

    private function finalStop(tween:GTween):void {
        currentSoundChannel.stop();
    }
}
}