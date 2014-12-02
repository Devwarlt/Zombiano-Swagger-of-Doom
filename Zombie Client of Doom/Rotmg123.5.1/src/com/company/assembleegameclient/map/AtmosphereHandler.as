/**
 * Created by Fabian on 21.11.2014.
 */
package com.company.assembleegameclient.map {
import _05R_.GTween;

import Sounds.Music;

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.parameters.Parameters;

import flash.display.BlendMode;

import flash.display.Sprite;

import flash.errors.IllegalOperationError;

public class AtmosphereHandler extends Sprite{

    public static const SUN:String = "WEATHER_SUN";
    public static const HIGH_CLOUDY:String = "WEATHER_HIGH_CLOUDY";
    public static const LIGHT_CLOUDY:String = "WEATHER_LIGHT_CLOUDY";

    public static const DAY:String = "DAYTIME_DAY";
    public static const NIGHT:String = "DAYTIME_NIGHT";

    public var CurrentAtmosphereString:String;
    public var OldAtmosphereString:String;

    private var gs_:GameSprite;

    public function AtmosphereHandler(_arg1:GameSprite){
        this.gs_ = _arg1;
    }

    public function init(_arg1:int):void{
        if(_arg1 != -1) {
            CurrentAtmosphereString = OldAtmosphereString = getAtmosphereString(_arg1);
            var color = getCurrentAtmosphereColor();
            graphics.beginFill(color, 1);
            graphics.drawRect(-300, -325, 600, 600);
            graphics.endFill();
            blendMode = BlendMode.OVERLAY;

            if(color != uint.MAX_VALUE){
                alpha = 1.0
            }
        }
    }

    public function getCurrentAtmosphereColor():uint {
        switch (CurrentAtmosphereString){
            case SUN: return 0xF6FF8F;
            case NIGHT: return 0x0004FF;
            case HIGH_CLOUDY: return 0x808080;
            case DAY: return uint.MAX_VALUE;
            default: throw new IllegalOperationError("Invalid atmosphere status!");
        }
    }

    public function tick(_arg1:int):void{
        OldAtmosphereString = CurrentAtmosphereString;
        CurrentAtmosphereString = getAtmosphereString(_arg1);

        if(CurrentAtmosphereString != OldAtmosphereString){
            var color = getCurrentAtmosphereColor();
            if(color == uint.MAX_VALUE) {
                var _local1:GTween = new GTween(this, 50, {"alpha": -1.0});
                _local1._bR_ = endIfAlphaChanged;
            }
            else {
                graphics.beginFill(color, 1);
                graphics.drawRect(-300, -325, 600, 600);
                graphics.endFill();
                alpha = 0.0;
                var _local1:GTween = new GTween(this, 50, {"alpha": 1.0});
                _local1._bR_ = endIfAlphaChanged;
            }

            if(_arg1 >= 48000) {
                Sounds.Music.reload("night", false);
            }
            else {
                Sounds.Music.reload("day", false);
            }
        }
    }

    public function update():void {
        if(alpha > 1.0) alpha = 1.0;
        if(alpha < 0.0) alpha = 0.0;

        this.y = Parameters.data_.centerOnPlayer ? 0 : -125;
    }

    public function switchTo(_arg1:String, _arg2:int):void{
        if(_arg2 < 30000 && CurrentAtmosphereString != _arg1) {
            CurrentAtmosphereString = OldAtmosphereString = _arg1;
            var color = getCurrentAtmosphereColor();
            if(color == uint.MAX_VALUE) {
                var _local1:GTween = new GTween(this, 50, {"alpha": -1.0});
                _local1._bR_ = endIfAlphaChanged;
            }
            else {
                graphics.beginFill(color, 1);
                graphics.drawRect(-300, -325, 600, 600);
                graphics.endFill();
                alpha = 0.0;
                var _local1:GTween = new GTween(this, 50, {"alpha": 1.0});
                _local1._bR_ = endIfAlphaChanged;
            }
        }
    }

    public function getAtmosphereString(_arg1:int):String {
        if(_arg1 >= 40000 && CurrentAtmosphereString == SUN) {
            return DAY;
        }
        else if(_arg1 >= 48000) {
            return NIGHT;
        }
        else {
            return DAY;
        }
    }

    private function endIfAlphaChanged(_arg1:GTween):void {
        if(alpha > 1.0 || alpha < 0.0) {
            _arg1.end();
        }
    }
}
}
