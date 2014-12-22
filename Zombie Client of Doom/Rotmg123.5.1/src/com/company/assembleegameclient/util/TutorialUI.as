package com.company.assembleegameclient.util
{
    import mx.core.*;
    
    [Embed(source="TutoialUI.dat", mimeType="application/octet-stream")]
    public class TutorialUI extends mx.core.ByteArrayAsset
    {
        public function TutorialUI()
        {
            super();

        }
    }
}
