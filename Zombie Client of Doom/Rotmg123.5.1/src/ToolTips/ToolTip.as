// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ToolTips._for_

package ToolTips{
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
        public var _R_A_:int;
        public var _D_f:int;
        private var _vV_:GraphicsSolidFill;
        private var outlineFill_:GraphicsSolidFill;
        private var _0y:GraphicsStroke;
        private var path_:GraphicsPath;

        public function ToolTip(backgroundColor:uint, backgroundAlpha:Number, outlineColor:uint, outlineAlpha:Number, updatePosition:Boolean=true){
            this._vV_ = new GraphicsSolidFill(0, 1);
            this.outlineFill_ = new GraphicsSolidFill(0xFFFFFF, 1);
            this._0y = new GraphicsStroke(1, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3, this.outlineFill_);
            this.path_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
			this.graphicsData_ = new <IGraphicsData>[_0y, _vV_, path_, GraphicHelper.END_FILL, GraphicHelper._H_B_];
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
        private function onAddedToStage(_arg1:Event):void{
            this.draw();
            if (this.updatePosition)
            {
                this.position();
                addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
            }
        }
        private function onRemovedFromStage(_arg1:Event):void{
            if (this.updatePosition)
            {
                removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
            }
        }
        private function onEnterFrame(_arg1:Event):void{
            this.position();
        }
        private function position():void{
            if (stage == null)
            {
                return;
            }
            stage;
            if (stage.mouseX < (800 / 2))
            {
                x = (stage.mouseX + 12);
            } else
            {
                x = ((stage.mouseX - width) - 1);
            }
            if (x < 12)
            {
                x = 12;
            }
            stage;
            if (stage.mouseY < (600 / 3))
            {
                y = (stage.mouseY + 12);
            } else
            {
                y = ((stage.mouseY - height) - 1);
            }
            if (y < 12)
            {
                y = 12;
            }
        }
        public function draw():void{
            this._vV_.color = this.background_;
            this._vV_.alpha = this.backgroundAlpha;
            this.outlineFill_.color = this.outlineColor;
            this.outlineFill_.alpha = this.outlineAlpha;
            graphics.clear();
            this._R_A_ = width;
            this._D_f = height;
            GraphicHelper._0L_6(this.path_);
            GraphicHelper.drawUI(-6, -6, (this._R_A_ + 12), (this._D_f + 12), 4, [1, 1, 1, 1], this.path_);
            graphics.drawGraphicsData(this.graphicsData_);
        }

    }
}//package ToolTips

