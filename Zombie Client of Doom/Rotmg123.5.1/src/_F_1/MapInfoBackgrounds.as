/**
 * Created by Fabian on 01.01.2015. #Rip 1st file 2k15
 */
package _F_1 {
import flash.display.BitmapData;

public class MapInfoBackgrounds {
    [Embed(source="top.jpg")]
    private static var himalayas:Class;
    [Embed(source="zombie_background_by_Ace_BGI.jpg")]
    private static var defaultBackground:Class;

    private static var data:Object;

    public static function load():void {
        data =
        {
            "himalayas": himalayas,
            "default": defaultBackground
        };
    }

    public static function getBackgroundImage(name:String):BitmapData {
        if(name == null) return null;
        return new data[name]().bitmapData;
    }
}
}
