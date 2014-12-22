package com.company.assembleegameclient.util
{
    import mx.core.*;
    
    [Embed(source="tutorialObjects.dat", mimeType="application/octet-stream")]
    public class tutorialObjects extends mx.core.ByteArrayAsset
    {
        public function tutorialObjects()
        {
            super();

        }
    }
}
