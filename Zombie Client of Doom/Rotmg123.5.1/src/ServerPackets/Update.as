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

//ServerPackets.Update

package ServerPackets {

import com.company.assembleegameclient.net.messages.data._iZ_;
import com.company.assembleegameclient.net.messages.data.ObjectStatus;
import com.company.assembleegameclient.util._wW_;

import flash.utils.IDataInput;


public class Update extends ServerPacket {

    public var tiles_:Vector.<_iZ_>;
    public var newObjs_:Vector.<ObjectStatus>;
    public var drops_:Vector.<int>;

    public function Update(_arg1:uint) {
        this.tiles_ = new Vector.<_iZ_>();
        this.newObjs_ = new Vector.<ObjectStatus>();
        this.drops_ = new Vector.<int>();
        super(_arg1);
    }

    override public function parseFromInput(_arg1:IDataInput):void {
        var _local2:int;
        var _local3:int = _arg1.readShort();
        _local2 = _local3;
        while (_local2 < this.tiles_.length) {
            _wW_._ay(this.tiles_[_local2]);
            _local2++;
        }
        this.tiles_.length = Math.min(_local3, this.tiles_.length);
        while (this.tiles_.length < _local3) {
            this.tiles_.push((_wW_._B_1(_iZ_) as _iZ_));
        }
        _local2 = 0;
        while (_local2 < _local3) {
            this.tiles_[_local2].parseFromInput(_arg1);
            _local2++;
        }
        this.newObjs_.length = 0;
        _local3 = _arg1.readShort();
        _local2 = _local3;
        while (_local2 < this.newObjs_.length) {
            _wW_._ay(this.newObjs_[_local2]);
            _local2++;
        }
        this.newObjs_.length = Math.min(_local3, this.newObjs_.length);
        while (this.newObjs_.length < _local3) {
            this.newObjs_.push((_wW_._B_1(ObjectStatus) as ObjectStatus));
        }
        _local2 = 0;
        while (_local2 < _local3) {
            this.newObjs_[_local2].parseFromInput(_arg1);
            _local2++;
        }
        this.drops_.length = 0;
        var _local4:int = _arg1.readShort();
        _local2 = 0;
        while (_local2 < _local4) {
            this.drops_.push(_arg1.readInt());
            _local2++;
        }
    }

    override public function toString():String {
        return (formatToString("UPDATE", "tiles_", "newObjs_", "drops_"));
    }

}
}//package ServerPackets

