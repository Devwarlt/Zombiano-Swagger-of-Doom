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
    public var x_:Number;
    public var y_:Number;
    public var x_spd:Number;
    public var y_spd:Number;
    public var scale_:Number;
    /*private*/
    public var bitmap_:BitmapData;
    /*private*/
    protected var bitmapFill_:GraphicsBitmapFill;
    protected var path_:GraphicsPath;
    internal var w_:Number;
    internal var h_:Number;

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
