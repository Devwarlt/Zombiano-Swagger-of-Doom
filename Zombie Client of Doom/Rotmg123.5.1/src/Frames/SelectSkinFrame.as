/**
 * Created by Fabian on 08.12.2014.
 */
package Frames {
import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.assembleegameclient.ui._0K_B_;
import com.company.assembleegameclient.ui.xButton;
import com.company.ui.SimpleText;
import com.embeds.reskinVendorBackground_Embed;

import flash.display.Bitmap;
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
import flash.filters.GlowFilter;

public class SelectSkinFrame extends Sprite {

    private var gs_:GameSprite;
    private var scrollbar:_0K_B_;
    private var background:Bitmap;
    private var closeBtn:xButton;
    private var charsHeight:Number;
    private var skinInfo:SkinInfoScreen;
    private var rects:Vector.<SkinRect>;

    public var selectedRect:SkinRect;

    public function SelectSkinFrame(_arg1:GameSprite) {
        this.gs_ = _arg1;
        this.background = new reskinVendorBackground_Embed();
        this.addChild(background);

        var title:SimpleText = new SimpleText(36, 0xffffff);
        title.text = "Select a Skin";
        title.boldText(true);
        title.updateMetrics();
        title.x = 300 - (title.textWidth / 2);
        title.y = 20;
        title.filters = [new DropShadowFilter()];
        addChild(title);

        this.closeBtn = new xButton();
        this.closeBtn.x = 595 - closeBtn.width;
        this.closeBtn.y = 5;
        this.closeBtn.event.add(onCloseClick);
        this.addChild(closeBtn);

        this.scrollbar = new _0K_B_(16, 490);
        this.scrollbar.x = SkinRect.WIDTH + 20;
        this.scrollbar.y = 100;
        this.scrollbar._fA_(500, charsHeight);
        this.scrollbar.addEventListener(Event.CHANGE, onChange);
        this.addChild(scrollbar);

        this.addSkins();
        this.scrollbar._fA_(500, charsHeight);

        var s = new Sprite();
        s.graphics.clear();
        s.graphics.lineStyle(2, 0xEE9327);
        s.graphics.moveTo(0, 90);
        s.graphics.lineTo(600, 90);
        s.graphics.moveTo(SkinRect.WIDTH + 30 + scrollbar.width, 90);
        s.graphics.lineTo(SkinRect.WIDTH + 30 + scrollbar.width, 600);
        s.graphics.lineStyle();
        addChild(s);
    }

    private function addSkins():void {
        rects = new Vector.<SkinRect>();
        var skinsSprite = new Sprite();
        var skinsMask = new Shape();
        skinsMask.y = 90;
        skinsMask.graphics.beginFill(0);
        skinsMask.graphics.drawRect(0, 0, SkinRect.WIDTH + 20, 510);
        skinsMask.graphics.endFill();
        skinsSprite.mask = skinsMask;
        addChild(skinsMask);

        skinsSprite.y = 100;
        var h = 0;

        var noSkinXml:XML = <Object type="-1" id="No Skin" />;

        var noSkinRect = new SkinRect(noSkinXml, this, true, this.gs_.map_.player_.skinId_ == -1, h);
        noSkinRect.x = 10;
        noSkinRect.addEventListener(MouseEvent.CLICK, this.onRectClick);
        skinsSprite.addChild(noSkinRect);
        rects.push(noSkinRect);
        h += SkinRect.HEIGHT + 2;

        skinInfo = new SkinInfoScreen(noSkinRect, gs_);
        skinInfo.x = SkinRect.WIDTH + 30 + scrollbar.width + 12;
        skinInfo.y = 100;
        addChild(skinInfo);

        for each(var skinXml:XML in ObjectLibrary.skins) {
            var skinRect = new SkinRect(skinXml, this, this.gs_.charList_.ownedSkins.indexOf(int(skinXml.@type)) > -1, this.gs_.map_.player_.skinId_ == int(skinXml.@type), h);
            skinRect.x = 10;
            skinRect.addEventListener(MouseEvent.CLICK, this.onRectClick);
            skinsSprite.addChild(skinRect);
            rects.push(skinRect);
            h += SkinRect.HEIGHT + 2;
        }
        addChild(skinsSprite);
        this.charsHeight = h + 8;
    }

    private function onRectClick(event:MouseEvent):void {
        this.skinInfo.parentSkinRect.filters = [];
        this.removeChild(this.skinInfo);
        this.skinInfo = new SkinInfoScreen(event.target.parent as SkinRect, gs_);
        this.skinInfo.parentSkinRect.filters = [new GlowFilter(0xFFF700)];
        skinInfo.x = SkinRect.WIDTH + 30 + scrollbar.width + 12;
        skinInfo.y = 100;
        this.addChild(this.skinInfo);
    }

    private function onChange(event:Event):void {
        for each (var skinRect:SkinRect in rects) {
            skinRect.setY(((-(this.scrollbar._Q_D_()) * (this.charsHeight - 500))));
        }
    }

    private function onCloseClick():void {
        parent.removeChild(this);
    }
}
}


