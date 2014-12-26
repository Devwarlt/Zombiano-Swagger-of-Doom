package FPC.Embeds.CXML
{
import com.company.assembleegameclient.util.*;
    import mx.core.*;
    
    [Embed(source="data/players.dat", mimeType="application/octet-stream")]
    public class players extends mx.core.ByteArrayAsset
    {
        public function players()
        {
            super();

        }
    }
}
