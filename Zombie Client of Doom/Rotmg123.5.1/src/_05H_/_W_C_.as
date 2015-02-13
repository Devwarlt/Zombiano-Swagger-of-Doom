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

//_05H_._W_C_

package _05H_{
    public class _W_C_ extends _U_y {

        override protected function compareSlots(itemXML:XML, curItemXML:XML):void{
            var result:XMLList;
            var otherResult:XMLList;
            var damage:int;
            var otherDamage:int;
            var textColor:String;
            var targets:int;
            var otherTargets:int;
            var condition:String;
            var duration:Number;
            var compositeStr:String;
            var htmlStr:String;
            result = itemXML.Activate.(text() == "Lightning");
            otherResult = curItemXML.Activate.(text() == "Lightning");
            _t4 = "";
            if ((((result.length() == 1)) && ((otherResult.length() == 1))))
            {
                damage = int(result[0].@totalDamage);
                otherDamage = int(otherResult[0].@totalDamage);
                textColor = _qy((damage - otherDamage));
                targets = int(result[0].@maxTargets);
                otherTargets = int(otherResult[0].@maxTargets);
                _t4 = (_t4 + ("Lightning: " + _qF_((((damage + " to ") + targets) + " targets\n"), _qy((damage - otherDamage)))));
                _5n[result[0].toXMLString()] = true;
            }
            if (itemXML.Activate.@condEffect)
            {
                condition = itemXML.Activate.@condEffect;
                duration = itemXML.Activate.@condDuration;
                compositeStr = ((((" " + condition) + " for ") + duration) + " secs\n");
                htmlStr = ("Shot Effect:\n" + _qF_(compositeStr, _iF_));
                _t4 = (_t4 + htmlStr);
            }
        }

    }
}//package _05H_

