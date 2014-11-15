﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_vf._gs

package _vf{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import com.company.assembleegameclient.parameters.Parameters;
	import flash.media.SoundTransform;
	import com.company.googleanalytics.GA;
	
	public class _gs {
		private static var currentSoundChannel:SoundChannel = null;
		private static var currentSoundTransform:SoundTransform = null;
		
		private static var newSound:Sound = null;
		private static var newSoundChannel:SoundChannel = null;
		private static var newSoundTransform:SoundTransform = null;
		
		public static var fadeIn:Number = 0.65;
		public static var fadeOut:Number = 0;
		public static var music_:String = "Menu";
		
		public static const menuMusic:Vector.<String> = new <String>["sorc", "sorc2", "Menu", "Menu2"];
		
		public static function load():void {
            var currentSound:Sound = new Sound();
            currentSound.load(new URLRequest((("http://" + Parameters.musicUrl_) + "/sfx/music/" + randomMenu() + ".mp3")));
            currentSoundTransform = new SoundTransform(Parameters.data_.playMusic ? 0.65 : 0);
            currentSoundChannel = currentSound.play(0, int.MAX_VALUE, currentSoundTransform);
        }
		public static function _continue(_arg1:Boolean):void{
			GA.global().trackEvent("sound", ((_arg1) ? "musicOn" : "musicOff"));
			Parameters.data_.playMusic = _arg1;
			Parameters.save();
			currentSoundChannel.soundTransform = new SoundTransform(((Parameters.data_.playMusic) ? 0.65 : 0));
		}
		
		public static function randomMenu():String{
			return menuMusic[Math.round(Math.random() * (menuMusic.length - 1))];
		}
		
		public static function reload(newMusic:String):void{
			if (music_ == newMusic) return;
			music_ = newMusic;
			try {
				newSound = new Sound();
				newSound.load(new URLRequest("http://" + Parameters.musicUrl_ + "/sfx/music/" + (newMusic == "Menu" ? randomMenu() : newMusic) + ".mp3"));
				newSoundTransform = new SoundTransform(Parameters.data_.playMusic ? 0.65 : 0);
				newSoundChannel = newSound.play(0, int.MAX_VALUE, newSoundTransform);
			} catch (e:Error) { }
			if (fadeIn < 0.65) endFade();
			fadeIn = 0;
			fadeOut = 0.65;
		}
		
		public static function endFade():void {
            currentSoundChannel.stop();
            var currentSound:Sound = newSound;
            currentSoundChannel = newSoundChannel;
            currentSoundTransform = newSoundTransform;

            currentSoundTransform.volume = Parameters.data_.playMusic ? 0.65 : 0;
            fadeIn = 0.65;
            fadeOut = 0;
        }

		public static function updateFade():void{
			if (fadeIn >= 0.65) return;
			if (!Parameters.data_.playMusic) {
				endFade();
				return;
			}
			try {
				fadeIn += 0.0065;
				fadeOut -= 0.0065;
				currentSoundTransform.volume = fadeOut;
				newSoundTransform.volume = fadeIn;
				currentSoundChannel.soundTransform = currentSoundTransform;
				newSoundChannel.soundTransform = newSoundTransform;
			} catch(e:Error) { }
			if (fadeIn >= 0.65) endFade();
		}
		
	}
}//package _vf

