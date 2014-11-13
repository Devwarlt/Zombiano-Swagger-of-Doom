
package Frames {
import ServerPackets.Notification;
import ServerPackets.NotificationBoxPacket;

import _05R_.GTween;

import _sp._aJ_;

import _vf._5T_;

import com.company.assembleegameclient.game.GameSprite;

import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.util.ModalBackground;

import com.company.assembleegameclient.ui.Button;
import com.company.ui.SimpleText;

import flash.display.Sprite;
import flash.events.Event;
import flash.filters.DropShadowFilter;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormatAlign;

    public class NotificationBox extends Sprite {

        private static const WIDTH:int = 189;
        private static const HEIGHT:int = 100;
        private static const SLIDESPEED:int = 1; //Higher value means slower
        private static const KEEPOPENTIME:int = 8; //Higher value means longer open
        public static var isClosed:Boolean = true;

        private const closeButton:Button = ObjectLibrary.createButton(NotificationBox.WIDTH);

        public var event:_aJ_;
        public var open:Boolean;

        public var gs_:GameSprite;

        public function NotificationBox(_arg1:NotificationBoxPacket, _arg2:GameSprite) {
            NotificationBox.isClosed = false;
            this.gs_ = _arg2;
            this.events();
            addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
            this._str4865();
            this._str1776();
            addChild(this._str2928(_arg1.head, 20, 5, 0x57AD62));
            addChild(this._str2928(_arg1.text, 20, 40, 0xFFFFFF));

            //var _local2:GTween = new GTween(this, 0.001);
            //_local2.onComplete = this.slideIn_;

            slideIn_();

            this.open = true;
        }

        private function slideIn_(/*_arg1:GTween*/):void {
            _5T_.play("alert", 3);
            var _local1:GTween = new GTween(this, SLIDESPEED, {
                "x": (800 - (NotificationBox.WIDTH + 6))
            });
            _local1.onComplete = this.wait;
        }
        private function wait(_arg1:GTween):void {
            var _local2:GTween = new GTween(this, KEEPOPENTIME);
            _local2.onComplete = this.slideOut_;
        }
        private function slideOut_(_arg1:GTween):void {
            var _local1:GTween = new GTween(this, SLIDESPEED, {
                "x": (800 + (NotificationBox.WIDTH + 6))
            });
            _local1.onComplete = this.endTween;
        }
        private function endTween(_arg1:GTween):void {
            this.close();
        }

        private static function makeModalBackground(_arg1, _arg2):ModalBackground{
            var _local3:ModalBackground = new ModalBackground();
            _local3.draw(_arg1, _arg2);
            _local3._str2638("HORIZONTAL_DIVISION", 30);
            return (_local3);
        }

        public function _str2928(_arg1:String, _arg2:int, _arg3:int, _arg4:uint):SimpleText{
            var _local4:SimpleText;
            _local4 = new SimpleText(16, _arg4, false, (WIDTH - (20 * 2)), (WIDTH - (20 * 2)), "Myriad Pro");
            _local4.htmlText = '<p align="center">' + _arg1 + '</p>';
            //_local4.setBold(true);
            _local4.wordWrap = true;
            _local4.multiline = true;
            _local4.autoSize = TextFieldAutoSize.CENTER;
            //_local4.setAlign(TextFormatAlign.CENTER);
            _local4.filters = [new DropShadowFilter(0, 0, 0)];
            _local4.x = _arg2;
            _local4.y = _arg3;
            return (_local4);
        }
        private function _str4865():void{
            this.x = (800 + (NotificationBox.WIDTH + 6));
            this.y = Parameters.data_.notifLocation ? 6 : (600 - (NotificationBox.HEIGHT + 6));
        }
        private function events():void{
            this.closeButton.event.add(this.onCloseClick);
        }
        private function _str1776():void{
            addChild(makeModalBackground(NotificationBox.WIDTH, NotificationBox.HEIGHT));
            addChild(this.closeButton);
        }
        public function onCloseClick():void{
            this.close();
        }
        private function close():void{
            NotificationBox.isClosed = true;
            this.open = false;
            if(stage != null)
                stage.focus = null;
            parent.removeChild(this);
        }
        private function onRemovedFromStage(_arg1:Event):void{
            NotificationBox.isClosed = true;
            this.open = false;
        }
    }
}