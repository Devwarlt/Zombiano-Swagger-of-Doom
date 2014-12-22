/**
 * Created by Fabian on 13.12.2014.
 */
package Sounds {
import flash.utils.ByteArray;

public class LocalSound {

    public function LocalSound(name:String, data:Class) {
        this.name = name;
        this.data = new data() as ByteArray;
    }
    public var data:ByteArray;
    public var name:String;
}
}
