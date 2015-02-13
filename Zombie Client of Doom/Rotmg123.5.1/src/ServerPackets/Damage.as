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

//ServerPackets.Damage

package ServerPackets{

    import flash.utils.IDataInput;


    public class Damage extends ServerPacket {

        public var targetId_:int;
        public var effects_:Vector.<uint>;
        public var damageAmount_:int;
        public var kill_:Boolean;
        public var bulletId_:uint;
        public var objectId_:int;

        public function Damage(_arg1:uint){
            this.effects_ = new Vector.<uint>();
            super(_arg1);
        }
        override public function parseFromInput(_arg1:IDataInput):void{
            this.targetId_ = _arg1.readInt();
            this.effects_.length = 0;
            var _local2:int = _arg1.readUnsignedByte();
            var _local3:uint;
            while (_local3 < _local2)
            {
                this.effects_.push(_arg1.readUnsignedByte());
                _local3++;
            }
            this.damageAmount_ = _arg1.readUnsignedShort();
            this.kill_ = _arg1.readBoolean();
            this.bulletId_ = _arg1.readUnsignedByte();
            this.objectId_ = _arg1.readInt();
        }
        override public function toString():String{
            return (formatToString("DAMAGE", "targetId_", "effects_", "damageAmount_", "kill_", "bulletId_", "objectId_"));
        }

    }
}//package ServerPackets

