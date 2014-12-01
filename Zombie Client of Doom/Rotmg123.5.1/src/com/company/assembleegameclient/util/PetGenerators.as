package com.company.assembleegameclient.util
{
    import mx.core.*;
    
    [Embed(source="PetGenerators.dat", mimeType="application/octet-stream")]
    public class PetGenerators extends mx.core.ByteArrayAsset
    {
        public function PetGenerators()
        {
            super();

        }
    }
}
