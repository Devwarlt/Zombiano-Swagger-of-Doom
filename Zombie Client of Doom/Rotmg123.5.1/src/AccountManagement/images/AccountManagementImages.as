/**
 * Created by Fabian on 17.12.2014.
 */
package AccountManagement.images {
import flash.display.Bitmap;

public class AccountManagementImages {

    [Embed(source="account header.png")]
    public static const AccountHeaderBackground:Class;
    [Embed(source="arrow_white 40 new.png")]
    public static const Arrow:Class;
    [Embed(source="carbonBackground.png")]
    public static const carbonBackground:Class;
    [Embed(source="settings.png")]
    public static const settingsIcon:Class;
    [Embed(source="settings 2.png")]
    public static const settings2Icon:Class;
    [Embed(source="home.png")]
    public static const homeIcon:Class;
    [Embed(source="premium.png")]
    public static const premiumBig:Class;
    [Embed(source="defaultSpeechBubble.png")]
    public static const defaultSpeechBubble:Class;

    [Embed(source="bronzeFpcPack.png")]
    public static const bronzeFpcPack:Class;
    [Embed(source="silverFpcPack.png")]
    public static const silverFpcPack:Class;
    [Embed(source="goldFpcPack.png")]
    public static const goldFpcPack:Class;
    [Embed(source="premiumFpcPack.png")]
    public static const premiumFpcPack:Class;
    [Embed(source="premiumDLC.png")]
    public static const premiumDLC:Class;

    [Embed(source="openFpcPacks.png")]
    public static const openFpcPacks:Class;
    [Embed(source="gold-x5.png")]
    public static const gold_x5:Class;

    [Embed(source="event_01_thumb.png")]
    public static const event_01_thumb:Class;
    [Embed(source="event_01_detail.png")]
    public static const event_01_detail:Class;

    [Embed(source="pack_01_thumb.png")]
    public static const pack_01_thumb:Class;
    [Embed(source="pack_01_detail.png")]
    public static const pack_01_detail:Class;

    public static function nextArrow(scale:Number):Bitmap {
        var bmp:Bitmap = new Arrow();
        bmp.scaleX = bmp.scaleY = scale;
        return bmp;
    }

    public static function prevArrow(scale:Number):Bitmap {
        var bmp:Bitmap = new Arrow();
        bmp.scaleX = -(scale);
        bmp.scaleY = scale;
        return bmp;
    }
}
}
