/**
 * Created by Fabian on 16.12.2014.
 */
package AccountManagement {
import _C__._cM_;
import _F_1._C_Q_;
import _U_5._dd;

public class AccountEventDispatcher extends _cM_ {

    [Inject]
    public var view:AccountManagementScreen;
    [Inject]
    public var target:_dd;

    override public function initialize():void {
        this.view.eventDispatcher.add(this.dispatchEvent);
        this.view.initialize();
    }
    override public function destroy():void {
        this.view.eventDispatcher.remove(this.dispatchEvent);
    }
    private function dispatchEvent(eventString:String):void {
        this.target.dispatch(new _C_Q_());
    }
}
}

