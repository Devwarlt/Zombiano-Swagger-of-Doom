﻿// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//Panels.InviteGuildPanel

package Panels{
    import com.company.ui.SimpleText;
    import com.company.assembleegameclient.ui.boxButton;
    import flash.utils.Timer;
    import flash.text.TextFieldAutoSize;
    import flash.filters.DropShadowFilter;
    import flash.events.MouseEvent;
    import flash.events.TimerEvent;
    import com.company.assembleegameclient.game.GameSprite;
    import flash.events.Event;

    public class InviteGuildPanel extends Panel {

        public var name_:String;
        private var _O_k:SimpleText;
        private var guildName_:String;
        private var _J_K_:SimpleText;
        private var _0A_h:boxButton;
        private var _00a:boxButton;
        private var _T_U_:Timer;

        public function InviteGuildPanel(_arg1:GameSprite, _arg2:String, _arg3:String){
            super(_arg1);
            this.name_ = _arg2;
            this.guildName_ = _arg3;
            this._O_k = new SimpleText(16, 0xFFFFFF, false, WIDTH, 0, "Myriad Pro");
            this._O_k.boldText(true);
            this._O_k.htmlText = (('<p align="center">' + _arg2) + " invited you to:</p>");
            this._O_k.autoSize = TextFieldAutoSize.CENTER;
            this._O_k.filters = [new DropShadowFilter(0, 0, 0)];
            this._O_k.y = 0;
            addChild(this._O_k);
            this._J_K_ = new SimpleText(16, 0xFFFFFF, false, WIDTH, 0, "Myriad Pro");
            this._J_K_.boldText(true);
            this._J_K_.htmlText = (('<p align="center">' + this.guildName_) + "</p>");
            this._J_K_.autoSize = TextFieldAutoSize.CENTER;
            this._J_K_.filters = [new DropShadowFilter(0, 0, 0)];
            this._J_K_.y = 20;
            addChild(this._J_K_);
            this._0A_h = new boxButton(16, "Reject");
            this._0A_h.addEventListener(MouseEvent.CLICK, this._zd);
            this._0A_h.x = ((WIDTH / 4) - (this._0A_h.width / 2));
            this._0A_h.y = ((HEIGHT - this._0A_h.height) - 4);
            addChild(this._0A_h);
            this._00a = new boxButton(16, "Accept");
            this._00a.addEventListener(MouseEvent.CLICK, this._K_m);
            this._00a.x = (((3 * WIDTH) / 4) - (this._00a.width / 2));
            this._00a.y = ((HEIGHT - this._00a.height) - 4);
            addChild(this._00a);
            this._T_U_ = new Timer((20 * 1000), 1);
            this._T_U_.start();
            this._T_U_.addEventListener(TimerEvent.TIMER, this._kh);
        }
        private function _kh(_arg1:TimerEvent):void{
            dispatchEvent(new Event(Event.COMPLETE));
        }
        private function _zd(_arg1:MouseEvent):void{
            dispatchEvent(new Event(Event.COMPLETE));
        }
        private function _K_m(_arg1:MouseEvent):void{
            gs_.packetManager.joinGuild(this.guildName_);
            dispatchEvent(new Event(Event.COMPLETE));
        }

    }
}//package Panels

