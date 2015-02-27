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
 * Created by Fabian on 28.01.2015.
 */
package Villages.ui {
import Villages.VillageManagementScreenBase;

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

    private var holder_:VillageManagementScreenBase;
    private var bmp:Bitmap;
    private var selected_:Boolean;
    private var selectedColor_:uint = 0x473224;
    private var deSelectedColor_:uint = 0x5C4434;

    private var fill_:GraphicsSolidFill;
    private var path_:GraphicsPath;
    private var graphicsData_:Vector.<IGraphicsData>;

    public function TabButton(text:String, icon:BitmapData, _tabId:int, _selected:Boolean = false) {
        this.path_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
        if (icon != null) {

            if (icon.width != 100 || icon.height != 100) {
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

    public function set holder(tabHolder:VillageManagementScreenBase):void {
        if (this.holder_ == null) {
            this.holder_ = tabHolder;
            this.holder_.initialize();
        }
    }

    public function get holder():VillageManagementScreenBase {
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

