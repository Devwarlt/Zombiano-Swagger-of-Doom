package com.company.assembleegameclient.util
{
    import mx.core.*;
    
    [Embed(source="Special.dat", mimeType="application/octet-stream")]
    public class Special extends mx.core.ByteArrayAsset
    {
        public function Special()
        {
            super();

        }
    }
}
