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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// either expressed or implied, of the FreeBSD Project.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_C__._cM_

package _C__ {
import _A_G_.IMediator;

import _0H_p.IEventMap;

import flash.events.IEventDispatcher;
import flash.events.Event;

public class Mediator implements IMediator {

    [Inject]
    public var eventMap:IEventMap;
    [Inject]
    public var eventDispatcher:IEventDispatcher;
    private var _viewComponent:Object;

    public function set viewComponent(_arg1:Object):void {
        this._viewComponent = _arg1;
    }

    public function initialize():void {
    }

    public function destroy():void {
        this.eventMap.unmapListeners();
    }

    protected function addViewListener(_arg1:String, _arg2:Function, _arg3:Class = null):void {
        this.eventMap._08r(IEventDispatcher(this._viewComponent), _arg1, _arg2, _arg3);
    }

    protected function addContextListener(_arg1:String, _arg2:Function, _arg3:Class = null):void {
        this.eventMap._08r(this.eventDispatcher, _arg1, _arg2, _arg3);
    }

    protected function removeViewListener(_arg1:String, _arg2:Function, _arg3:Class = null):void {
        this.eventMap._0M_v(IEventDispatcher(this._viewComponent), _arg1, _arg2, _arg3);
    }

    protected function removeContextListener(_arg1:String, _arg2:Function, _arg3:Class = null):void {
        this.eventMap._0M_v(this.eventDispatcher, _arg1, _arg2, _arg3);
    }

    protected function dispatch(_arg1:Event):void {
        if (this.eventDispatcher.hasEventListener(_arg1.type)) {
            this.eventDispatcher.dispatchEvent(_arg1);
        }
    }

}
}//package _C__

