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

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//Sounds.UrlSoundEffects

package Sounds{
    import com.company.assembleegameclient.parameters.Parameters;
    
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.media.Sound;
    import flash.media.SoundChannel;
    import flash.media.SoundTransform;
    import flash.net.URLRequest;
    import flash.utils.Dictionary;

    public class UrlSoundEffects {

        public static var _0H_k:Dictionary = new Dictionary();
        private static var _04b:Dictionary = new Dictionary(true);
		private static var channels:Dictionary = new Dictionary(true);
		
        public static function load(_arg1:String):Sound{
            var _local2:Sound = _0H_k[_arg1];
            if (_local2 != null)
            {
                return (_local2);
            }
            var _local3:URLRequest = new URLRequest("http://" + Parameters.musicUrl_ + "/sfx/" + _arg1 + ".mp3");
            _local3.userAgent = "GameClient";
            _local2 = new Sound();
            _local2.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
            _local2.load(_local3);
            _0H_k[_arg1] = _local2;
            return (_local2);
        }
        public static function play(name:String, volume:Number=1, isFX:Boolean=true, playAlways:Boolean=false):void{
            var actualVolume:Number;
            var trans:SoundTransform;
            var channel:SoundChannel;
            var sound:Sound = load(name);
            try
            {
                actualVolume = ((Parameters.data_.playSFX && isFX) || (!isFX && Parameters.data_.playPewPew) || playAlways ? volume : 0);
                trans = new SoundTransform(actualVolume);
                channel = sound.play(0, 0, trans);
                channel.addEventListener(Event.SOUND_COMPLETE, _J_M_, false, 0, true);
                _04b[channel] = volume;
				channels[channel] = channel;
            } catch(error:Error)
            {
            }
        }
        private static function _J_M_(_arg1:Event):void{
            var _local2:SoundChannel = (_arg1.target as SoundChannel);
            delete _04b[_local2];
			delete channels[_local2];
        }
        public static function _02r():void{
            var _local1:SoundChannel;
            var _local2:SoundTransform;
            for each (_local1 in channels)
            {
                _local2 = _local1.soundTransform;
                _local2.volume = ((Parameters.data_.playSFX) ? _04b[_local1] : 0);
                _local1.soundTransform = _local2;
            }
        }
        public static function onIOError(_arg1:IOErrorEvent):void{
        }

    }
}//package Sounds

