// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//Panels.PortalPanel

package Panels{
import AccountManagement.ui.FancyTextButton;

import ToolTips.ToolTip;

import com.company.assembleegameclient.objects.Mountain;
import com.company.ui.SimpleText;
import com.company.assembleegameclient.ui._4D_;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.assembleegameclient.game.GameSprite;
import com.company.util._H_V_;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.text.TextFieldAutoSize;
import flash.filters.DropShadowFilter;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.KeyboardEvent;

    public class MountainPanel extends Panel {

        private var obj:Mountain;
        private var nameText:SimpleText;
        private var climbButton:FancyTextButton;
        private var bitmap_:Bitmap;
        private var bitmapSprite:Sprite;
        private var toolTip:ToolTip;

        [Embed("../FireBite/Embeds/Images/data/mountainLogo.png")]
        public static var logo:Class;

        public function MountainPanel(_arg1:GameSprite, _arg2:Mountain){
            super(_arg1);
            this.obj = _arg2;

            this.bitmapSprite = new Sprite();
            this.bitmapSprite.addChild(this.bitmap_ = new Bitmap(new logo().bitmapData));
            addChild(this.bitmapSprite);

            this.nameText = new SimpleText(18, 0xFFFFFF, false, WIDTH + this.bitmapSprite.width, 0, "Myriad Pro");
            this.nameText.boldText(true);
            this.nameText.htmlText = '<p align="center">Mountain</p>';
            this.nameText.wordWrap = true;
            this.nameText.multiline = true;
            this.nameText.autoSize = TextFieldAutoSize.CENTER;
            this.nameText.filters = [new DropShadowFilter(0, 0, 0)];
            addChild(this.nameText);

            this.climbButton = new FancyTextButton(16, "Climb");
            addChild(this.climbButton);

            addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
        }
        private function onAddedToStage(_arg1:Event):void{
            this.nameText.y = 6;
            this.climbButton.x = ((WIDTH / 2) - (this.climbButton.width / 2)) + 20;
            this.climbButton.y = ((HEIGHT - this.climbButton.height) - 4);
            this.climbButton.addEventListener(MouseEvent.CLICK, this.onClimbClick);
            this.bitmapSprite.x = 10;
            this.bitmapSprite.y = ((HEIGHT / 2) - (this.bitmapSprite.height / 2));
            stage.addEventListener(KeyboardEvent.KEY_DOWN, this.onKeyDown);
            this.gs_.dispatchInteractiveObject("Press [" + _H_V_._in[Parameters.data_.interact] + "] to interact.");

            this.bitmapSprite.addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
            this.bitmapSprite.addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
        }
        private function onRemovedFromStage(_arg1:Event):void{
            stage.removeEventListener(KeyboardEvent.KEY_DOWN, this.onKeyDown);
            this.bitmapSprite.removeEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
            this.bitmapSprite.removeEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
            if (this.toolTip != null)
            {
                if (this.toolTip.parent != null)
                {
                    this.toolTip.parent.removeChild(this.toolTip);
                }
                this.toolTip = null;
            }
        }
        private function onClimbClick(_arg1:MouseEvent):void{
            this.enterPortal();
        }
        private function onKeyDown(_arg1:KeyboardEvent):void{
            if ((((_arg1.keyCode == Parameters.data_.interact)) && (!(_4D_._0G_B_))))
            {
                this.enterPortal();
            }
        }
        private function enterPortal():void{
            //gs_.packetManager.usePortal(this._iA_.objectId_);
        }
        override public function draw():void{
            this.nameText.htmlText = (('<p align="center">' + this.obj.mountainName + "</p>"));
            this.nameText._08S_();
            if (this.nameText.height > 30)
            {
                this.nameText.y = 0;
            } else
            {
                this.nameText.y = 6;
            }
        }

        private function onMouseOver(_arg1:MouseEvent):void{
            if (this.toolTip != null)
            {
                if (this.toolTip.parent != null)
                {
                    this.toolTip.parent.removeChild(this.toolTip);
                }
                this.toolTip = null;
            }
            this.toolTip = new mountainTooltip(obj.xml);
            stage.addChild(this.toolTip);
        }
        private function onMouseOut(_arg1:MouseEvent):void{
            if (this.toolTip != null)
            {
                if (this.toolTip.parent != null)
                {
                    this.toolTip.parent.removeChild(this.toolTip);
                }
                this.toolTip = null;
            }
        }
    }
}

import Panels.MountainPanel;

import ToolTips.ToolTip;

import com.company.ui.SimpleText;

import flash.display.Bitmap;
import flash.filters.DropShadowFilter;

class mountainTooltip extends ToolTip {

    private var title:SimpleText;
    private var desc:SimpleText;
    private var img:Bitmap;
    private var xml:XML;

    public function mountainTooltip(objXml:XML){
        super(0x000000, 1, 0xffffff, 1, true);
        this.xml = objXml;

        this.img = new Bitmap(new MountainPanel.logo().bitmapData);
        this.img.x = 5;
        this.img.y = 5;
        addChild(this.img);

        this.title = new SimpleText(18, 0xffffff, false, 230, 0);
        this.title.boldText(true);
        this.title.wordWrap = true;
        this.title.text = this.xml.DisplayId;
        this.title.updateMetrics();
        this.title.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
        this.title.x = (this.img.width + 4);
        this.title.y = 5;
        addChild(this.title);

        this.desc = new SimpleText(13, 0xffffff, false, 230, 0);
        this.desc.wordWrap = true;
        this.desc.text = this.xml.Description;
        this.desc.updateMetrics();
        this.desc.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
        this.desc.x = (this.img.width + 4);
        this.desc.y = this.title.y + this.title.height + 5;
        addChild(this.desc);
    }
}

