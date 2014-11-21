/**
 * Created by Fabian on 21.11.2014.
 */
package com.company.assembleegameclient.map {
import _05R_.GTween;

import com.company.assembleegameclient.game.GameSprite;

import flash.display.BlendMode;

import flash.display.Sprite;

import flash.errors.IllegalOperationError;

public class AtmosphereHandler extends Sprite{

    public static const SUN:String = "WEATHER_SUN";
    public static const DAY:String = "DAYTIME_DAY";
    public static const HIGH_CLOUDY:String = "WEATHER_HIGH_CLOUDY";
    public static const LITE_CLOUDY:String = "WEATHER_LITE_CLOUDY";
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
            graphics.beginFill(color, 1);
            graphics.drawRect(-300, -325, 600, 600);
            graphics.endFill();
            if(color == uint.MAX_VALUE) {
                var _local1:GTween = new GTween(this, 50, {"alpha": -1.0});
            }
            else{
                var _local1:GTween = new GTween(this, 50, {"alpha": 1.0});
            }
        }
    }

    public function update():void {
        if(alpha > 1.0) alpha = 1.0;
        if(alpha < 0.0) alpha = 0.0;
    }

    public function getAtmosphereString(_arg1:int):String {
        if(_arg1 >= 48000) {
            return NIGHT;
        }
        else {
            return DAY;
        }
    }
}
}