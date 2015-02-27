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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// either expressed or implied, of the FreeBSD Project.// either expressed or implied, of the FreeBSD Project.

/**
 * Created by Fabian on 02.12.2014.
 */
package Sounds {
import _05R_.GTween;

import com.company.assembleegameclient.parameters.Parameters;

import flash.media.Sound;
import flash.media.SoundChannel;
import flash.media.SoundTransform;
import flash.net.URLRequest;

public class WeatherSoundManager {

    private var currentSoundChannel:SoundChannel = null;
    private var currentSoundTransform:SoundTransform = null;

    public function load(music:String):void {
        var currentSound:Sound = new Sound();
        var req:URLRequest = new URLRequest((("http://" + Parameters.musicUrl_) + "/sfx/weather/" + music + ".mp3"));
        req.userAgent = "GameClient";
        currentSound.load(req);
        currentSoundTransform = new SoundTransform(0);
        currentSoundChannel = currentSound.play(0, int.MAX_VALUE, currentSoundTransform);
        var tween:GTween = new GTween(this.currentSoundTransform, 5, {"volume": 1.0});
        tween._bR_ = update;
    }

    public function stop():void {
        var tween:GTween = new GTween(this.currentSoundTransform, 10, {"volume": 0});
        tween._bR_ = update;
        tween.onComplete = finalStop;
    }

    private function update(tween:GTween):void {
        currentSoundChannel.soundTransform = currentSoundTransform;
    }

    private function finalStop(tween:GTween):void {
        currentSoundChannel.stop();
    }
}
}