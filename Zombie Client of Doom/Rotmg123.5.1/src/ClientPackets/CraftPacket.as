package ClientPackets
{
	import flash.utils.IDataOutput;
	
	public class CraftPacket extends ClientPacket
	{
		
		public function CraftPacket(_arg1:uint) {
			super(_arg1);
			this.slots = new Vector.<int>();
		}
		
		public var objectId_:int;
		public var recipeString_:String;
		public var slots:Vector.<int>;

		override public function writeToOutput(_arg1:IDataOutput) : void {
			_arg1.writeInt(this.objectId_);
			_arg1.writeUTF(this.recipeString_);

			_arg1.writeByte(slots.length);
			for each(var slot in slots) {
				_arg1.writeInt(slot);
			}
		}
		
		override public function toString() : String {
			return formatToString("CRAFT","objectId_","recipeString_");
		}
	}
}
