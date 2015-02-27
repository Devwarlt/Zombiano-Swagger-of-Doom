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
 * Created by Fabian on 19.11.2014.
 */
package MapOverlays.WeatherOverlays {
import MapOverlays.WeatherParticle;
import MapOverlays.Weather;

import _05R_.GTween;

import Effects.Particle;

import com.company.assembleegameclient.map._0D_v;
import com.company.util.AssetLibrary;
import com.company.util._kp;

import flash.display.IGraphicsData;

public class SnowWeather extends Weather {

    protected var graphicsData_:Vector.<IGraphicsData>;

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

    override public function draw(_arg1:_0D_v, _arg2:int):void {
        var _local3:WeatherParticle;
        this.graphicsData_.length = 0;
        for each (_local3 in this.particles_) {
            _local3.draw(this.graphicsData_, _arg1, _arg2);
        }
        graphics.clear();
        graphics.drawGraphicsData(this.graphicsData_);
    }

    private function addSnowStar():void {
        var _local1:_kp = AssetLibrary._18("stars");
        var _local2:WeatherParticle = new WeatherParticle(((Math.random() * 1000) - 500), ((Math.random() * 1000) - 500), (4 * (0.5 + (0.5 * Math.random()))), _local1._W_u[int((_local1._W_u.length * Math.random()))]);
        _local2.x_spd = (Math.random() * (1 - 0.5) + 0.5);
        _local2.y_spd = (Math.random() * (1 - 0.5) + 0.5);
        this.particles_.push(_local2);
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

    override public function get defaultParticles():int {
        return 100;
    }
}
}//package MapOverlays