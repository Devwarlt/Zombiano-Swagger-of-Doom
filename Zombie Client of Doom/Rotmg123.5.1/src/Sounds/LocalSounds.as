/**
 * Created by Fabian on 13.12.2014.
 */
package Sounds {

public class LocalSounds {
    public static var openChest:LocalSound;
    public static var closeChest:LocalSound;

    public static function load():void {
        openChest = new LocalSound("openChest", soundBytes.openChest);
        closeChest = new LocalSound("closeChest", soundBytes.closeChest);
    }
}
}

class soundBytes {

    [Embed(source="local/sounds/openChest.mp3", mimeType="application/octet-stream")]
    public static var openChest:Class;
    [Embed(source="local/sounds/closeChest.mp3", mimeType="application/octet-stream")]
    public static var closeChest:Class;
}
