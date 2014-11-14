package com.company.assembleegameclient.objects
{
	import com.company.assembleegameclient.game.GameSprite;
	
	import Panels.Panel;
	import Panels.ReforgePanel;
	
	public class Reforge extends GameObject implements IPanelProvider
	{
		public function Reforge(_arg1:XML) {
			super(_arg1);
			this._064 = true;
		}
		
		public function GetPanel(_arg1:GameSprite):Panel {
			return new ReforgePanel(_arg1, this);
		}
	}
}