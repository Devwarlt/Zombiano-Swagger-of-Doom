// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//MapOverlays.MapOverlay

package MapOverlays{
import MapOverlays.Backgrounds.*;
import MapOverlays.WeatherOverlays.RainWeather;
import MapOverlays.WeatherOverlays.SnowWeather;
import MapOverlays.WeatherOverlays.ThunderStormRainWeather;

import flash.display.Sprite;
    import com.company.assembleegameclient.map._0D_v;

    public class MapOverlay extends Sprite {

        protected var mapx_:Number;
        protected var mapy_:Number;

        public static const _0H_W_:int = 0;
        public static const _9F_:int = 1;
        public static const _068:int = 2;
        public static const _0H_v:int = 3;

        public static const Sunny:int = 0;
        public static const Rainy:int = 1;
        public static const Snowy:int = 2
        public static const Thunder:int = 3;

        public static function _U_q(_arg1:int):MapOverlay{
            switch (_arg1)
            {
                case _0H_W_:
                    return (null);
                case _9F_:
                    return (new StarBackground());
                case _068:
                    return (new NexusBackground());
            }
            return (null);
        }

        public static function GetWeatherBackground(_arg1:int, _arg2:Boolean = true):Weather{
            switch (_arg1)
            {
                case Sunny:
                    return (null);
                case Rainy:
                    return (new RainWeather(_arg2));
                case Snowy:
                    return (new SnowWeather(_arg2));
                case Thunder:
                    return (new ThunderStormRainWeather(_arg2));
            }
            return (null);
        }

        public function updatePos(_arg1:Number, _arg2:Number):void {
            mapx_ = _arg1;
            mapy_ = _arg2;
        }

        public function draw(_arg1:_0D_v, _arg2:int):void {
        }

        public function update():void {

        }
    }
}//package MapOverlays

