package _R_v
{
	import com.company.assembleegameclient.objects.GameObject;
	import flash.events.KeyboardEvent;
	import com.company.assembleegameclient.parameters.Parameters;
	import com.company.assembleegameclient.ui.FrameHolderNoDim;
	import _0D_d.Crafting;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import com.company.assembleegameclient.game.GameSprite;
	
	public class Forge extends SimpleButtonPanel
	{
		
		public function Forge(param1:GameSprite, param2:GameObject) {
			super(param1,"Item Forge","Forge");
			this.obj_ = param2;
			this.addEventListener(Event.ADDED_TO_STAGE,this.onAdded);
			this.addEventListener(Event.REMOVED_FROM_STAGE,this.onRemove);
		}
		
		public var obj_:GameObject;
		
		protected function onKeyDown(param1:KeyboardEvent) : void {
			if(param1.keyCode == Parameters.data_.interact)
			{
				stage.addChild(new FrameHolderNoDim(new Crafting(gs_,this.obj_)));
			}
		}
		
		override protected function onButtonClick(param1:MouseEvent) : void {
			stage.addChild(new FrameHolderNoDim(new Crafting(gs_,this.obj_)));
		}
		
		protected function onAdded(param1:Event) : void {
			stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
		}
		
		protected function onRemove(param1:Event) : void {
			stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
		}
	}
}
