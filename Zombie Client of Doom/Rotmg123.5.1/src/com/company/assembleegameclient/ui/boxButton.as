﻿// Copyright (c) 2015, FireBite/Aceticsoft Studios Inc.
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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// either expressed or implied, of the FreeBSD Project.// either expressed or implied, of the FreeBSD Project.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.ui.boxButton

package com.company.assembleegameclient.ui{
    import flash.display.Sprite;

    import flash.display.IGraphicsData;
    import com.company.util.GraphicHelper;
    import com.company.ui.SimpleText;
    import flash.display.GraphicsSolidFill;
    import flash.display.GraphicsPath;
    import flash.events.MouseEvent;

public class boxButton {

}

    //public class boxButton extends Sprite {
//
    //    private var graphicsData_:Vector.<IGraphicsData>;
//
    //    public var text_:SimpleText;
    //    public var w_:int;
    //    private var _pL_:GraphicsSolidFill;
    //    private var _f1:GraphicsSolidFill;
    //    private var path_:GraphicsPath;
//
    //    public function boxButton(_arg1:int, _arg2:String, _arg3:int=0){
    //        this._pL_ = new GraphicsSolidFill(0xFFFFFF, 1);
    //        this._f1 = new GraphicsSolidFill(0x7F7F7F, 1);
    //        this.path_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>());
	//		this.graphicsData_ = new <IGraphicsData>[_pL_, path_, GraphicHelper.END_FILL];
    //        super();
    //        this.text_ = new SimpleText(_arg1, 0x363636, false, 0, 0, "Myriad Pro");
    //        this.text_.boldText(true);
    //        this.text_.text = _arg2;
    //        this.text_.updateMetrics();
    //        addChild(this.text_);
    //        this.w_ = (((_arg3)!=0) ? _arg3 : (this.text_.width + 12));
    //        GraphicHelper._0L_6(this.path_);
    //        GraphicHelper.drawUI(0, 0, this.w_, (this.text_.textHeight + 8), 4, [1, 1, 1, 1], this.path_);
    //        this.draw();
    //        this.text_.x = (((this.w_ / 2) - (this.text_.textWidth / 2)) - 2);
    //        this.text_.y = 1;
    //        addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
    //        addEventListener(MouseEvent.ROLL_OUT, this.onRollOut);
    //    }
    //    public function _02C_(_arg1:String):void{
    //        this.text_.text = _arg1;
    //        this.text_.updateMetrics();
    //        this.text_.x = (((this.w_ / 2) - (this.text_.textWidth / 2)) - 2);
    //        this.text_.y = 1;
    //    }
    //    public function _A_w(_arg1:Boolean):void{
    //        if (_arg1 == mouseEnabled)
    //        {
    //            return;
    //        }
    //        mouseEnabled = _arg1;
    //        this.graphicsData_[0] = ((_arg1) ? this._pL_ : this._f1);
    //        this.draw();
    //    }
    //    private function onMouseOver(_arg1:MouseEvent):void{
    //        this._pL_.color = 16768133;
    //        this.draw();
    //    }
    //    private function onRollOut(_arg1:MouseEvent):void{
    //        this._pL_.color = 0xFFFFFF;
    //        this.draw();
    //    }
    //    private function draw():void{
    //        graphics.clear();
    //        graphics.drawGraphicsData(this.graphicsData_);
    //    }
//
    //}
}//package com.company.assembleegameclient.ui

