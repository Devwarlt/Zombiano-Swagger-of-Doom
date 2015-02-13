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
package ServerPackets {
import flash.utils.IDataInput;

public class WeatherPropertiesPacket extends ServerPacket {

    public static const NONE:int = 255;
    public static const ADD_PARTICLES:int = 0;
    public static const REMOVE_PARTICLES:int = 1;
    public static const CHANGE_WEATHER:int = 2;
    public static const WIND_SPEED:int = 3;
    public static const PARTICLE_DIRECTION:int = 4;

    public var _type:int;
    public var _particles:int;
    public var _weather:int;
    public var _windSpeed:Vector.<Number>;
    public var _particleDirection:int; //<- = 0 ;; down = 1 ;; -> = 2
    public var _currentTime:int;
    public var _atmosphere:String;

    public function WeatherPropertiesPacket(_arg1:uint) {
        super(_arg1);
        _windSpeed = new Vector.<Number>();
    }

    override public function parseFromInput(_arg1:IDataInput):void {
        _type = _arg1.readUnsignedByte();
        _atmosphere = _arg1.readUTF();
        _particles = _arg1.readShort();
        _weather = _arg1.readUnsignedByte();
        _windSpeed.push(_arg1.readFloat(), _arg1.readFloat());
        _particleDirection = _arg1.readByte();
        _currentTime = _arg1.readInt();
    }
}
}