import Frames.SelectSkinFrame;

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.assembleegameclient.objects._Z_H_;
import com.company.assembleegameclient.ui._return;
import com.company.assembleegameclient.ui.boxButton;
import com.company.assembleegameclient.util.RankUtils;
import com.company.assembleegameclient.util.TextureRedrawer;
import com.company.ui.SimpleText;
import com.company.util.GraphicHelper;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.GraphicsPath;
import flash.display.GraphicsSolidFill;
import flash.display.IGraphicsData;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
import flash.filters.GlowFilter;
import flash.geom.ColorTransform;

class SkinRect extends Sprite {

    public static const WIDTH = 300;
    public static const HEIGHT = 50;

    private var graphicsData_:Vector.<IGraphicsData>;
    private var path_:GraphicsPath;
    private var yBase:Number;
    private var background:Sprite;
    private var _selected:Boolean;

    public var xml:XML;
    public var icon:_Z_H_;
    public var skinName:SimpleText;
    public var fill:GraphicsSolidFill;
    public var available:Boolean;
    public var bitMapData:BitmapData;
    public var frame:SelectSkinFrame;

    public function SkinRect(_arg1:XML, frame:SelectSkinFrame, available:Boolean, selected:Boolean, y:Number) {
        this.xml = _arg1;
        this.frame = frame;

        this.available = available;
        this._selected = selected;
        if(this._selected) {
            this.frame.selectedRect = this;
        }
        this.background = new Sprite();
        this.fill = new GraphicsSolidFill(available ? selected ? 0x1E852A : 0x858585 : 0x851E1E, 1);
        this.path_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
        this.graphicsData_ = new <IGraphicsData>[fill, path_, GraphicHelper.END_FILL];

        this.y = yBase = y;
        this.useHandCursor = true;

        GraphicHelper._0L_6(this.path_);
        GraphicHelper.drawUI(0, 0, WIDTH, HEIGHT, 4, [1, 1, 1, 1], this.path_);
        background.graphics.clear();
        background.graphics.drawGraphicsData(this.graphicsData_);
        addChild(background);

        icon = ObjectLibrary._V_a[int(_arg1.@type) == -1 ? 0x030e : int(_arg1.@type)];

        var bmp = new Bitmap(bitMapData = TextureRedrawer.resize(icon.getTexture(), null, 100, false, 0, 0));
        bmp.x = (HEIGHT / 2) - (bmp.width / 2);
        bmp.y = (HEIGHT / 2) - (bmp.width / 2);
        bmp.filters = [new DropShadowFilter()];//[new GlowFilter(0x000000, 1.0, 20, 20, 2)];
        addChild(bmp);

        skinName = new SimpleText(18, 0xffffff);
        skinName.boldText(true);
        skinName.text = _arg1.hasOwnProperty("DisplayId") ? String(_arg1.DisplayId) : String(_arg1.@id);
        skinName.x = bmp.width - 10;
        skinName.y = (HEIGHT / 2) - (skinName.textHeight / 2);
        skinName.filters = [new GlowFilter(0x000000)];
        skinName.updateMetrics();
        addChild(skinName);

        this.addEventListener(MouseEvent.ROLL_OVER, this.onRollOver);
        this.addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
    }

