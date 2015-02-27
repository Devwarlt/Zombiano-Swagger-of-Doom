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
import Sounds.WeatherSoundManager;

import flash.events.Event;
import flash.media.SoundChannel;

public class Weather extends MapOverlay {

    public var particles_:Vector.<WeatherParticle>;
    public var weatherSound:WeatherSoundManager;

    public function Weather() {
        particles_ = new Vector.<WeatherParticle>();
        this.addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }

    //Todo: Implement this (too lazy atm) :3
    public function changeWind(_arg1:Number, _arg2:Number):void {
    }

    public function addParticle():void {
    }

    public function removeParticle():void {
        particles_.shift();
    }

    public function set particlesAmount(newAmount:int):void {
        var i = 0;
        var l = newAmount - particles_.length;

        if (l < 0) {
            while (i > l) {
                removeParticle();
                i--;
            }
        }
        else {
            while (i < l) {
                addParticle();
                i++;
            }
        }
    }

    public function get particlesAmount():int {
        return particles_.length;
    }

    public function get defaultParticles():int {
        return 0;
    }

    public function onRemovedFromStage(event:Event):void {
        if (this.weatherSound != null) {
            this.weatherSound.stop();
        }
    }
}
}
