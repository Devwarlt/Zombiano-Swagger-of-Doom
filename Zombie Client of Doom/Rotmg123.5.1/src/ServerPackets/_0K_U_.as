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

//ServerPackets._0K_U_

package ServerPackets{
    import flash.utils.IDataInput;

    public class _0K_U_ extends ServerPacket {

        public var accountListId_:int;
        public var accountIds_:Vector.<int>;

        public function _0K_U_(_arg1:uint){
            this.accountIds_ = new Vector.<int>();
            super(_arg1);
        }
        override public function parseFromInput(_arg1:IDataInput):void{
            var _local2:int;
            this.accountListId_ = _arg1.readInt();
            this.accountIds_.length = 0;
            var _local3:int = _arg1.readShort();
            _local2 = 0;
            while (_local2 < _local3)
            {
                this.accountIds_.push(_arg1.readInt());
                _local2++;
            }
        }
        override public function toString():String{
            return (formatToString("ACCOUNTLIST", "accountListId_", "accountIds_"));
        }

    }
}//package ServerPackets

