/**
 * Created by Fabian on 13.12.2014.
 */
package Sounds{
import com.company.assembleegameclient.parameters.Parameters;

import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.media.Sound;
import flash.media.SoundChannel;
import flash.media.SoundTransform;
import flash.utils.Dictionary;

public class LocalSoundEffects {

    public static var soundsInCache:Dictionary = new Dictionary();
    private static var channelVolumes:Dictionary = new Dictionary(true);
    private static var channels:Dictionary = new Dictionary(true);

    public static function load(sound:LocalSound):Sound {
        var snd:Sound = soundsInCache[sound.name];
        if (snd != null) {
            return (snd);
        }
        snd = new Sound();
        snd.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
        snd.loadCompressedDataFromByteArray(sound.data, sound.data.length);
        soundsInCache[sound.name] = snd;
        return snd;
    }
    public static function play(sound:LocalSound, loop:int=0, volume:Number=1, isFX:Boolean=true, playAlways:Boolean=false):void{
        var actualVolume:Number;
        var trans:SoundTransform;
        var channel:SoundChannel;
        var snd:Sound = load(sound);
        try {
            actualVolume = ((Parameters.data_.playSFX && isFX) || (!isFX && Parameters.data_.playPewPew) || playAlways ? volume : 0);
            trans = new SoundTransform(actualVolume);
            channel = snd.play(0, loop, trans);
            channel.addEventListener(Event.SOUND_COMPLETE, completed, false, 0, true);
            channelVolumes[channel] = volume;
            channels[channel] = channel;
        }
        catch(error:Error) {
        }
    }
    private static function completed(e:Event):void{
        var sndChannel:SoundChannel = (e.target as SoundChannel);
        delete channelVolumes[sndChannel];
        delete channels[sndChannel];
    }
    public static function onIOError(_arg1:IOErrorEvent):void{
    }
}
}
