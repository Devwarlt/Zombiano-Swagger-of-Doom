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

//ClientPackets.HelloPacket

package ClientPackets{
import com.company.assembleegameclient.parameters.Parameters;

import flash.utils.ByteArray;
    import flash.utils.IDataOutput;

    public class HelloPacket extends ClientPacket {

		public var Copyright:String;
        public var buildVersion_:String;
        public var gameId_:int = 0;
        public var guid_:String;
        public var password_:String;
        public var secret_:String;
        public var keyTime_:int = 0;
        public var key_:ByteArray;
        public var mapInfo:String;
        public var entrytag:String = "";
        public var gameNetwork:String = "";
        public var gameNetworkUserId:String = "";
        public var playPlatform:String = "";

        public function HelloPacket(_arg1:uint){
			this.Copyright = String("");
            this.buildVersion_ = String("");
            this.guid_ = String("");
            this.password_ = String("");
            this.secret_ = String("");
            this.key_ = new ByteArray();
            this.mapInfo = String("");
            super(_arg1);
        }
        override public function writeToOutput(_arg1:IDataOutput):void{
			_arg1.writeUTF(this.Copyright);
            _arg1.writeUTF(this.buildVersion_);
            _arg1.writeInt(this.gameId_);
            _arg1.writeUTF(this.guid_);
            _arg1.writeUTF(this.password_);
            _arg1.writeUTF(this.secret_);
            _arg1.writeInt(this.keyTime_);
            _arg1.writeShort(this.key_.length);
            _arg1.writeBytes(this.key_);
            _arg1.writeInt(this.mapInfo.length);
            _arg1.writeUTFBytes(this.mapInfo);
            _arg1.writeUTF(this.entrytag);
            _arg1.writeUTF(this.gameNetwork);
            _arg1.writeUTF(this.gameNetworkUserId);
            _arg1.writeUTF(this.playPlatform);
            _arg1.writeBoolean(Parameters.isTesting);
        }
        override public function toString():String{
            return (formatToString("HELLO", "Copyright", "buildVersion_", "gameId_", "guid_", "password_", "secret_"));
        }

    }
}//package ClientPackets

