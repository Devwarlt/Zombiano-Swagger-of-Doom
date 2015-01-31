// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//ClientPackets.HelloPacket

package ClientPackets{
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
        }
        override public function toString():String{
            return (formatToString("HELLO", "Copyright", "buildVersion_", "gameId_", "guid_", "password_", "secret_"));
        }

    }
}//package ClientPackets

