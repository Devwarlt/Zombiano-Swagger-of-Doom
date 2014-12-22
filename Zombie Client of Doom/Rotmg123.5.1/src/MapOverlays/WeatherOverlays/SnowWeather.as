/**
 * Created by Fabian on 19.11.2014.
 */
package MapOverlays.WeatherOverlays {
import MapOverlays.Weather;
import MapOverlays.WeatherParticle;

import com.company.assembleegameclient.map._0D_v;
import com.company.util.AssetLibrary;
import com.company.util._kp;

import flash.display.IGraphicsData;

public class SnowWeather extends Weather {

    public function SnowWeather(_arg1:Boolean) {
        this.graphicsData_ = new Vector.<IGraphicsData>();
        super();
        if (_arg1) {
            var _local1:int;
            while (_local1 < defaultParticles) {
                this.addSnowStar();
                _local1++;
            }
        }
    }
    protected var graphicsData_:Vector.<IGraphicsData>;

    override public function get defaultParticles():int {
        return 100;
    }

    override public function draw(_arg1:_0D_v, _arg2:int):void {
        var _local3:WeatherParticle;
        this.graphicsData_.length = 0;
        for each (_local3 in this.particles_) {
            _local3.draw(this.graphicsData_, _arg1, _arg2);
        }
        graphics.clear();
        graphics.drawGraphicsData(this.graphicsData_);
    }

    override public function update():void {
        var _local1:WeatherParticle;
        for each (_local1 in this.particles_) {
            _local1.x_ += _local1.x_spd + (Math.random() * (0.5 + (-1)));
            _local1.y_ += _local1.y_spd + (Math.random() * (0.5 + (-1)));

            if (_local1.x_ > 500) _local1.x_ -= 1000;
            if (_local1.y_ > 500) _local1.y_ -= 1000;
        }
    }

    override public function addParticle():void {
        this.addSnowStar();
    }

    private function addSnowStar():void {
        var _local1:_kp = AssetLibrary._18("stars");
        var _local2:WeatherParticle = new WeatherParticle(((Math.random() * 1000) - 500), ((Math.random() * 1000) - 500), (4 * (0.5 + (0.5 * Math.random()))), _local1._W_u[int((_local1._W_u.length * Math.random()))]);
        _local2.x_spd = (Math.random() * (1 - 0.5) + 0.5);
        _local2.y_spd = (Math.random() * (1 - 0.5) + 0.5);
        this.particles_.push(_local2);
    }
}
}//package MapOverlays