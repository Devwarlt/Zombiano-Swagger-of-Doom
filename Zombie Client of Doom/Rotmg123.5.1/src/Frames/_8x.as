﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//Frames._8x

package Frames{
    import com.company.assembleegameclient.game.GameSprite;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import _9R_._3E_;

    public class _8x extends Frame {

        private var name_:TextInput;
        private var gs_:GameSprite;

        public function _8x(_arg1:GameSprite){
            super("Choose a unique account name", "Cancel", "Choose");
            this.gs_ = _arg1;
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
            dispatchEvent(new Event(Event.COMPLETE));
        }
        private function _J_p(_arg1:MouseEvent):void{
            this.gs_.addEventListener(_3E_.NAMERESULTEVENT, this._0D_s);
            this.gs_.packetManager._K_Q_(this.name_.text());
            _pW_();
        }
        public function _0D_s(_arg1:_3E_):void{
            this.gs_.removeEventListener(_3E_.NAMERESULTEVENT, this._0D_s);
            if (_arg1._yS_.success_)
            {
                this.gs_.charList_.name_ = this.name_.text();
                this.gs_._V_1._02y.setName(this.name_.text());
                dispatchEvent(new Event(Event.COMPLETE));
            } else
            {
                this.name_._0B_T_(_arg1._yS_.errorText_);
                _for();
            }
        }

    }
}//package Frames

