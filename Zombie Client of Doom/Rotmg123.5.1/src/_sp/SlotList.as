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

//_sp._09K_

package _sp {
public final class SlotList {

    public static const NIL:SlotList = new SlotList(null, null);

    public var _G_W_:ISlot;
    public var _U_H_:SlotList;
    public var nonEmpty:Boolean = false;

    public function SlotList(_arg1:ISlot, _arg2:SlotList = null) {
        if (((!(_arg1)) && (!(_arg2)))) {
            if (NIL) {
                throw (new ArgumentError("Parameters head and tail are null. Use the NIL element instead."));
            }
            this.nonEmpty = false;
        } else {
            if (!_arg1) {
                throw (new ArgumentError("Parameter head cannot be null."));
            }
            this._G_W_ = _arg1;
            this._U_H_ = ((_arg2) || (NIL));
            this.nonEmpty = true;
        }
    }

    public function get length():uint {
        if (!this.nonEmpty) {
            return (0);
        }
        if (this._U_H_ == NIL) {
            return (1);
        }
        var _local1:uint;
        var _local2:SlotList = this;
        while (_local2.nonEmpty) {
            _local1++;
            _local2 = _local2._U_H_;
        }
        return (_local1);
    }

    public function prepend(_arg1:ISlot):SlotList {
        return (new SlotList(_arg1, this));
    }

    public function append(_arg1:ISlot):SlotList {
        if (!_arg1) {
            return (this);
        }
        if (!this.nonEmpty) {
            return (new SlotList(_arg1));
        }
        if (this._U_H_ == NIL) {
            return (new SlotList(_arg1).prepend(this._G_W_));
        }
        var _local2:SlotList = new SlotList(this._G_W_);
        var _local3:SlotList = _local2;
        var _local4:SlotList = this._U_H_;
        while (_local4.nonEmpty) {
            _local3 = (_local3._U_H_ = new SlotList(_local4._G_W_));
            _local4 = _local4._U_H_;
        }
        _local3._U_H_ = new SlotList(_arg1);
        return (_local2);
    }

    public function insertWithPriority(_arg1:ISlot):SlotList {
        if (!this.nonEmpty) {
            return (new SlotList(_arg1));
        }
        var _local2:int = _arg1.priority;
        if (_local2 > this._G_W_.priority) {
            return (this.prepend(_arg1));
        }
        var _local3:SlotList = new SlotList(this._G_W_);
        var _local4:SlotList = _local3;
        var _local5:SlotList = this._U_H_;
        while (_local5.nonEmpty) {
            if (_local2 > _local5._G_W_.priority) {
                _local4._U_H_ = _local5.prepend(_arg1);
                return (_local3);
            }
            _local4 = (_local4._U_H_ = new SlotList(_local5._G_W_));
            _local5 = _local5._U_H_;
        }
        _local4._U_H_ = new SlotList(_arg1);
        return (_local3);
    }

    public function _Y_f(_arg1:Function):SlotList {
        if (((!(this.nonEmpty)) || ((_arg1 == null)))) {
            return (this);
        }
        if (_arg1 == this._G_W_.listener) {
            return (this._U_H_);
        }
        var _local2:SlotList = new SlotList(this._G_W_);
        var _local3:SlotList = _local2;
        var _local4:SlotList = this._U_H_;
        while (_local4.nonEmpty) {
            if (_local4._G_W_.listener == _arg1) {
                _local3._U_H_ = _local4._U_H_;
                return (_local2);
            }
            _local3 = (_local3._U_H_ = new SlotList(_local4._G_W_));
            _local4 = _local4._U_H_;
        }
        return (this);
    }

    public function contains(_arg1:Function):Boolean {
        if (!this.nonEmpty) {
            return (false);
        }
        var _local2:SlotList = this;
        while (_local2.nonEmpty) {
            if (_local2._G_W_.listener == _arg1) {
                return (true);
            }
            _local2 = _local2._U_H_;
        }
        return (false);
    }

    public function find(_arg1:Function):ISlot {
        if (!this.nonEmpty) {
            return (null);
        }
        var _local2:SlotList = this;
        while (_local2.nonEmpty) {
            if (_local2._G_W_.listener == _arg1) {
                return (_local2._G_W_);
            }
            _local2 = _local2._U_H_;
        }
        return (null);
    }

    public function toString():String {
        var _local1 = "";
        var _local2:SlotList = this;
        while (_local2.nonEmpty) {
            _local1 = (_local1 + (_local2._G_W_ + " -> "));
            _local2 = _local2._U_H_;
        }
        _local1 = (_local1 + "NIL");
        return ((("[List " + _local1) + "]"));
    }

}
}//package _sp

