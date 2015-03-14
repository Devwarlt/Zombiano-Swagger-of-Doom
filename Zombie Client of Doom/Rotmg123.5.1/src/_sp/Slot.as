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
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// either expressed or implied, of the FreeBSD Project.// either expressed or implied, of the FreeBSD Project.

// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_sp.Slot

package _sp {
public class Slot implements ISlot {

    protected var _signal:IOnceSignal;
    protected var _Q_n:Boolean = true;
    protected var _0M_e:Function;
    protected var _once:Boolean = false;
    protected var _07M_:int = 0;
    protected var _51:Array;

    public function Slot(_arg1:Function, _arg2:IOnceSignal, _arg3:Boolean = false, _arg4:int = 0) {
        this._0M_e = _arg1;
        this._once = _arg3;
        this._signal = _arg2;
        this._07M_ = _arg4;
        this._0I_Y_(_arg1);
    }

    public function execute0():void {
        if (!this._Q_n) {
            return;
        }
        if (this._once) {
            this.remove();
        }
        if (((this._51) && (this._51.length))) {
            this._0M_e.apply(null, this._51);
            return;
        }
        this._0M_e();
    }

    public function execute1(_arg1:Object):void {
        if (!this._Q_n) {
            return;
        }
        if (this._once) {
            this.remove();
        }
        if (((this._51) && (this._51.length))) {
            this._0M_e.apply(null, [_arg1].concat(this._51));
            return;
        }
        this._0M_e(_arg1);
    }

    public function execute(_arg1:Array):void {
        if (!this._Q_n) {
            return;
        }
        if (this._once) {
            this.remove();
        }
        if (((this._51) && (this._51.length))) {
            _arg1 = _arg1.concat(this._51);
        }
        var _local2:int = _arg1.length;
        if (_local2 == 0) {
            this._0M_e();
        } else {
            if (_local2 == 1) {
                this._0M_e(_arg1[0]);
            } else {
                if (_local2 == 2) {
                    this._0M_e(_arg1[0], _arg1[1]);
                } else {
                    if (_local2 == 3) {
                        this._0M_e(_arg1[0], _arg1[1], _arg1[2]);
                    } else {
                        this._0M_e.apply(null, _arg1);
                    }
                }
            }
        }
    }

    public function get listener():Function {
        return (this._0M_e);
    }

    public function set listener(_arg1:Function):void {
        if (null == _arg1) {
            throw (new ArgumentError("Given listener is null.\nDid you want to set enabled to false instead?"));
        }
        this._0I_Y_(_arg1);
        this._0M_e = _arg1;
    }

    public function get once():Boolean {
        return (this._once);
    }

    public function get priority():int {
        return (this._07M_);
    }

    public function toString():String {
        return ((((((((("[Slot listener: " + this._0M_e) + ", once: ") + this._once) + ", priority: ") + this._07M_) + ", enabled: ") + this._Q_n) + "]"));
    }

    public function get _rR_():Boolean {
        return (this._Q_n);
    }

    public function set _rR_(_arg1:Boolean):void {
        this._Q_n = _arg1;
    }

    public function get _5g():Array {
        return (this._51);
    }

    public function set _5g(_arg1:Array):void {
        this._51 = _arg1;
    }

    public function remove():void {
        this._signal.remove(this._0M_e);
    }

    protected function _0I_Y_(_arg1:Function):void {
        if (null == _arg1) {
            throw (new ArgumentError("Given listener is null."));
        }
        if (null == this._signal) {
            throw (new Error("Internal signal reference has not been set yet."));
        }
    }

}
}//package _sp

