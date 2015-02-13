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

//ClientPackets._W_c

package ClientPackets{
    import com.company.assembleegameclient.net.messages.data.Position;

    import com.company.assembleegameclient.net.messages.data.TimedPosition;
    import flash.utils.IDataOutput;


    public class MovePacket extends ClientPacket {

        public var tickId_:int;
        public var time_:int;
        public var newPosition_:Position;
        public var records_:Vector.<TimedPosition>;

        public function MovePacket(_arg1:uint){
            this.newPosition_ = new Position();
            this.records_ = new Vector.<TimedPosition>();
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            _arg1.writeInt(this.tickId_);
            _arg1.writeInt(this.time_);
            this.newPosition_.writeToOutput(_arg1);
            _arg1.writeShort(this.records_.length);
            var _local2:int;
            while (_local2 < this.records_.length)
            {
                this.records_[_local2].writeToOutput(_arg1);
                _local2++;
            }
        }
        override public function toString():String{
            return (formatToString("MOVE", "tickId_", "time_", "newPosition_", "records_"));
        }

    }
}//package ClientPackets

