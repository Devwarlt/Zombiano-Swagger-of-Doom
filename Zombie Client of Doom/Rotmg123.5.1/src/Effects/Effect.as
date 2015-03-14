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

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//Effects._I_b

package Effects {
import com.company.assembleegameclient.objects.GameObject;

import flash.display.IGraphicsData;

import com.company.assembleegameclient.map._0D_v;

public class Effect extends GameObject {

    public function Effect() {
        super(null);
        objectId_ = _7y();
        _P_m = false;
    }

    public static function resolve(_arg1:_D_J_, _arg2:GameObject):Effect {
        switch (_arg1.id) {
            case "Healing":
                return (new HealingEffect(_arg2));
            case "Fountain":
                return (new FountainEffect(_arg2));
            case "Gas":
                return (new GasEffect(_arg2, _arg1));
            case "Vent":
                return (new VentEffect(_arg2));
            case "Bubbles":
                return (new BubbleEffect(_arg2, _arg1));
            case "XMLEffect":
                return (new XMLEffect(_arg2, _arg1));
            case "CustomParticles":
                return (ParticleEffect.create(_arg1, _arg2));
            case "CloudParticles":
                var eff:ParticleEffect = ParticleEffect.create(_arg1, _arg2);
                eff.cloud_ = true;
                return eff;
            case "Orbiting":
                return OrbitEffect.createEffect(_arg1, _arg2);
            case "RainbowParticles":
                return new RainbowEffect(_arg2);
        }
        return (null);
    }

    override public function update(_arg1:int, _arg2:int):Boolean {
        return (false);
    }

    override public function draw(_arg1:Vector.<IGraphicsData>, _arg2:_0D_v, _arg3:int):void {
    }

}
}//package Effects

