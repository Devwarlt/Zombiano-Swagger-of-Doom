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

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ToolTips._for_

package ToolTips {
import flash.display.Sprite;

import flash.display.IGraphicsData;

import com.company.util.GraphicHelper;

import flash.display.GraphicsSolidFill;
import flash.display.GraphicsStroke;
import flash.display.GraphicsPath;
import flash.display.LineScaleMode;
import flash.display.CapsStyle;
import flash.display.JointStyle;
import flash.filters.DropShadowFilter;
import flash.events.Event;


public class ToolTip extends Sprite {

    private var graphicsData_:Vector.<IGraphicsData>;

    private var background_:uint;
    private var backgroundAlpha:Number;
    private var outlineColor:uint;
    private var outlineAlpha:Number;
    private var updatePosition:Boolean;
    public var w_:int;
    public var h_:int;
    private var _vV_:GraphicsSolidFill;
    private var outlineFill_:GraphicsSolidFill;
    private var stroke_:GraphicsStroke;
    private var path_:GraphicsPath;

    public function ToolTip(backgroundColor:uint, backgroundAlpha:Number, outlineColor:uint, outlineAlpha:Number, updatePosition:Boolean = true) {
        this._vV_ = new GraphicsSolidFill(0, 1);
        this.outlineFill_ = new GraphicsSolidFill(0xFFFFFF, 1);
        this.stroke_ = new GraphicsStroke(1, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3, this.outlineFill_);
        this.path_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
        this.graphicsData_ = new <IGraphicsData>[stroke_, _vV_, path_, GraphicHelper.END_FILL, GraphicHelper._H_B_];
        super();
        this.background_ = backgroundColor;
        this.backgroundAlpha = backgroundAlpha;
        this.outlineColor = outlineColor;
        this.outlineAlpha = outlineAlpha;
        this.updatePosition = updatePosition;
        mouseEnabled = false;
        mouseChildren = false;
        filters = [new DropShadowFilter(0, 0, 0, 1, 16, 16)];
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }

    private function onAddedToStage(_arg1:Event):void {
        this.draw();
        if (this.updatePosition) {
            this.position();
            addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        }
    }

    private function onRemovedFromStage(_arg1:Event):void {
        if (this.updatePosition) {
            removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        }
    }

    private function onEnterFrame(_arg1:Event):void {
        this.position();
    }

    private function position():void {
        if (stage == null) {
            return;
        }
        stage;
        if (stage.mouseX < (800 / 2)) {
            x = (stage.mouseX + 12);
        } else {
            x = ((stage.mouseX - width) - 1);
        }
        if (x < 12) {
            x = 12;
        }
        stage;
        if (stage.mouseY < (600 / 3)) {
            y = (stage.mouseY + 12);
        } else {
            y = ((stage.mouseY - height) - 1);
        }
        if (y < 12) {
            y = 12;
        }
    }

    public function draw():void {
        this._vV_.color = this.background_;
        this._vV_.alpha = this.backgroundAlpha;
        this.outlineFill_.color = this.outlineColor;
        this.outlineFill_.alpha = this.outlineAlpha;
        graphics.clear();
        this.w_ = width;
        this.h_ = height;
        GraphicHelper._0L_6(this.path_);
        GraphicHelper.drawUI(-6, -6, (this.w_ + 12), (this.h_ + 12), 4, [1, 1, 1, 1], this.path_);
        graphics.drawGraphicsData(this.graphicsData_);
    }

}
}//package ToolTips

