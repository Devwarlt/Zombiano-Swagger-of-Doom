/**
 * Created by Fabian on 29.11.2014.
 */
package com.company.rotmg.graphics.ranks {
import flash.display.Bitmap;

[Embed(source="premium 100x100.png")]
public class premiumRank extends Bitmap {
    public function premiumRank() {
        super();
        this.scaleX = 0.25;
        this.scaleY = 0.25;
    }
}
}
