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

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.objects.Portal

package com.company.assembleegameclient.objects{

    import flash.display.IGraphicsData;
    import com.company.assembleegameclient.map._0D_v;
    import Panels.PortalPanel;
    import com.company.assembleegameclient.game.GameSprite;
    import Panels.Panel;

    public class Portal extends GameObject implements IPanelProvider {

        public var _0J_A_:Boolean;
        public var _xq:Boolean;
        public var _09S_:Boolean = true;

        public function Portal(_arg1:XML){
            super(_arg1);
            this._0J_A_ = _arg1.hasOwnProperty("NexusPortal");
            this._xq = _arg1.hasOwnProperty("LockedPortal");
        }
        override public function draw(_arg1:Vector.<IGraphicsData>, _arg2:_0D_v, _arg3:int):void{
            super.draw(_arg1, _arg2, _arg3);
            if (this._0J_A_)
            {
                _oL_(_arg1, _arg2);
            }
        }
        public function GetPanel(_arg1:GameSprite):Panel{
            return (new PortalPanel(_arg1, this));
        }

    }
}//package com.company.assembleegameclient.objects

