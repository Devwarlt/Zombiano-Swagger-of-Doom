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

//ServerPackets._8_

package ServerPackets{
    import flash.utils.ByteArray;
    import flash.utils.IDataInput;

    public class _8_ extends ServerPacket {

        public var name_:String;
        public var host_:String;
        public var port_:int;
        public var gameId_:int;
        public var keyTime_:int;
        public var key_:ByteArray;

        public function _8_(_arg1:uint){
            this.key_ = new ByteArray();
            super(_arg1);
        }
        override public function parseFromInput(_arg1:IDataInput):void{
            this.name_ = _arg1.readUTF();
            this.host_ = _arg1.readUTF();
            this.port_ = _arg1.readInt();
            this.gameId_ = _arg1.readInt();
            this.keyTime_ = _arg1.readInt();
            var _local2:int = _arg1.readShort();
            this.key_.length = 0;
            _arg1.readBytes(this.key_, 0, _local2);
        }
        override public function toString():String{
            return (formatToString("RECONNECT", "name_", "host_", "port_", "gameId_", "keyTime_", "key_"));
        }

    }
}//package ServerPackets

