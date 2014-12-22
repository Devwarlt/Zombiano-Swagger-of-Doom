package com.company.rotmg.graphics.ranks
{
import flash.display.Bitmap;

[Embed(source="adminRank_Embed.png")]
    public class AdminRank extends flash.display.Bitmap
    {
        public function AdminRank()
        {
            super();
            this.scaleX = 0.15;
            this.scaleY = 0.15;
        }
    }
}
