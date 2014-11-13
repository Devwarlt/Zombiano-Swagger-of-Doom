package com.company.assembleegameclient.objects
{
	import Panels.Panel;
	import com.company.assembleegameclient.game.GameSprite;
	import Panels.Forge;
	
	public class Forge extends GameObject implements IPanelProvider
	{
		
		public function Forge(param1:XML) {
			super(param1);
			_064 = true;
		}
		
		public function GetPanel(param1:GameSprite) : Panel {
			return new Panels.Forge(param1,this);
		}
	}
}
