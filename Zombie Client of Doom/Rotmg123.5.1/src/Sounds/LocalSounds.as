/**
 * Created by Fabian on 13.12.2014.
 */
package Sounds {

public class LocalSounds {
    public static var openChest:LocalSound;
    public static var closeChest:LocalSound;
    public static var UX_InGame_Unlock_Item:LocalSound;
    public static var UX_InGame_Unlock_FPCPack:LocalSound;

    public static function load():void {
        openChest = new LocalSound("openChest", soundBytes.openChest);
        closeChest = new LocalSound("closeChest", soundBytes.closeChest);
        UX_InGame_Unlock_Item = new LocalSound("UX_InGame_Unlock_Item", soundBytes.UX_InGame_Unlock_Item);
        UX_InGame_Unlock_FPCPack = new LocalSound("UX_InGame_Unlock_FPCPack", soundBytes.UX_InGame_Unlock_FPCPack);
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
    [Embed(source="local/sounds/UX_InGame_Unlock_FPCPack.mp3", mimeType="application/octet-stream")]
    public static var UX_InGame_Unlock_FPCPack:Class;
}
