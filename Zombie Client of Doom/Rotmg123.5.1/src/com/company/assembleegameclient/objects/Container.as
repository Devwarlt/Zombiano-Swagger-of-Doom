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

//com.company.assembleegameclient.objects.Container

package com.company.assembleegameclient.objects{
import Panels.OpenChestPanel;

import com.company.util.PointUtil;
    import Sounds.UrlSoundEffects;
    import com.company.assembleegameclient.map._X_l;
    import Panels._sc;
    import com.company.assembleegameclient.game.GameSprite;
    import Panels.Panel;

    public class Container extends GameObject implements IPanelProvider {

        public var _G_B_:Boolean;
        public var ownerId_:int;

        public function Container(_arg1:XML){
            super(_arg1);
            this._G_B_ = _arg1.hasOwnProperty("Loot");
            this.ownerId_ = -1;
        }
        public function _75(_arg1:int):void{
            this.ownerId_ = _arg1;
            this.providesPanel_ = this.ownerId_ < 0 || this._X_w();
        }
        public function _X_w():Boolean{
            return ((map_.player_.accountId_ == this.ownerId_));
        }
        override public function addTo(_arg1:_X_l, _arg2:Number, _arg3:Number):Boolean{
            if (!super.addTo(_arg1, _arg2, _arg3))
            {
                return (false);
            }
            if (map_.player_ == null)
            {
                return (true);
            }
            var _local4:Number = PointUtil._R_O_(map_.player_.x_, map_.player_.y_, _arg2, _arg3);
            if (((this._G_B_) && ((_local4 < 10))))
            {
                UrlSoundEffects.play("loot_appears");
            }
            return (true);
        }
        public function GetPanel(_arg1:GameSprite):Panel{
            if(this._G_B_ || (_arg1.map_.player_ != null && _arg1.map_.player_.skinId_ == 0x0342)) {
                return (new _sc(_arg1, this));
            }
            else {
                return (new OpenChestPanel(_arg1, this));
            }
        }

    }
}//package com.company.assembleegameclient.objects

