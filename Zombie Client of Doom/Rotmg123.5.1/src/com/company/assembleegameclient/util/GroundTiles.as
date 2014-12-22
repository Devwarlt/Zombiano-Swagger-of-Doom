package com.company.assembleegameclient.util
{
    import mx.core.*;
    
    [Embed(source="GoundTiles.dat", mimeType="application/octet-stream")]
    public class GroundTiles extends mx.core.ByteArrayAsset
    {
        public function GroundTiles()
        {
            super();

        }
    }
}
