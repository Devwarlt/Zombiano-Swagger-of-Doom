// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//Sounds._Q_P_

package Sounds{
    import flash.media.SoundTransform;
    import com.company.assembleegameclient.parameters.Parameters;

    public class _Q_P_ {

        public static function load():void {
            var _4w:SoundTransform = new SoundTransform(((Parameters.data_.playSFX) ? 1 : 0));
        }
        public static function _2c(_arg1:Boolean):void{
            Parameters.data_.playSFX = _arg1;
            Parameters.save();
            UrlSoundEffects._02r();
        }
    }
}//package Sounds

