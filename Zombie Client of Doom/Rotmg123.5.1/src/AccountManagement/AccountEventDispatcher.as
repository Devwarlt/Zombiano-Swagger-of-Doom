/**
 * Created by Fabian on 16.12.2014.
 */
package AccountManagement {
import _C__._cM_;
import _F_1._C_Q_;
import _U_5._dd;
import _qN_.Account;
import _zo._8C_;
import _zo._mS_;

import com.company.assembleegameclient.appengine.WebRequest;
import com.company.assembleegameclient.parameters.Parameters;

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
        this.view.destroy();
        this.view.eventDispatcher.remove(this.dispatchEvent);
    }
    private function dispatchEvent(eventString:String):void {
        switch (eventString) {
            case AccountManagementScreen.SHOW_MAIN_SCREEN:
                this.target.dispatch(new _C_Q_());
                break;
            case AccountManagementScreen.RELOAD:
                this.reload();
                break;
            case AccountManagementScreen.LOGOUT:
                Account._get().clear();
                var mainScreen:_C_Q_ = new _C_Q_();
                this.target.dispatch(mainScreen);
                mainScreen.reload();
                break;
        }
    }

    private function reload():void {
        var req:WebRequest = new WebRequest(Parameters._fK_(), "/account", true);
        req._R_z("text");
        req.addEventListener(_8C_.GENERIC_DATA, this.onSuccess);
        req.addEventListener(_mS_.TEXT_ERROR, this.onError);
        req.sendRequest("verify", Account._get().credentials());
    }

    private function onSuccess(_arg1:_8C_):void {
        destroy();
        this.view.accountXml = XML(_arg1.data_);
        trace(XML(_arg1.data_));
        initialize();
    }

    private function onError(_arg1:_mS_):void {
        dispatchEvent(AccountManagementScreen.SHOW_MAIN_SCREEN);
    }
}
}

