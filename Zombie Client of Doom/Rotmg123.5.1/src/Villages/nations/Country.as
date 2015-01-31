/**
 * Created by Fabian on 31.01.2015.
 */
package Villages.nations {
import flash.display.Bitmap;

public class Country {
    [Embed(source="usaFlag.jpg")]
    private static var usaFlag:Class;
    [Embed(source="germanyFlag.jpg")]
    private static var germanyFlag:Class;
    [Embed(source="netherlandsFlag.jpg")]
    private static var netherlandsFlag:Class;
    [Embed(source="vietnamFlag.jpg")]
    private static var vietnamFlag:Class;
    [Embed(source="canadaFlag.jpg")]
    private static var canadaFlag:Class;
    [Embed(source="israelFlag.jpg")]
    private static var israelFlag:Class;

    public var image:Bitmap;
    public var name:String;
    public var id:int;

    public function Country(id:int) {
        this.id = id;
        switch(this.id) {
            case -1:
                this.name = "Country not set";
                this.image = new Bitmap();
                break;
            case 0:
                this.name = "United States of America";
                this.image = new usaFlag();
                break;
            case 1:
                this.name = "Germany";
                this.image = new germanyFlag();
                break;
            case 2:
                this.name = "Israel";
                this.image = new israelFlag();
                break;
            case 3:
                this.name = "Canada";
                this.image = new canadaFlag();
                break;
            case 4:
                this.name = "Vietnam";
                this.image = new vietnamFlag();
                break;
            case 5:
                this.name = "Netherlands";
                this.image = new netherlandsFlag();
                break;
            default:
                this.name = "Invalid Country";
                this.image = new Bitmap();
                break;
        }
    }
}
}
