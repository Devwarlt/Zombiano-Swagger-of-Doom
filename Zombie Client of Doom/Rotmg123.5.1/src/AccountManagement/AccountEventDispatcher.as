/**
 * Created by Fabian on 16.12.2014.
 */
package AccountManagement {
import _C__._cM_;
import _F_1._C_Q_;
import _U_5._dd;
import _qN_.Account;
import WebRequestEvents.WebRequestSuccessEvent;
import WebRequestEvents.WebRequestErrorEvent;

import com.company.assembleegameclient.appengine.WebRequest;
import com.company.assembleegameclient.parameters.Parameters;

import flash.events.Event;

public class AccountEventDispatcher extends _cM_ {

    [Inject]
    public var view:AccountManagementScreen;
    [Inject]
    public var target:_dd;

    public static var logoutWasForced:Boolean;

    override public function initialize():void {
        this.view.eventDispatcher.add(this.dispatchEvent);
        this.view.initialize();
    }
    override public function destroy():void {
        this.view.eventDispatcher.remove(this.dispatchEvent);
        this.view.destroy();
    }
    private function dispatchEvent(eventString:String):void {
        var mainScreen:_C_Q_;
        switch (eventString) {
            case AccountManagementScreen.SHOW_MAIN_SCREEN:
                this.view.dispatchEvent(new Event(Event.COMPLETE));
                mainScreen = new _C_Q_();
                this.target.dispatch(mainScreen);
                mainScreen.reload();
                break;
            case AccountManagementScreen.RELOAD:
                this.reload();
                break;
            case AccountManagementScreen.LOGOUT:
                Account._get().clear();
                logoutWasForced = true;
                mainScreen = new _C_Q_();
                this.target.dispatch(mainScreen);
                mainScreen.reload();
                break;
        }
    }

    private function reload():void {
        var req:WebRequest = new WebRequest(Parameters.getAccountServerIP(), "/account", true);
        req.addEventListener(WebRequestSuccessEvent.GENERIC_DATA, this.onSuccess);
        req.addEventListener(WebRequestErrorEvent.TEXT_ERROR, this.onError);
        req.sendRequest("verify", Account._get().credentials());
    }

    private function onSuccess(_arg1:WebRequestSuccessEvent):void {
        destroy();
        this.view.accountXml = XML(_arg1.data_);
        initialize();
    }

    private function onError(_arg1:WebRequestErrorEvent):void {
        dispatchEvent(AccountManagementScreen.SHOW_MAIN_SCREEN);
    }
}
}

