// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//Frames._lx

package Frames{
    import com.company.assembleegameclient.game.GameSprite;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import _9R_.VillageResultEvent;

    public class _lx extends Frame {

        private var name_:TextInput;
        private var gs_:GameSprite;

        public function _lx(_arg1:GameSprite){
            super("Create a new Guild", "Cancel", "Create");
            this.gs_ = _arg1;
            this.name_ = new TextInput("Guild Name", false, "");
            this.name_.inputText_.restrict = "A-Za-z ";
            this.name_.inputText_.maxChars = 20;
            addTextInput(this.name_);
            addTextLine("Maximum 20 characters");
            addTextLine("No numbers or punctuation");
            addTextLine("Racism or profanity gets your guild banned");
            Button1.addEventListener(MouseEvent.CLICK, this.onCancel);
            Button2.addEventListener(MouseEvent.CLICK, this._U_p);
        }
        private function onCancel(_arg1:MouseEvent):void{
            dispatchEvent(new Event(Event.COMPLETE));
        }
        private function _U_p(_arg1:MouseEvent):void{
            this.gs_.addEventListener(VillageResultEvent.VILLAGE_RESULT, this._0J_I_);
            this.gs_.packetManager.createVillage(this.name_.text());
            lockButtons();
        }
        private function _0J_I_(_arg1:VillageResultEvent):void{
            this.gs_.removeEventListener(VillageResultEvent.VILLAGE_RESULT, this._0J_I_);
            if (_arg1.success_)
            {
                dispatchEvent(new Event(Event.COMPLETE));
            } else
            {
                this.name_.setErrorText(_arg1.errorText_);
                releaseButtons();
            }
        }

    }
}//package Frames

