/**
 * Created by Fabian on 29.11.2014.
 */
package com.company.rotmg.graphics.ranks {
import flash.display.Bitmap;

[Embed(source="pfcRank_Embed.png")]
public class pfcRank extends flash.display.Bitmap{
    public function pfcRank() {
        super();
        this.scaleX = 0.1;
        this.scaleY = 0.1;
    }
}
}
