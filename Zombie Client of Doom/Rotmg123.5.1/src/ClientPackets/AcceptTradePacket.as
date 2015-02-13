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

//ClientPackets._0A_1

package ClientPackets{

    import flash.utils.IDataOutput;


    public class AcceptTradePacket extends ClientPacket {

        public var myOffer_:Vector.<Boolean>;
        public var yourOffer_:Vector.<Boolean>;

        public function AcceptTradePacket(_arg1:uint){
            this.myOffer_ = new Vector.<Boolean>();
            this.yourOffer_ = new Vector.<Boolean>();
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
            var _local2:int;
            _arg1.writeShort(this.myOffer_.length);
            _local2 = 0;
            while (_local2 < this.myOffer_.length)
            {
                _arg1.writeBoolean(this.myOffer_[_local2]);
                _local2++;
            }
            _arg1.writeShort(this.yourOffer_.length);
            _local2 = 0;
            while (_local2 < this.yourOffer_.length)
            {
                _arg1.writeBoolean(this.yourOffer_[_local2]);
                _local2++;
            }
        }
        override public function toString():String{
            return (formatToString("ACCEPTTRADE", "myOffer_", "yourOffer_"));
        }

    }
}//package ClientPackets

