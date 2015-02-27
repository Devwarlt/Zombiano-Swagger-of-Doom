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

//ServerPackets._S_M_

package ServerPackets {

import com.company.assembleegameclient.net.messages.data.Item;
import com.company.assembleegameclient.util._wW_;

import flash.utils.IDataInput;


public class _S_M_ extends ServerPacket {

    public var myItems_:Vector.<Item>;
    public var yourName_:String;
    public var yourItems_:Vector.<Item>;

    public function _S_M_(_arg1:uint) {
        this.myItems_ = new Vector.<Item>();
        this.yourItems_ = new Vector.<Item>();
        super(_arg1);
    }

    override public function parseFromInput(_arg1:IDataInput):void {
        var _local2:int;
        var _local3:int = _arg1.readShort();
        _local2 = _local3;
        while (_local2 < this.myItems_.length) {
            _wW_._ay(this.myItems_[_local2]);
            _local2++;
        }
        this.myItems_.length = Math.min(_local3, this.myItems_.length);
        while (this.myItems_.length < _local3) {
            this.myItems_.push((_wW_._B_1(Item) as Item));
        }
        _local2 = 0;
        while (_local2 < _local3) {
            this.myItems_[_local2].parseFromInput(_arg1);
            _local2++;
        }
        this.yourName_ = _arg1.readUTF();
        _local3 = _arg1.readShort();
        _local2 = _local3;
        while (_local2 < this.yourItems_.length) {
            _wW_._ay(this.yourItems_[_local2]);
            _local2++;
        }
        this.yourItems_.length = Math.min(_local3, this.yourItems_.length);
        while (this.yourItems_.length < _local3) {
            this.yourItems_.push((_wW_._B_1(Item) as Item));
        }
        _local2 = 0;
        while (_local2 < _local3) {
            this.yourItems_[_local2].parseFromInput(_arg1);
            _local2++;
        }
    }

    override public function toString():String {
        return (formatToString("TRADESTART", "myItems_", "yourName_", "yourItems_"));
    }

}
}//package ServerPackets

