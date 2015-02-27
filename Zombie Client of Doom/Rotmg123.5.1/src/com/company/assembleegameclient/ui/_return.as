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

//com.company.assembleegameclient.ui._return

package com.company.assembleegameclient.ui {
import com.company.util.GraphicHelper;

import flash.display.GraphicsPath;
import flash.display.GraphicsPathWinding;
import flash.display.GraphicsSolidFill;
import flash.display.IGraphicsData;
import flash.display.Shape;


public class _return extends Shape {

    private var _A_f:Vector.<IGraphicsData>;

    private var _7H_:GraphicsSolidFill;
    private var _nM_:GraphicsPath;

    public function _return(_arg1:int, _arg2:uint, _vertical:Boolean = false) {
        this._7H_ = new GraphicsSolidFill(0xFFFFFF, 1);
        this._nM_ = new GraphicsPath(new Vector.<int>(), new Vector.<Number>(), GraphicsPathWinding.NON_ZERO);
        this._A_f = new <IGraphicsData>[_7H_, _nM_, GraphicHelper.END_FILL];
        super();
        if (!_vertical)
            this._rs(_arg1, _arg2);
        else
            this.drawVert(_arg1, _arg2);
    }

    public function _rs(_arg1:int, _arg2:uint):void {
        graphics.clear();
        this._7H_.color = _arg2;
        GraphicHelper._0L_6(this._nM_);
        GraphicHelper.drawSpacer(0, 0, 4, this._nM_);
        GraphicHelper.drawSpacer(_arg1, 0, 4, this._nM_);
        GraphicHelper.drawRect(0, -1, _arg1, 2, this._nM_);
        graphics.drawGraphicsData(this._A_f);
    }

    public function drawVert(_arg1:int, _arg2:uint):void {
        graphics.clear();
        this._7H_.color = _arg2;
        GraphicHelper._0L_6(this._nM_);
        GraphicHelper.drawSpacer(0, 0, 4, this._nM_);
        GraphicHelper.drawSpacer(0, _arg1, 4, this._nM_);
        GraphicHelper.drawRect(-1, 0, 2, _arg1, this._nM_);
        graphics.drawGraphicsData(this._A_f);
    }
}
}//package com.company.assembleegameclient.ui

