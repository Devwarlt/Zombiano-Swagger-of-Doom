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

//_zD_._1k

package _zD_{
    import _C__._cM_;
    import _0L_C_._0G_y;

import _F_1.CurrentCharacterScreen;

import _U_5.CharListResetDispatcher;
    import _U_5.SpriteTarget;
    import flash.events.Event;

    public class _1k extends _cM_ {

        [Inject]
        public var view:_0G_y;
        [Inject]
        public var _0B_a:CharListResetDispatcher;
        [Inject]
        public var _0_b:SpriteTarget;

        override public function initialize():void{
            _b6(Event.COMPLETE, this.onComplete);
        }
        override public function destroy():void{
            _0E_K_(Event.COMPLETE, this.onComplete);
        }
        private function onComplete(_arg1:Event):void{
            this._0B_a.dispatch();
            this._0_b.dispatch(new CurrentCharacterScreen());
        }

    }
}//package _zD_

