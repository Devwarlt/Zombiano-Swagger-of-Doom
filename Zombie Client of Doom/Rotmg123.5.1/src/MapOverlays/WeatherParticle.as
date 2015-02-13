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
 * Created by Fabian on 20.11.2014.
 */
package MapOverlays {
import com.company.assembleegameclient.map._0D_v;

import flash.display.BitmapData;
import flash.display.GraphicsBitmapFill;
import flash.display.GraphicsEndFill;
import flash.display.GraphicsPath;
import flash.display.GraphicsPathCommand;
import flash.display.IGraphicsData;
import flash.geom.Matrix;

public class WeatherParticle {

    protected static const sqCommands:Vector.<int> = new <int>[GraphicsPathCommand.MOVE_TO, GraphicsPathCommand.LINE_TO, GraphicsPathCommand.LINE_TO, GraphicsPathCommand.LINE_TO];
    protected static const END_FILL:GraphicsEndFill = new GraphicsEndFill();

    public var x_:Number;
    public var y_:Number;
    public var x_spd:Number;
    public var y_spd:Number;
    public var scale_:Number;
    public var bitmap_:BitmapData;
    /*private*/
    internal var w_:Number;
    /*private*/
    internal var h_:Number;
    protected var bitmapFill_:GraphicsBitmapFill;
    protected var path_:GraphicsPath;

    public function WeatherParticle(_arg1:Number, _arg2:Number, _arg3:Number, _arg4:BitmapData):void {
        this.bitmapFill_ = new GraphicsBitmapFill(null, new Matrix(), false, false);
        this.path_ = new GraphicsPath(sqCommands, new Vector.<Number>());
        super();
        this.x_ = _arg1;
        this.y_ = _arg2;
        this.scale_ = _arg3;
        this.bitmap_ = _arg4;
        this.w_ = (this.bitmap_.width * this.scale_);
        this.h_ = (this.bitmap_.height * this.scale_);
    }

    public function draw(_arg1:Vector.<IGraphicsData>, _arg2:_0D_v, _arg3:int):void {

        var _local4:Number = ((this.x_ * Math.cos(-(_arg2.angleRad_))) - (this.y_ * Math.sin(-(_arg2.angleRad_))));
        var _local5:Number = ((this.x_ * Math.sin(-(_arg2.angleRad_))) + (this.y_ * Math.cos(-(_arg2.angleRad_))));
        var _local6:Matrix = this.bitmapFill_.matrix;
        _local6.identity();
        _local6.translate((-(this.bitmap_.width) / 2), (-(this.bitmap_.height) / 2));
        _local6.scale(this.scale_, this.scale_);
        _local6.translate(_local4, _local5);
        this.bitmapFill_.bitmapData = this.bitmap_;
        this.path_.data.length = 0;
        var _local7:Number = (_local4 - (this.w_ / 2));
        var _local8:Number = (_local5 - (this.h_ / 2));
        this.path_.data.push(_local7, _local8, (_local7 + this.w_), _local8, (_local7 + this.w_), (_local8 + this.h_), _local7, (_local8 + this.h_));
        _arg1.push(this.bitmapFill_);
        _arg1.push(this.path_);
        _arg1.push(END_FILL);
    }

}
}
