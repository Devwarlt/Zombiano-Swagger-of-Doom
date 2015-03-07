// Copyright (c) 2015, FireBite/Aceticsoft Studios Inc.
// All rights reserved.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
// ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

/**
 * Created by Fabian on 20.12.2014.
 */
package AccountManagement.tabHolders {
import AccountManagement.AccountManagementBody;
import AccountManagement.ui.TabButton;

import _05R_.GTween;

import _qN_.Account;

import com.company.assembleegameclient.appengine.WebRequest;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.ui.SimpleText;

import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;

public class FirePacksHolder extends TabHolder {

    private var nextArrowBtn:nextArrow;
    private var prevArrowBtn:prevArrow;

    public var packInfoScreen:Sprite;
    private var holderSprite:Sprite;
    private var holderSpritePos:Number;
    private var queue:Vector.<Number> = new Vector.<Number>();
    private var completed:Boolean = true;
    private var numberOfPacks:int = 0;

    public function FirePacksHolder(parent:AccountManagementBody) {
        super(parent);
        holderSprite = new Sprite();
    }

    private var nextWidth:Number = 0;

    public override function initialize():void {
        var title:SimpleText = new SimpleText(46, 0xffffff);
        title.text = "FIRE PACKS";
        title.boldText(true);
        title.x = ((WIDTH / 2) - (title.textWidth / 2));
        title.y = 5;
        title.updateMetrics();
        title.filters = [new DropShadowFilter()];
        addChild(title);

        this.prevArrowBtn = new prevArrow();
        this.prevArrowBtn.addEventListener(MouseEvent.CLICK, this.onArrowClick);
        addChild(this.prevArrowBtn);

        this.nextArrowBtn = new nextArrow();
        this.nextArrowBtn.x = WIDTH - nextArrow.WIDTH;
        this.nextArrowBtn.addEventListener(MouseEvent.CLICK, this.onArrowClick);
        addChild(this.nextArrowBtn);

        var gold5x:gold5xHolder = new gold5xHolder();
        gold5x.x = ((WIDTH / 2) - (gold5x.width / 2));
        gold5x.y = 250;
        addChild(gold5x);

        this.holderSprite.x = 40;
        this.holderSprite.y = 60;
        addChild(this.holderSprite);
        holderSpritePos = 40;

        var holderMask:Sprite = new Sprite();
        holderMask.x = 40;
        holderMask.y = this.holderSprite.y;
        holderMask.graphics.beginFill(0x000000, 0.0);
        holderMask.graphics.drawRect(0, 0, (FirePackHolder.WIDTH * 4) + 1, FirePackHolder.HEIGHT + 1);
        holderMask.graphics.endFill();
        addChild(holderMask);
        this.holderSprite.mask = holderMask;

        for each (var pack:packInfo in getPacks()) {
            var FirePack:FirePackHolder = new FirePackHolder(pack);
            FirePack.x = nextWidth;
            numberOfPacks++;
            if (FirePack.button != null) {
                FirePack.button.addEventListener(MouseEvent.CLICK, this.onOpenClick);
            }
            holderSprite.addChild(FirePack);
            nextWidth += 180;
        }
    }

    private function getPacks():Vector.<packInfo> {
        var packs:Vector.<packInfo> = new Vector.<packInfo>();
        var pack:packInfo;
        for each (var packData:XML in bodyParent.managementParent.accountXml.FirePacks.Pack) {
            pack = new packInfo();
            pack.name = packData.@name;
            pack.type = packData.@type;
            pack.id = packData.@id;
            pack.contents = packInfo.parseContents(String(XML(packData.Contents)));
            packs.push(pack);
        }

        while (packs.length < 5) {
            packs.push(null);
        }

        return packs;
    }

    private function onOpenClick(event:MouseEvent):void {
        if (packInfoScreen == null) {
            var req:WebRequest = new WebRequest(Parameters.getAccountServerIP(), "/account", true);
            var query:Object = Account._get().credentials();
            query["packId"] = (event.target.parent as FirePackHolder).info.id;
            req.sendRequest("openFirePack", query);
            var info:Sprite = (event.target.parent as FirePackHolder).getInfo();
            info.scaleX = info.scaleY = 0.0;
            info.x = ((WIDTH / 2) - (info.width / 2));
            info.y = ((HEIGHT / 2) - (info.height / 2));
            addChild(info);
            packInfoScreen = info;
            var tween:GTween = new GTween(info, 0.15, {"scaleX": 1.0, "scaleY": 1.0});
            tween.onChange = onChange;
        }
    }

    public function onChange(tween:GTween):void {
        if (packInfoScreen != null) {
            packInfoScreen.x = ((WIDTH / 2) - (packInfoScreen.width / 2));
            packInfoScreen.y = ((HEIGHT / 2) - (packInfoScreen.height / 2));
        }
    }

    private function animationCompleted(tween:GTween):void {
        if (queue.length > 0) {
            tween = new GTween(holderSprite, 0.2, {"x": Number(queue.shift())});
            tween.onComplete = animationCompleted;
        }
        else {
            completed = true;
        }
    }

    private function onArrowClick(event:MouseEvent):void {
        if ((holderSpritePos + (numberOfPacks * FirePackHolder.WIDTH) <= 760 && event.target is nextArrow) ||
                (holderSpritePos >= 0 && event.target is prevArrow)) {
            return;
        }

        var oldPos:Number = holderSpritePos;

        if (event.target is nextArrow) {
            holderSpritePos -= FirePackHolder.WIDTH;
        }
        else {
            holderSpritePos += FirePackHolder.WIDTH;
        }

        if (oldPos != holderSpritePos) {
            if (completed) {
                var animation:GTween = new GTween(holderSprite, 0.2, {"x": holderSpritePos});
                animation.onComplete = animationCompleted;
                completed = false;
            }
            else {
                queue.push(holderSpritePos);
            }
        }
    }
}
}

