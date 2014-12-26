package FPC.Embeds.CXML
{
import com.company.assembleegameclient.util.*;
    import mx.core.*;
    
    [Embed(source="data/PetGenerators.dat", mimeType="application/octet-stream")]
    public class PetGenerators extends mx.core.ByteArrayAsset
    {
        public function PetGenerators()
        {
            super();

        }
    }
}
