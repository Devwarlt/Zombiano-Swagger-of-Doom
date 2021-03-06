﻿// Copyright (c) 2015, FireBite/Aceticsoft Studios Inc.
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

//_lW_._C_T_

package _lW_ {
import _0_p.IExtension;

import _03T_._078;

import _0_p.IContext;

import flash.display.DisplayObjectContainer;

import _0_p._Q_5;

import _g3.instanceOfType;

import flash.events.Event;

public class _C_T_ implements IExtension {

    private const _ul:String = _078.create(_C_T_);

    private var _rA_:IContext;
    private var _sz:DisplayObjectContainer;
    private var _eo:_Q_5;

    public function extend(_arg1:IContext):void {
        this._rA_ = _arg1;
        this._eo = _arg1._0H_4(this);
        this._rA_._ty(instanceOfType(DisplayObjectContainer), this._uI_);
    }

    public function toString():String {
        return (this._ul);
    }

    private function _uI_(_arg1:DisplayObjectContainer):void {
        if (this._sz) {
            this._eo._0E_Q_("A contextView has already been set, ignoring {0}", [_arg1]);
            return;
        }
        this._sz = _arg1;
        if (this._sz.stage) {
            this._sA_();
        } else {
            this._eo.debug("Context view is not yet on stage. Waiting...");
            this._sz.addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        }
    }

    private function onAddedToStage(_arg1:Event):void {
        this._sz.removeEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        this._sA_();
    }

    private function _sA_():void {
        this._eo.debug("Context view is now on stage. Initializing context...");
        this._rA_._iL_.initialize();
        this._sz.addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }

    private function onRemovedFromStage(_arg1:Event):void {
        this._eo.debug("Context view has left the stage. Destroying context...");
        this._sz.removeEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
        this._rA_._iL_.destroy();
    }

}
}//package _lW_