import AccountManagement.images.AccountManagementImages;
import AccountManagement.tabHolders.FirePacksHolder;
import AccountManagement.ui.FancyTextButton;

import _05R_.GTween;

import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.assembleegameclient.util.TextureRedrawer;
import com.company.ui.SimpleText;
import com.company.util.AssetLibrary;
import com.company.util.GraphicHelper;

import flash.display.Bitmap;
import flash.display.GradientType;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.geom.Matrix;

class FirePackHolder extends Sprite {
    public static const WIDTH:int = 180;
    public static const HEIGHT:int = 180;

    private var image:Bitmap;
    private var text:SimpleText;
    public var info:packInfo;
    public var button:FancyTextButton;

    public function FirePackHolder(info:packInfo) {
        this.info = info;
        graphics.beginFill(0x000000, 0.5);
        graphics.drawRect(0, 0, WIDTH, HEIGHT);

        GraphicHelper.createBorder(this, 1, 0xffffff);

        if (info != null) {
            resolveImage();

            image.x = ((WIDTH / 2) - (image.width / 2));
            image.y = 10;
            addChild(image);

            this.text = new SimpleText(16, 0xffffff);
            this.text.text = info.name.toUpperCase();
            this.text.updateMetrics();
            this.text.y = 10 + image.height;
            this.text.x = ((WIDTH / 2) - (this.text.width / 2));
            addChild(this.text);

            this.button = new FancyTextButton(18, "OPEN");
            this.button.x = ((WIDTH / 2) - (this.button.width / 2));
            this.button.y = HEIGHT - this.button.height - 10;
            addChild(this.button);
        }
    }

    private function resolveImage():void {
        switch (info.type) {
            case 0:
                image = new AccountManagementImages.bronzeFirePack();
                break;
            case 1:
                image = new AccountManagementImages.silverFirePack();
                break;
            case 2:
                image = new AccountManagementImages.goldFirePack();
                break;
            case 3:
                image = new AccountManagementImages.premiumFirePack();
                break;
        }
    }

