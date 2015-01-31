// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//Frames._A_t

package Frames{
    import com.company.assembleegameclient.appengine.WebRequest;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import com.company.assembleegameclient.parameters.Parameters;
    import WebRequestEvents.WebRequestSuccessEvent;
    import WebRequestEvents.WebRequestErrorEvent;
    import com.company.util._H_U_;
    import _qN_.Account;

    public class _A_t extends Frame {

        private var name_:TextInput;
        private var _zH_:WebRequest = null;

        public function _A_t(){
            super("Choose a unique account name", "Cancel", "Choose");
            this.name_ = new TextInput("Name", false, "");
            this.name_.inputText_.restrict = "A-Za-z";
            this.name_.inputText_.maxChars = 10;
            addTextInput(this.name_);
            addTextLine("Maximum 10 characters");
            addTextLine("No numbers, spaces or punctuation");
            addTextLine("Racism or profanity gets you banned");
            Button1.addEventListener(MouseEvent.CLICK, this.onCancel);
            Button2.addEventListener(MouseEvent.CLICK, this._J_p);
        }
        private function onCancel(_arg1:MouseEvent):void{
            dispatchEvent(new Event(Event.CANCEL));
        }
        private function _J_p(_arg1:MouseEvent):void{
            if (this.name_.text().length < 1)
            {
                this.name_.setErrorText("Name too short");
                return;
            }
            var _local2:WebRequest = new WebRequest(Parameters.getAccountServerIP(), "/account", true);
            _local2.addEventListener(WebRequestSuccessEvent.GENERIC_DATA, this._E_0);
            _local2.addEventListener(WebRequestErrorEvent.TEXT_ERROR, this._06Q_);
            var _local3:Object = {"name":this.name_.text()};
            _H_U_._t2(_local3, Account._get().credentials());
            _local2.sendRequest("setName", _local3);
            lockButtons();
        }
        private function _E_0(_arg1:WebRequestSuccessEvent):void{
            dispatchEvent(new Event(Event.COMPLETE));
        }
        private function _06Q_(_arg1:WebRequestErrorEvent):void{
            this.name_.setErrorText(_arg1.text_);
            releaseButtons();
        }

    }
}//package Frames