    public function set selected(_arg1:Boolean):void {
        _selected = _arg1;
        if(background != null) {
            this.fill = new GraphicsSolidFill(_selected ? 0x1E852A : 0x858585, 1);
            this.path_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
            this.graphicsData_ = new <IGraphicsData>[fill, path_, GraphicHelper.END_FILL];

            GraphicHelper._0L_6(this.path_);
            GraphicHelper.drawUI(0, 0, WIDTH, HEIGHT, 4, [1, 1, 1, 1], this.path_);
            background.graphics.clear();
            background.graphics.drawGraphicsData(this.graphicsData_);
        }
    }

    public function get selected():Boolean {
        return _selected;
    }

    public function setY(_arg1:Number):void {
        y = yBase + _arg1;
    }

    private function onRollOver(event:MouseEvent):void {
        this.background.transform.colorTransform = new ColorTransform(1.6513, 1.8627, -0.5216);
    }

    private function onRollOut(event:MouseEvent):void {
        this.background.transform.colorTransform = new ColorTransform(1, 1, 1);
    }
}

class SkinInfoScreen extends Sprite {

    public static const WIDTH = 232;
    public static const HEIGHT = 490;

    private var graphicsData_:Vector.<IGraphicsData>;
    private var fill:GraphicsSolidFill;
    private var path_:GraphicsPath;
    private var skinName:SimpleText;
    private var thanksToText:SimpleText;
    private var spacer1:_return;
    private var spacer2:_return;
    private var unlockText:SimpleText;
    private var specialText:SimpleText;
    private var gs_:GameSprite;
    private var selectBtn:boxButton;

    public var parentSkinRect:SkinRect;