    public function getInfo():Sprite {
        var width:Number = 600;
        var height:Number = 400;
        var nextImgWidth:Number = 15;
        var nextImgHeight:Number = 130;
        var sprite:Sprite = new Sprite();
        var title:SimpleText = new SimpleText(18, 0x000000);
        var currentHolders:Vector.<itemHolder> = new Vector.<itemHolder>();
        var itemName:SimpleText = new SimpleText(20, 0xffffff, false, 40, 450);
        var itemDesc:SimpleText = new SimpleText(18, 0xffffff, false, 60, 450);
        var closeBtn:FancyTextButton = new FancyTextButton(20, "CLOSE");
        var image:Bitmap = new Bitmap(TextureRedrawer.redraw(AssetLibrary._xK_("openFirePacks",
                info.type == 0 ? 0 : info.type == 1 ? 3 : info.type == 2 ? 1 : info.type == 3 ? 2 : 4), 100, false, 0, 0, false, 1));

        sprite.graphics.beginFill(0x000000, 1.0);
        sprite.graphics.drawRect(0, 0, width, height);
        sprite.graphics.endFill();

        sprite.graphics.beginFill(0xffffff, 1.0);
        sprite.graphics.drawRect(0, 0, width, 25);
        sprite.graphics.endFill();

        GraphicHelper.createBorder(sprite, 1, 0xffffff);

        title.boldText(true);
        title.text = this.text.text.toUpperCase();
        title.updateMetrics();
        title.x = ((width / 2) - (title.width / 2));

        closeBtn.x = width - closeBtn.width - 10;
        closeBtn.y = height - closeBtn.height - 10;
        closeBtn.addEventListener(MouseEvent.CLICK, function (event:MouseEvent):void {
            var tween:GTween = new GTween(event.target.parent, 0.15, {"scaleX": 0.0, "scaleY": 0.0});
            tween.onChange = (sprite.parent as FirePacksHolder).onChange;
            tween.onComplete = function (tw:GTween):void {
                (sprite.parent as FirePacksHolder).packInfoScreen = null;
                (sprite.parent as FirePacksHolder).bodyParent.managementParent.dispatch("RELOAD");
                sprite.parent.removeChild(sprite);
            };
        });

        image.x = ((width / 2) - (image.width / 2));
        image.y = 25;

        itemName.x = 15;
        itemName.y = 300;
        itemName.boldText(true);
        itemName.multiline = true;

        itemDesc.x = 15;
        itemDesc.y = 330;
        itemDesc.multiline = true;
        itemDesc.wordWrap = true;

        sprite.addChild(title);
        sprite.addChild(image);
        sprite.addChild(itemName);
        sprite.addChild(itemDesc);
        sprite.addChild(closeBtn);

        var holder:itemHolder;
        var items:int = 0;
        var firstItem:Boolean = true;

        for each (var itemId:int in info.contents) {
            var itemXml:XML = ObjectLibrary.Items[itemId];
            if (itemXml != null) {
                holder = new itemHolder(itemXml, firstItem);
                holder.x = nextImgWidth;
                holder.y = nextImgHeight;
                currentHolders.push(holder);
                holder.addEventListener(MouseEvent.CLICK, function (event:MouseEvent):void {
                    for each (var iHolder:itemHolder in currentHolders) {
                        iHolder.selected = false;
                    }

                    event.target.selected = true;
                    itemName.text = String(XML(event.target.itemXml).hasOwnProperty("DisplayId") ? event.target.itemXml.DisplayId : event.target.itemXml.@id).toUpperCase();
                    itemDesc.text = String(event.target.itemXml.Description);
                });

                if (firstItem) {
                    itemName.text = String(itemXml.hasOwnProperty("DisplayId") ? itemXml.DisplayId : itemXml.@id).toUpperCase();
                    itemDesc.text = String(XML(itemXml.Description).toString());
                }

                sprite.addChild(holder);

                nextImgWidth += itemHolder.WIDTH;
                items++;
                firstItem = false;

                if (items % 3 == 0) {
                    nextImgWidth = 15;
                    nextImgHeight += itemHolder.HEIGHT;
                    items = 0;
                }
            }
        }

        return sprite;
    }
}

