package com.company.assembleegameclient.util
{
	import mx.core.ByteArrayAsset;
	
	[Embed(source="skins.dat", mimeType="application/octet-stream")]
	public class skins extends mx.core.ByteArrayAsset
	{
		public function skins()
		{
			super();

		}
	}
}