/**
 * Created by Fabian on 18.11.2014.
 */
package CraftingWebRequests {
import _qN_.Account;

import _zo._8C_;

import com.company.assembleegameclient.appengine.WebRequest;
import com.company.assembleegameclient.objects.CraftingTerminal;
import com.company.assembleegameclient.parameters.Parameters;

import flash.events.Event;

public class CraftingRequest extends WebRequest{

    public function CraftingRequest() {
        super(Parameters._fK_(), "/crafting", true);
        init();
    }

    private function init():void{
        addEventListener(_8C_.GENERIC_DATA, this.dataReceived);
        var _local1:Object = Account._get().credentials();
        sendRequest("getRecipes", _local1);
    }

    public function dataReceived(_arg1:_8C_) {
        CraftingTerminal.recipes = Vector.<String>(_arg1.data_.toString().split("\n"));
    }

    public function errorReceived(_arg1:String) {
        dispatchEvent(new Event(Event.COMPLETE));
    }
}
}