class itemHolder extends Sprite {
    public static const WIDTH:int = 190;
    public static const HEIGHT:int = 70;

    private var image:Bitmap;
    private var _selected:Boolean;
    public var itemXml:XML;

    public function itemHolder(itemXml:XML, selected:Boolean) {
        this.itemXml = itemXml;
        graphics.beginFill(0x6B6B6B, 1.0);
        graphics.drawRect(0, 0, WIDTH, HEIGHT);
        graphics.endFill();

        GraphicHelper.createBorder(this, 1, 0xffffff);

        this.image = new Bitmap(ObjectLibrary.getRedrawnTextureFromType(itemXml.@type, itemXml.hasOwnProperty("ScaleValue") ? (itemXml.ScaleValue * 10 / 2) + 80 : 80, false, false, itemXml.hasOwnProperty("ScaleValue") ? itemXml.ScaleValue : 5));
        this.image.x = ((WIDTH / 2) - (image.width / 2));
        this.image.y = ((HEIGHT / 2) - (image.height / 2)) - 5;
        addChild(this.image);

        this.selected = selected;

        this.addEventListener(MouseEvent.ROLL_OVER, this.onRollOver);
        this.addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
    }

    public function set selected(val:Boolean):void {
        _selected = val;
        if (val) {
            var gradientMatrix:Matrix = new Matrix();
            gradientMatrix.createGradientBox(WIDTH, HEIGHT, (Math.PI / 180) * 90, 0, 0);
            graphics.beginGradientFill(GradientType.LINEAR, [0xE5C100, 0x000000], [0.6, 0.0], [0, 200], gradientMatrix);
            graphics.drawRect(0, 0, WIDTH, HEIGHT);
            graphics.endFill();
        }
        else {
            graphics.clear();
            graphics.beginFill(0x6B6B6B, 1.0);
            graphics.drawRect(0, 0, WIDTH, HEIGHT);
            graphics.endFill();
            GraphicHelper.createBorder(this, 1, 0xffffff);
        }
    }

    public function get selected():Boolean {
        return _selected;
    }

    private function onRollOver(event:MouseEvent):void {
        graphics.clear();
        graphics.beginFill(0x424242, 1.0);
        graphics.drawRect(0, 0, WIDTH, HEIGHT);
        graphics.endFill();

        if (selected) {
            var gradientMatrix:Matrix = new Matrix();
            gradientMatrix.createGradientBox(WIDTH, HEIGHT, (Math.PI / 180) * 90, 0, 0);
            graphics.beginGradientFill(GradientType.LINEAR, [0xE5C100, 0x000000], [0.6, 0.0], [0, 200], gradientMatrix);
            graphics.drawRect(0, 0, WIDTH, HEIGHT);
            graphics.endFill();
        }

        GraphicHelper.createBorder(this, 1, 0xffffff);
    }

    private function onRollOut(event:MouseEvent):void {
        graphics.clear();
        graphics.beginFill(0x6B6B6B, 1.0);
        graphics.drawRect(0, 0, WIDTH, HEIGHT);
        graphics.endFill();

        if (selected) {
            var gradientMatrix:Matrix = new Matrix();
            gradientMatrix.createGradientBox(WIDTH, HEIGHT, (Math.PI / 180) * 90, 0, 0);
            graphics.beginGradientFill(GradientType.LINEAR, [0xE5C100, 0x000000], [0.6, 0.0], [0, 200], gradientMatrix);
            graphics.drawRect(0, 0, WIDTH, HEIGHT);
            graphics.endFill();
        }

        GraphicHelper.createBorder(this, 1, 0xffffff);
    }
}

class nextArrow extends Sprite {
    public static const WIDTH:int = 40;
    public static const HEIGHT:int = 450;

