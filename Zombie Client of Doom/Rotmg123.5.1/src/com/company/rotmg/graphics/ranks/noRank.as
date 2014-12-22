/**
 * Created by Fabian on 29.11.2014.
 */
package com.company.rotmg.graphics.ranks {
import flash.display.Bitmap;

[Embed(source="noRank_Embed.png")]
public class noRank extends Bitmap {
    public function noRank() {
        super();
        this.scaleX = 0;
        this.scaleY = 0.1;
    }
}
}
