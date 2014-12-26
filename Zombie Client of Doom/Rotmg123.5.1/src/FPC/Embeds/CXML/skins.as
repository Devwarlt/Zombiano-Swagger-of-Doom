package FPC.Embeds.CXML
{
import com.company.assembleegameclient.util.*;
	import mx.core.ByteArrayAsset;
	
	[Embed(source="data/skins.dat", mimeType="application/octet-stream")]
	public class skins extends mx.core.ByteArrayAsset
	{
		public function skins()
		{
			super();

		}
	}
}