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

//ServerPackets._0_l

package ServerPackets{
    import com.company.assembleegameclient.net.messages.data.ObjectStatusData;
    import com.company.assembleegameclient.util._wW_;
    import flash.utils.IDataInput;

    public class _0_l extends ServerPacket {

        public var tickId_:int;
        public var tickTime_:int;
        public var dateTime_:int;
        public var statuses_:Vector.<ObjectStatusData>;

        public function _0_l(_arg1:uint){
            this.statuses_ = new Vector.<ObjectStatusData>();
            super(_arg1);
        }
        override public function parseFromInput(_arg1:IDataInput):void{
            var _local3:int;
            this.tickId_ = _arg1.readInt();
            this.tickTime_ = _arg1.readInt();
            this.dateTime_ = _arg1.readInt();
            var _local2:int = _arg1.readShort();
            _local3 = _local2;
            while (_local3 < this.statuses_.length)
            {
                _wW_._ay(this.statuses_[_local3]);
                _local3++;
            }
            this.statuses_.length = Math.min(_local2, this.statuses_.length);
            while (this.statuses_.length < _local2)
            {
                this.statuses_.push((_wW_._B_1(ObjectStatusData) as ObjectStatusData));
            }
            _local3 = 0;
            while (_local3 < _local2)
            {
                this.statuses_[_local3].parseFromInput(_arg1);
                _local3++;
            }
        }
        override public function toString():String{
            return (formatToString("NEW_TICK", "tickId_", "tickTime_", "statuses_"));
        }

    }
}//package ServerPackets

