package com.company.assembleegameclient.util
{
    import mx.core.*;
    
    [Embed(source="Cloth.dat", mimeType="application/octet-stream")]
    public class Cloth extends mx.core.ByteArrayAsset
    {
        public function Cloth()
        {
            super();

        }
    }
}
