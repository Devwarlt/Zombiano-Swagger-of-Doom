/**
 * Created by Fabian on 24.11.2014.
 */
package ClientPackets {
import flash.utils.IDataOutput;

public class LearnCraftingRecipe extends ClientPacket {

    public function LearnCraftingRecipe(_arg1:uint) {
        super(_arg1);

        this._slotId = -1;
        this._itemId = -1;
        this._recipeId = -1;
    }
    public var _slotId:int;
    public var _itemId:int;
    public var _recipeId:int;

    public override function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeInt(this._slotId);
        _arg1.writeInt(this._itemId);
        _arg1.writeInt(this._recipeId);
    }
}
}
