package FPC.Embeds.Models
{
    import mx.core.*;
    
    [Embed(source="data/skyscraper.dat", mimeType="application/octet-stream")]
    public class skyscraper extends mx.core.ByteArrayAsset
    {
        public function skyscraper()
        {
            super();

        }
    }
}
