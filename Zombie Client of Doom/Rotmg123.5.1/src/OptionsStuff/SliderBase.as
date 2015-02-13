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
 * Created by Fabian on 14.12.2014.
 */
package OptionsStuff {
import com.company.assembleegameclient.ui._return;
import com.company.ui.SimpleText;
import com.company.util.GraphicHelper;

import flash.display.CapsStyle;
import flash.display.GraphicsPath;
import flash.display.GraphicsSolidFill;
import flash.display.GraphicsStroke;
import flash.display.IGraphicsData;
import flash.display.JointStyle;
import flash.display.LineScaleMode;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
import flash.geom.Rectangle;

public class SliderBase extends Sprite {
    public static const WIDTH:int = 80;
    public static const HEIGHT:int = 32;

    private var graphicsData_:Vector.<IGraphicsData>;

    public var maximumValue:int;
    public var val:int = -1;
    private var over_:Boolean = false;
    private var internalFill_:GraphicsSolidFill;
    private var _pq:GraphicsSolidFill;
    private var _uN_:GraphicsSolidFill;
    private var path_:GraphicsPath;
    private var _0y:GraphicsStroke;

    private var sliderKnob:Sprite;
    private var sliderLine:_return;
    private var valueText:SimpleText;

    public function SliderBase(value:int, maxVal:int = 100) {
        this.internalFill_ = new GraphicsSolidFill(0x6B472E, 1);
        this._pq = new GraphicsSolidFill(0x63432E, 1);
        this._uN_ = new GraphicsSolidFill(0x73543F, 1);
        this.path_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
        this._0y = new GraphicsStroke(2, false, LineScaleMode.NORMAL, CapsStyle.NONE, JointStyle.ROUND, 3, this._uN_);
        this.graphicsData_ = new <IGraphicsData>[internalFill_, _0y, path_, GraphicHelper._H_B_, GraphicHelper.END_FILL];
        super();
        this.maximumValue = maxVal;

        this.sliderLine = new _return(WIDTH - 10, 0x4D000F);
        this.sliderLine.x = 5;
        this.sliderLine.y = 10;
        this.addChild(this.sliderLine);

        this.sliderKnob = new Sprite();
        this.sliderKnob.graphics.beginFill(0x919191, 1.0);
        this.sliderKnob.graphics.drawCircle(0, 0, 5);
        this.sliderKnob.graphics.endFill();
        this.sliderKnob.x = 5;
        this.sliderKnob.y = 10;
        this.addChild(this.sliderKnob);

        this.valueText = new SimpleText(16, 0xFFFFFF);
        this.valueText.filters = [new DropShadowFilter(0, 0, 0, 1, 4, 4, 2)];
        addChild(this.valueText);

        this.setValue(value);
        this.updateDraw();
        this.sliderKnob.addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
        this.sliderKnob.addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
        this.sliderKnob.addEventListener(MouseEvent.MOUSE_DOWN, this.onMouseDown);
        this.sliderKnob.addEventListener(MouseEvent.MOUSE_UP, this.onMouseUp);
        this.sliderKnob.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        this.addEventListener(MouseEvent.ROLL_OUT, this.onGlobalRollOut);
        this.addEventListener(MouseEvent.MOUSE_UP, this.onMouseUp);

        GraphicHelper._0L_6(this.path_);
        GraphicHelper.drawUI(0, 0, WIDTH, HEIGHT, 4, [1, 1, 1, 1], this.path_);
        this._0y.fill = (this._uN_);
        graphics.drawGraphicsData(this.graphicsData_);
    }
    public function setValue(val:int, updateKnob:Boolean = true):void {
        this.val = val;
        if(updateKnob) {
            this.sliderKnob.x = (val / (maximumValue / (WIDTH - 10))) + 5;
        }
        this.setValueText();
        dispatchEvent(new Event(Event.CHANGE));
    }
    public function get value():int {
        return ((this.sliderKnob.x - 5) * (maximumValue / (WIDTH - 10)));
    }
    private function onMouseOver(_arg1:MouseEvent):void{
        this.over_ = true;
        this.updateDraw();
    }

    private function onMouseDown(event:MouseEvent):void {
        this.sliderKnob.startDrag(false, new Rectangle(5, 10, WIDTH - 10, 0));
    }

    private function onMouseUp(event:MouseEvent):void {
        this.sliderKnob.stopDrag();
    }

    private function onRollOut(_arg1:MouseEvent):void {
        this.sliderKnob.removeEventListener(MouseEvent.MOUSE_DOWN, onMouseUp);
        this.over_ = false;
        this.updateDraw();
    }

    private function onGlobalRollOut(_arg1:MouseEvent):void {
        this.sliderKnob.removeEventListener(MouseEvent.MOUSE_DOWN, onMouseUp);
        this.sliderKnob.stopDrag();
        this.over_ = false;
        this.updateDraw();
    }

    private function updateDraw():void{
        this.sliderKnob.graphics.clear();
        this.sliderKnob.graphics.beginFill(this.over_ ? 0xF2FF00 : 0x919191, 1.0);
        this.sliderKnob.graphics.drawCircle(0, 0, 5);
        this.sliderKnob.graphics.endFill();
    }

    private function onEnterFrame(event:Event):void {
        if(this.val != this.value) {
            setValue(this.value, false);
        }
    }

    private function setValueText():void {
        this.valueText.text = this.val.toString();
        this.valueText.updateMetrics();
        this.valueText.x = (WIDTH / 2) - (this.valueText.textWidth / 2);
        this.valueText.y = 12.5;
    }
}
}