package com.company.assembleegameclient.util
{
    import mx.core.*;
    
    [Embed(source="Regions.dat", mimeType="application/octet-stream")]
    public class Regions extends mx.core.ByteArrayAsset
    {
        public function Regions()
        {
            super();

        }
    }
}