    public function SkinInfoScreen(_arg1:SkinRect, _arg2:GameSprite) {
        this.parentSkinRect = _arg1;
        this.gs_ = _arg2;

        this.fill = new GraphicsSolidFill(0x572700);
        this.path_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
        this.graphicsData_ = new <IGraphicsData>[fill, path_, GraphicHelper.END_FILL];

        GraphicHelper._0L_6(this.path_);
        GraphicHelper.drawUI(0, 0, WIDTH, HEIGHT, 4, [1, 1, 1, 1], this.path_);
        graphics.clear();
        graphics.drawGraphicsData(this.graphicsData_);

        this.filters = [new DropShadowFilter()];

        var bmp = new Bitmap(_arg1.bitMapData);
        bmp.filters = [new DropShadowFilter()];//[new GlowFilter(0x000000, 1.0, 20, 20, 2)];
        addChild(bmp);

        this.skinName = new SimpleText(26, 0xffffff);
        this.skinName.boldText(true);
        this.skinName.x = 10;
        this.skinName.y = bmp.height;
        this.skinName.text = _arg1.skinName.text;
        this.skinName.updateMetrics();
        this.addChild(skinName);
        var h = (this.skinName.y + this.skinName.textHeight + 10);

        this.specialText = new SimpleText(16, 0xB3B3B3, false, 174, 0, "Myriad Pro");
        this.specialText.boldText(true);
        this.specialText.text = "Special ability:";
        this.specialText.updateMetrics();
        this.specialText.filters = [new DropShadowFilter(0, 0, 0)];
        this.specialText.x = 10;
        this.specialText.y = h;
        addChild(this.specialText);
        h = (this.specialText.y + this.specialText.textHeight + 10);

        this.specialText = new SimpleText(17, 6206769, false, 0, 0, "Myriad Pro");
        this.specialText.wordWrap = false;
        this.specialText.multiline = true;
        var text:String = "";
        var number:int = 1;
        for each (var special:XML in _arg1.xml.Specials.Special)
        {
            text += number.toString() + ". " + special + "\n";
            number++;
        }
        if(text == ""){
            text += "No special ability\nAccessory Item.\n";
        }
        this.specialText.text = text.slice(0, text.lastIndexOf("\n"));
        this.specialText.updateMetrics();
        this.specialText.filters = [new DropShadowFilter(0, 0, 0)];
        this.specialText.x = 8;
        this.specialText.y = h;
        addChild(this.specialText);
        h = (this.specialText.y + this.specialText.textHeight + 10);

        this.spacer1 = new _return(100, 0x310800);
        this.spacer1.x = 6;
        this.spacer1.y = h;
        addChild(this.spacer1);
        h = (this.spacer1.y + this.spacer1.height + 10);

        this.unlockText = new SimpleText(16, 0xB3B3B3, false, 174, 0, "Myriad Pro");
        this.unlockText.boldText(true);
        if(!_arg1.available)
        {
            this.unlockText.text = "To Unlock:";
            this.unlockText.updateMetrics();
            this.unlockText.filters = [new DropShadowFilter(0, 0, 0)];
            this.unlockText.x = 10;
            this.unlockText.y = h;
            addChild(this.unlockText);
            h = (this.unlockText.y + this.unlockText.textHeight + 10);
            this.unlockText = new SimpleText(16, 16549442, false, 174, 0, "Myriad Pro");
            this.unlockText.wordWrap = true;
            this.unlockText.multiline = true;
            text = "";
            for each (var item:XML in _arg1.xml.Unlock) {
                if (item.hasOwnProperty("Rank")) {
                    text += "Rank required:\n" + RankUtils.toLongRankString(item.Rank) + "\n\n";
                }

                if (item.hasOwnProperty("InGameDrop")) {
                    text += "Find skin in game as drop.\n\n";
                }

                if (item.hasOwnProperty("InGameReward")) {
                    text += "Reward:\n" + item.InGameReward + "\n\n";
                }
            }
            this.unlockText.text = text.slice(0, text.lastIndexOf("\n\n"));
        }
        else {
            this.unlockText.text = "Unlocked";
        }

        this.unlockText.border = false;
        this.unlockText.updateMetrics();
        this.unlockText.filters = [new DropShadowFilter(0, 0, 0)];
        this.unlockText.x = 16;
        this.unlockText.y = h;
        addChild(this.unlockText);
        h = (this.unlockText.y + this.unlockText.textHeight + 10);

        if(_arg1.hasOwnProperty("ThanksTo")) {
            this.spacer2 = new _return(100, 0x310800);
            this.spacer2.x = 6;
            this.spacer2.y = h;
            addChild(this.spacer2);
            h = (this.spacer2.y + this.spacer2.height);

            this.thanksToText = new SimpleText(20, 0x146AE3, false, 174, 0, "Myriad Pro");
            this.thanksToText.boldText(false);
            this.thanksToText.wordWrap = true;
            this.thanksToText.multiline = true;
            this.thanksToText.text = "Special thanks to:";
            this.thanksToText.x = 110;
            this.thanksToText.y = h;
            this.thanksToText.updateMetrics();
            addChild(this.thanksToText);
            h = (this.thanksToText.y + this.thanksToText.textHeight + 10);

            this.thanksToText = new SimpleText(14, 0x00BFFF, false, 174, 0, "Myriad Pro");
            this.thanksToText.boldText(true);
            this.thanksToText.wordWrap = true;
            this.thanksToText.multiline = true;
            this.thanksToText.text = _arg1.xml.ThanksTo;
            this.thanksToText.x = 16;
            this.thanksToText.y = h;
            this.thanksToText.updateMetrics();
            addChild(this.thanksToText);
        }

        if(!_arg1.selected) {
            selectBtn = new boxButton(20, "Select");
            selectBtn.y = HEIGHT - 50;
            selectBtn.x = (WIDTH / 2) - (selectBtn.w_ / 2);
            selectBtn._A_w(_arg1.available);
            selectBtn.addEventListener(MouseEvent.CLICK, this.onSkinSelect);
            addChild(selectBtn);
        }

        this.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    private function onSkinSelect(event:MouseEvent):void {
        this.gs_.packetManager.reskin(int(this.parentSkinRect.xml.@type));
        this.parentSkinRect.frame.selectedRect.selected = false;
        this.parentSkinRect.frame.selectedRect = this.parentSkinRect;
        this.parentSkinRect.selected = true;
        this.selectBtn.visible = false;
    }

    private function onEnterFrame(event:Event):void {
        this.spacer1._rs((width - 12), 0x310800);
        if(spacer2 != null) {
            this.spacer2._rs((width - 12), 0x310800);
        }
    }
}