    public function nextArrow() {
        graphics.beginFill(0x000000, 0.4);
        graphics.drawRect(0, 0, WIDTH, HEIGHT);
        graphics.endFill();

        var arrow:Bitmap = AccountManagementImages.nextArrow(1.0);
        arrow.x = ((WIDTH / 2) - (arrow.width / 2));
        arrow.y = ((HEIGHT / 2) - (arrow.height / 2));
        addChild(arrow);

        this.addEventListener(MouseEvent.ROLL_OVER, this.onRollOver);
        this.addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
    }

    private function onRollOver(event:MouseEvent):void {
        graphics.clear();
        graphics.beginFill(0x000000, 0.8);
        graphics.drawRect(0, 0, WIDTH, HEIGHT);
        graphics.endFill();
    }

    private function onRollOut(event:MouseEvent):void {
        graphics.clear();
        graphics.beginFill(0x000000, 0.4);
        graphics.drawRect(0, 0, WIDTH, HEIGHT);
        graphics.endFill();
    }
}

class prevArrow extends Sprite {
    public static const WIDTH:int = 40;
    public static const HEIGHT:int = 450;

    public function prevArrow() {
        graphics.beginFill(0x000000, 0.4);
        graphics.drawRect(0, 0, WIDTH, HEIGHT);
        graphics.endFill();

        var arrow:Bitmap = AccountManagementImages.prevArrow(1.0);
        arrow.x = (((WIDTH / 2) - (arrow.width / 2)) + arrow.width);
        arrow.y = ((HEIGHT / 2) - (arrow.height / 2));
        addChild(arrow);

        this.addEventListener(MouseEvent.ROLL_OVER, this.onRollOver);
        this.addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
    }

    private function onRollOver(event:MouseEvent):void {
        graphics.clear();
        graphics.beginFill(0x000000, 0.8);
        graphics.drawRect(0, 0, WIDTH, HEIGHT);
        graphics.endFill();
    }

    private function onRollOut(event:MouseEvent):void {
        graphics.clear();
        graphics.beginFill(0x000000, 0.4);
        graphics.drawRect(0, 0, WIDTH, HEIGHT);
        graphics.endFill();
    }
}

class packInfo {
    public var name:String;
    public var type:int;
    public var id:String;
    public var contents:Vector.<int>;

    public static function parseContents(contentString:String):Vector.<int> {
        contentString = contentString.replace(" ", "");
        var arr:Array = contentString.split(",");
        var ret:Vector.<int> = new Vector.<int>();
        for each (var i:String in arr) {
            ret.push(int(i));
        }
        return ret;
    }
}

class gold5xHolder extends Sprite {

    private var image:Bitmap;

    public function gold5xHolder() {

        this.image = new Bitmap(new AccountManagementImages.gold_x5().bitmapData);

        graphics.beginFill(0x000000, 0.6);
        graphics.drawRect(0, 0, image.width + 20, image.height + 20);
        graphics.endFill();
        GraphicHelper.createBorder(this, 1, 0xE5C100);

        image.x = ((width / 2) - (image.width / 2) - 2);
        image.y = ((height / 2) - (image.height / 2) - 2);
        addChild(image);

        this.addEventListener(MouseEvent.ROLL_OVER, this.onRollOver);
        this.addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
    }

    private function onRollOver(event:MouseEvent):void {
        graphics.clear();
        var gradientMatrix:Matrix = new Matrix();
        gradientMatrix.createGradientBox(image.width + 20, image.height + 20, (Math.PI / 180) * 90, 0, 0);
        graphics.beginGradientFill(GradientType.LINEAR, [0xffffff, 0x000000], [0.6, 0.6], [0, 200], gradientMatrix);
        graphics.drawRect(0, 0, image.width + 20, image.height + 20);
        graphics.endFill();
        GraphicHelper.createBorder(this, 1, 0xE5C100);
    }

    private function onRollOut(event:MouseEvent):void {
        graphics.clear();
        graphics.beginFill(0x000000, 0.6);
        graphics.drawRect(0, 0, image.width + 20, image.height + 20);
        graphics.endFill();
        GraphicHelper.createBorder(this, 1, 0xE5C100);
    }
}