/**
 * Created by Fabian on 18.12.2014.
 */
package AccountManagement.ui {
import AccountManagement.tabHolders.TabHolder;

import com.company.assembleegameclient.util.TextureRedrawer;
import com.company.ui.SimpleText;
import com.company.util.GraphicHelper;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.GraphicsPath;
import flash.display.GraphicsSolidFill;
import flash.display.IGraphicsData;
import flash.display.Sprite;
import flash.errors.IllegalOperationError;
import flash.filters.DropShadowFilter;

public class TabButton extends Sprite {
    public static const HEIGHT:int = 24;

    public var tabId:int = 0;
    public var w_:Number = 0;
    public var text:SimpleText;

    private var holder_:TabHolder;
    private var bmp:Bitmap;
    private var selected_:Boolean;
    private var selectedColor_:uint = 0x473224;
    private var deSelectedColor_:uint = 0x5C4434;

    private var fill_:GraphicsSolidFill;
    private var path_:GraphicsPath;
    private var graphicsData_:Vector.<IGraphicsData>;

    public function TabButton(text:String, icon:BitmapData, _tabId:int, _selected:Boolean = false) {
        this.path_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
        if(icon != null) {

            if(icon.width != 100 || icon.height != 100) {
                throw new IllegalOperationError("Image width and height needs to be 100");
            }

            icon = TextureRedrawer.redraw(icon, (320 / icon.width), true, 0, 0);

            this.bmp = new Bitmap(icon);
            this.bmp.x = -(this.bmp.width / 5) + 3;
            this.bmp.y = -(this.bmp.height / 4) + 3;//-3.5;
            this.w_ += (this.bmp.width / 4) + 10;
            addChild(this.bmp);

            var imageMask:Sprite = new Sprite();
            imageMask.graphics.beginFill(0x000000, 0.0);
            imageMask.graphics.drawRect(0, 0, this.w_ + 10, HEIGHT);
            imageMask.graphics.endFill();
            addChild(imageMask);
            this.bmp.mask = imageMask;
        }
        this.tabId = _tabId;

        this.text = new SimpleText(16, 0xffffff);
        this.text.x = this.w_ + 5;
        this.text.boldText(true);
        this.text.text = text;
        this.text.updateMetrics();
        this.text.filters = [new DropShadowFilter(0, 0, 0, 1, 8, 8)];
        addChild(this.text);

        this.w_ += (this.text.textWidth + 15);

        this.selected = _selected;
    }

    public override function get height():Number {
        return HEIGHT;
    }

    public function set selected(_selected:Boolean):void {
        this.selected_ = _selected;
        this.draw();
    }

    public function get selected():Boolean {
        return this.selected_;
    }

    public function set selectedColor(val:uint):void {
        selectedColor_ = val;
        draw();
    }

    public function set deSelectedColor(val:uint):void {
        deSelectedColor_ = val;
        draw();
    }

    public function set holder(tabHolder:TabHolder):void {
        if(this.holder_ == null) {
            this.holder_ = tabHolder;
            this.holder_.initialize(this);
        }
    }

    public function get holder():TabHolder {
        return this.holder_;
    }

    public function updateFill(_selected:Boolean):void {
        this.fill_ = new GraphicsSolidFill(_selected ? selectedColor_ : deSelectedColor_, 1);
        this.graphicsData_ = new <IGraphicsData>[this.fill_, this.path_, GraphicHelper.END_FILL];
    }

    public function draw():void {
        this.updateFill(this.selected);
        GraphicHelper._0L_6(this.path_);
        GraphicHelper.drawUI(0, 0, this.w_, HEIGHT, 5, [1, 1, 0, 0], this.path_);
        this.graphics.clear();
        this.graphics.drawGraphicsData(this.graphicsData_);
    }
}
}
