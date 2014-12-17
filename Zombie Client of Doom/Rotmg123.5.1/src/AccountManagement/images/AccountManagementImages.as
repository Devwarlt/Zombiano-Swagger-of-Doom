/**
 * Created by Fabian on 17.12.2014.
 */
package AccountManagement.images {
import flash.display.Bitmap;

public class AccountManagementImages {

    [Embed(source="account header.png")]
    public static const AccountHeaderBackground:Class;
    [Embed(source="arrow_big.png")]
    public static const Arrow:Class;

    public static function nextArrow(scale:Number):Bitmap {
        var bmp:Bitmap = new Arrow();
        bmp.scaleX = bmp.scaleY = scale;
        return bmp;
    }

    public static function prevArrow(scale:Number):Bitmap {
        var bmp:Bitmap = new Arrow();
        bmp.scaleX = bmp.scaleY = -(scale);
        return bmp;
    }
}
}
