/**
 * Created by Fabian on 13.12.2014.
 */
package Sounds {

public class LocalSounds {
    public static var openChest:LocalSound;
    public static var closeChest:LocalSound;
    public static var UX_InGame_Unlock_Item:LocalSound;
    public static var UX_InGame_Unlock_FirePack:LocalSound;
    public static var credits:LocalSound;

    private static var sounds:Object;

    public static function load():void {
        sounds =
        {
            "openChest": openChest = new LocalSound("openChest", soundBytes.openChest),
            "closeChest": closeChest = new LocalSound("closeChest", soundBytes.closeChest),
            "UX_InGame_Unlock_Item": UX_InGame_Unlock_Item = new LocalSound("UX_InGame_Unlock_Item", soundBytes.UX_InGame_Unlock_Item),
            "UX_InGame_Unlock_FirePack": UX_InGame_Unlock_FirePack = new LocalSound("UX_InGame_Unlock_FirePack", soundBytes.UX_InGame_Unlock_FirePack),
            "credits": credits = new LocalSound("credits", soundBytes.credits)
        };
    }

    public static function getSound(name:String):LocalSound {
        var ret:LocalSound = sounds[name];
        ret.data.position = 0;
        return ret;
    }
}
}

class soundBytes {

    [Embed(source="local/sounds/openChest.mp3", mimeType="application/octet-stream")]
    public static var openChest:Class;
    [Embed(source="local/sounds/closeChest.mp3", mimeType="application/octet-stream")]
    public static var closeChest:Class;

    [Embed(source="local/sounds/UX_InGame_Unlock_Item.mp3", mimeType="application/octet-stream")]
    public static var UX_InGame_Unlock_Item:Class;
    [Embed(source="local/sounds/UX_InGame_Unlock_FirePack.mp3", mimeType="application/octet-stream")]
    public static var UX_InGame_Unlock_FirePack:Class;
    [Embed(source="local/sounds/credits.mp3", mimeType="application/octet-stream")]
    public static var credits:Class;
}
